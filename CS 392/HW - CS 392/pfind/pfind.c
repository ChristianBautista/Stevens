/*******************************************************************************
 * Name        : pfind.c
 * Author      : Ankit Patel & Christian Bautista
 * Date        : 3/16/2021
 * Description : Permission Finder
 * Pledge      : I pledge my honor that I have abided by the Stevens Honor System.
 *  ******************************************************************************/
 
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <dirent.h>
#include <sys/stat.h>
#include <errno.h>
#include <string.h>
#include "permission.h"		// include the header file

#define USAGE "Usage: ./pfind -d <directory> -p <permissions string> [-h]\n"

int main (int argc, char* argv[]) {

	if (argc == 1) {
		printf("%s",USAGE);
		return EXIT_FAILURE;
	}


	int d = 0, p = 0;
	opterr = 0;
	int opt;
	while ((opt = getopt(argc, argv, ":d:p:h")) != -1) {
		switch (opt) {
		case 'd':
			d = 1;
			break;
		case 'p':
			p = 1;
			break;
		case 'h':
			printf("%s",USAGE);
			return EXIT_SUCCESS;
			break;
		default:

			//Catches the case of an invalid flag
			if (optopt == 'd') {
				d = 1;
				break;
			} else if (optopt == 'p') {
				p = 1;
				break;
			} else {
				fprintf(stderr,"Error: Unknown option '-%c' received.\n", optopt);
							return EXIT_FAILURE;
			}

		}
	}

	//Catches the case of no -d flag
	if (d == 0 || argv[2] == NULL) {
		printf("Error: Required argument -d <directory> not found.\n");
		return EXIT_FAILURE;
	}

	//Catches the case of no -d flag
	if (p == 0 || argv[4] == NULL) {
		printf("Error: Required argument -p <permissions string> not found.\n");
		return EXIT_FAILURE;
	}

    struct stat statbuf;

    // directory at index 2 and pstring at index 4
    if (stat(argv[2], &statbuf) < 0) { //Catches the case of invalid file/dir name
        fprintf(stderr, "Error: Cannot stat '%s'. %s.\n", argv[2],
                strerror(errno));
        return EXIT_FAILURE;
    } else if (!S_ISDIR(statbuf.st_mode)) { //Catches the case of input not being a directory.
        fprintf(stderr, "Error: Cannot stat '%s'. No such file or directory.\n", argv[2]);
        return EXIT_FAILURE;
    }

    	//Check if pstring is a valid permission string.
    if (strlen(argv[4]) != 9) {
    	fprintf(stderr, "Error: Permissions string '%s' is invalid.\n", argv[4]);
    	return EXIT_FAILURE;
    }

    int valid_pstring = 1;
    char c;
    for (int i = 0; i < 9; i++) {
    	c = argv[4][i];
    	if (i == 0 || i == 3 || i == 6) {
    		if ( !( c== '-' || c == 'r')) {
    			valid_pstring = 0;
    		}
    	} else if (i == 1 || i == 4 || i == 7) {
    		if ( !( c== '-' || c == 'w')) {
    			valid_pstring = 0;
    		}
    	} else if (i == 2 || i == 5 || i == 8) {
    		if ( !( c== '-' || c == 'x')) {
    			valid_pstring = 0;
    		}
    	} else {
    		printf("THIS SHOULD NOT BE PRINTING!\n");
    	}
    }

    if (!valid_pstring) {
    	fprintf(stderr, "Error: Permissions string '%s' is invalid.\n", argv[4]);
    	return EXIT_FAILURE;
    }

	
	char path[PATH_MAX];
    if (realpath(argv[2], path) == NULL) {
        fprintf(stderr, "Error: Cannot get full path of file '%s'. %s.\n",
                argv[2], strerror(errno));
        return EXIT_FAILURE;
    }
    DIR *dp;
    if ((dp = opendir(path)) == NULL) {
        fprintf(stderr, "Error: Cannot open directory '%s'. %s.\n",
                path, strerror(errno));
        return EXIT_FAILURE;
    }

    // If an error hasnt been thrown, the input has been successfully parsed.
    char full_filename[PATH_MAX+1];
    size_t pathlen = 0;

    full_filename[0] = '\0';
    if (strcmp(path, "/")) {
        strncpy(full_filename, path, PATH_MAX);
    }
    // Add + 1 for the trailing '/' that we're going to add.
    pathlen = strlen(full_filename) + 1;
    full_filename[pathlen - 1] = '/';
    full_filename[pathlen] = '\0';

    closedir(dp);

	if(findPerms(argv[4],full_filename,pathlen)==1) {
		return EXIT_FAILURE;
	} else {
		return EXIT_SUCCESS;
	}
}
