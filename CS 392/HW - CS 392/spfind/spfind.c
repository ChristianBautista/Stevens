/*******************************************************************************
 * Name        : spfind.c
 * Author      : Ankit Patel & Christian Bautista
 * Date        : 3/30/2021
 * Description : Runs pfind.c, pipes its output to linux's built-in sort function,
 * 					and prints the output.
 * Pledge      : I pledge my honor that I have abided by the Stevens Honor System.
 ******************************************************************************/

#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/wait.h>
#include <unistd.h>
#include <fcntl.h>

int main(int argc, char *argv[]) {

	if (argc == 1) {
		//print usage
		fprintf(stderr,
				"Usage: %s -d <directory> -p <permissions string> [-h]\n",
				argv[0]);
		return EXIT_FAILURE;
	}

	int pfind_to_sort[2], sort_to_parent[2];

	if (pipe(pfind_to_sort) < 0) {
		fprintf(stderr, "Error: Cannot create pipe pfind_to_sort. %s.\n",
				strerror(errno));
		return EXIT_FAILURE;
	}

	if (pipe(sort_to_parent) < 0) {
		fprintf(stderr, "Error: Cannot create pipe sort_to_parent. %s.\n",
				strerror(errno));
		return EXIT_FAILURE;
	}

	pid_t pid[2];
	if ((pid[0] = fork()) == 0) {
		// pfind
		close(pfind_to_sort[0]);

		if (dup2(pfind_to_sort[1], STDOUT_FILENO) == -1) {
			fprintf(stderr, "dup2 failed. %s.\n", strerror(errno));
			close(pfind_to_sort[1]);
			close(sort_to_parent[0]);
			close(sort_to_parent[1]);
			exit(EXIT_FAILURE);
		}

		// Close all unrelated file descriptors.
		close(sort_to_parent[0]);
		close(sort_to_parent[1]);

		char *arg_list[] = { "pfind", argv[1], argv[2], argv[3], argv[4], argv[5],NULL };

		if (execv("pfind", arg_list) < 0) {
			fprintf(stderr, "Error: pfind failed.\n");
			exit(EXIT_FAILURE);
		}

	}

	if ((pid[1] = fork()) == 0) {
		// sort
		close(pfind_to_sort[1]);

		if( dup2(pfind_to_sort[0], STDIN_FILENO) == -1) {
			fprintf(stderr, "dup2 failed. %s.\n", strerror(errno));
			close(pfind_to_sort[0]);
			close(sort_to_parent[0]);
			close(sort_to_parent[1]);
			exit(EXIT_FAILURE);
		}

		close(sort_to_parent[0]);

		if (dup2(sort_to_parent[1], STDOUT_FILENO) == -1) {
			fprintf(stderr, "dup2 failed. %s.\n", strerror(errno));
			close(sort_to_parent[1]);
			close(pfind_to_sort[0]);
			exit(EXIT_FAILURE);
		}

		if (execlp("sort", "sort", NULL) < 0) {
			fprintf(stderr, "Error: sort failed.\n");
			exit(EXIT_FAILURE);
		}

	}

	//parent process:
	close(sort_to_parent[1]);

	if (dup2(sort_to_parent[0], STDIN_FILENO) == -1) {
		fprintf(stderr, "dup2 failed. %s.\n", strerror(errno));
		close(pfind_to_sort[0]);
		close(pfind_to_sort[1]);
		close(sort_to_parent[0]);
		exit(EXIT_FAILURE);
	}

	// Close all unrelated file descriptors.
	close(pfind_to_sort[0]);
	close(pfind_to_sort[1]);

	char buffer[4096];

	//gets number of lines in buffer
	int num_lines = 0;

	while (1) {
		ssize_t count = read(STDIN_FILENO, buffer, sizeof(buffer));
		if (count == -1) {
			if (errno == EINTR) {
				continue;
			} else {
				perror("read()");
				exit(EXIT_FAILURE);
			}
		} else if (count == 0) {
			break;
		} else {

			for (int i = 0; i < (int)count; i++) {
				if (buffer[i] == '\n') {
					num_lines++;
				}
			}
			write(STDOUT_FILENO, buffer, count);
		}
	}
	close(sort_to_parent[0]);

	for (int i = 0; i < argc; i++) {
		if (strcmp(argv[i],"-h") == 0) {
			return EXIT_SUCCESS;
		}

		// EXIT_FAILURE if there are invalid flags
		if (i == 1 && (strcmp(argv[1], "-d") != 0)) {
			return EXIT_FAILURE;
		}

		if (i == 3 && (strcmp(argv[3], "-p") != 0)) {
			return EXIT_FAILURE;
		}

		//EXIT_FAILURE if permissions string is invalid
		if (i == 4) {
			if (strlen(argv[i]) != 9) {
				return EXIT_FAILURE;
			} else {
			    for (int j = 0; j < 9; j++) {
			    	char c = argv[4][j];
			    	if (j == 0 || j == 3 || j == 6) {
			    		if ( !( c== '-' || c == 'r')) {
			    			return EXIT_FAILURE;
			    		}
			    	} else if (j == 1 || j == 4 || j == 7) {
			    		if ( !( c== '-' || c == 'w')) {
			    			return EXIT_FAILURE;
			    		}
			    	} else if (j == 2 || j == 5 || j == 8) {
			    		if ( !( c== '-' || c == 'x')) {
			    			return EXIT_FAILURE;
			    		}
			    	} else {
			    		printf("THIS SHOULD NOT BE PRINTING!\n");
			    	}
			    }
			}
		}

	}
	
	printf("Total matches: %d\n", num_lines);

	// wait for both children
	if (wait(NULL) == -1) {
		fprintf(stderr, "Wait failed. %s.\n", strerror(errno));
	}
	if (wait(NULL) == -1) {
		fprintf(stderr, "Wait failed. %s.\n", strerror(errno));
	}

	return EXIT_SUCCESS;
}
