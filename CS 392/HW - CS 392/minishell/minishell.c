/*******************************************************************************
 * Name        : minishell.c
 * Author      : Ankit Patel & Christian Bautista
 * Date        : 4/14/2021
 * Description : Minishell programming assignment.
 * Pledge      : I pledge my honor that I have abided by the Stevens Honor System.
 ******************************************************************************/

#include <ctype.h>
#include <errno.h>
#include <limits.h>
#include <pwd.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/wait.h>

//Color Macros
#define BRIGHTBLUE "\x1b[34;1m"
#define DEFAULT "\x1b[0m"
volatile sig_atomic_t interrupted = false;

/**
 * Signal handler.
 */
void catch_signal(int sig) {
	interrupted = true;
	write(STDOUT_FILENO, "\n", 1);
}


/**
 * returns the number of occurrences of char c in string str
 */
int countChars(char c, char *str) {
	int count=0;

	for (int i = 0; i < strlen(str); i++) {
		if (str[i] == c) {
			count++;
		}
	}
	return count;
}

/*
 * Removes any leading and trailing whitespaces from a string.
 */
void trimSpaces(char *s) {
    char * p = s;
    int l = strlen(p);

    while (isspace(p[l - 1])) {
    	p[--l] = 0;
    }
    while (*p && isspace(*p)) {
    	++p, --l;
    }

    memmove(s, p, l + 1);
}


/*
	Return true if the string starts with prefix, false otherwise.
	Note that prefix might be longer than the string itself.
*/
bool starts_with(const char *str, const char *prefix) {
  if(strncmp(str,prefix,strlen(prefix))==0) {
    return true;
  }
  return false;
}


int main(int argc, char *argv[]) {

	if (argc != 1) {
		fprintf(stderr, "Error: Invalid number of arguments.\n");
		return EXIT_FAILURE;
	}

	/* set up the signal */
	struct sigaction action;
	memset(&action, 0, sizeof(struct sigaction));

	/* Assigns the signal handler of action to be the catch_signal function. */
	action.sa_handler = catch_signal;	/* signal handler */

	if (sigaction(SIGINT, &action, NULL) == -1) {
        fprintf(stderr, "Error: Cannot register signal handler. %s.\n", strerror(errno));
        return EXIT_FAILURE;
    }

	if (sigaction(SIGTERM, &action, NULL) == -1) {
        fprintf(stderr, "Error: Cannot register signal handler. %s.\n", strerror(errno));
        return EXIT_FAILURE;
    }

	char cwdbuf[PATH_MAX]; /* stores the string value of the current working directory */

	while (true) { /* take in & process commands until user exits */

		if (interrupted) {	/* SIGINT signal was received. */
            continue;
        }

		/* get current working directory */
		if (getcwd(cwdbuf, sizeof(cwdbuf)) == NULL) {
			fprintf(stderr, "Error: Cannot get current working directory. %s.\n",
					strerror(errno));
			return EXIT_FAILURE;
		}

		/* print cwd */
		printf("%s[%s%s%s]$ ", DEFAULT, BRIGHTBLUE, cwdbuf, DEFAULT);
		fflush(stdout);

		/* obtain user input & store it in 'inp'. */
		char inp[PATH_MAX];
		/* clears all memory from inp so it can be reused for the next input w/o causing error */
		memset(inp, 0, sizeof inp);


		if (read(STDIN_FILENO, inp, PATH_MAX) < 0) {
			/* don't EXIT_FAILURE if fgets failed because of SIGINT */
			if (!interrupted) {
				fprintf(stderr, "Error: Failed to read from stdin. %s.\n", strerror(errno));
				return EXIT_FAILURE;
			}
		}

		/* inp initially contains a '\n' in addition to '\0'
		 * So, we remove the '\n'. (This makes things simplier later on)  */
		if (inp[strlen(inp)-1] == '\n') {
			inp[strlen(inp)-1] = '\0';
		}

		/* To increase flexibility of the program, all leading & trailing
		 * whitespaces are trimmed from the input. */
		trimSpaces(inp);


		/* Process the user input */
		if (starts_with(inp, "cd ") || (strcmp(inp, "cd")) == 0) {

			if (strcmp(inp,"cd") == 0  || strcmp(inp,"cd ~") == 0) {
				/* case: cd ~ or just cd is entered.
				 * In this case, we go to home directory */

				uid_t user_id = getuid();
				struct passwd *user_info;

				if ( (user_info = getpwuid(user_id)) == NULL) {
					fprintf(stderr, "Error: Cannot get passwd entry. %s.\n", strerror(errno));
				}

				/* user_info.pw_dir - references the user's home directory */
				if (chdir(user_info->pw_dir) == -1) {
					fprintf(stderr, "Error: Cannot change directory to '%s'. %s.\n", user_info->pw_dir, strerror(errno));
				}

			} else {
				/* general cases: "cd ." or "cd .." or "cd [path]" */

				/* removes any extra spaces between 'cd' and the directory argument. */
				trimSpaces(&inp[3]);

				/* path is pointer to cd's argument.
				 * inp is of the form 'cd [path]. path is of the form '[path]'. */
				const char *path = &inp[3];

				/* if [path] contains a space, then there are too many arguments. */
				if (strchr(path, ' ') != NULL) {
					fprintf(stderr, "Error: Too many arguments to cd.\n");
				} else if (chdir(path) == -1) {	/* attempt to change directory */
					/* chdir fails */
					fprintf(stderr, "Error: Cannot change directory to '%s'. %s.\n", path, strerror(errno));
				}
			}

		} else if (starts_with(inp, "exit")) { /* If the user inputs 'exit', then exit the program */
			return EXIT_SUCCESS;
		} else {

			char *args[100];	/* stores all arguments */
			char *argument;		/* for each argument */


			argument = strtok(inp, " ");
			int i = 0;
			while (argument != NULL) {
				args[i] = argument;
				i++;
				argument = strtok(NULL, " ");
			}
			args[i] = NULL;

			pid_t cpid;

			if ((cpid = fork()) < 0) {
				fprintf(stderr, "Error: fork() failed. %s.\n", strerror(errno));
				return EXIT_FAILURE;

			} else if (cpid > 0) { /* parent process */
				int status;
		        do {
		            pid_t w = waitpid(cpid, &status, WUNTRACED | WCONTINUED);
		            if (w == -1) {
		            	if (!interrupted) {
							fprintf(stderr, "Error: wait() failed. %s.\n", strerror(errno));
							break;
		            	} else {
		            		break;
		            	}
		            }

		        } while (!WIFEXITED(status) && !WIFSIGNALED(status));

			} else { /* child process */
				if (execvp(args[0], args) < 0) {
					fprintf(stderr, "Error: exec() failed. %s.\n", strerror(errno));
					return EXIT_FAILURE;
				}
			}
		}
		interrupted = false;
	}

	return 0;
}
