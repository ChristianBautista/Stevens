/*******************************************************************************
 * Name        : sort.c
 * Author      : Ankit Patel & Christian Bautista
 * Date        : 3/02/2021
 * Description : Uses quicksort to sort a file of either ints, doubles, or
 *               strings.
 * Pledge      : I pledge my honor that I have abided by the Stevens Honor System.
 ******************************************************************************/
#include <errno.h>
#include <getopt.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "quicksort.h"
#include <unistd.h>
#include <ctype.h>

#define MAX_STRLEN     64 // Not including '\0'
#define MAX_ELEMENTS 1024

/**
 * Basic structure of sort.c:
 *
 * Parses args with getopt.
 * Opens input file for reading.
 * Allocates space in a char** for at least MAX_ELEMENTS strings to be stored,
 * where MAX_ELEMENTS is 1024.
 * Reads in the file
 * - For each line, allocate space in each index of the char** to store the
 *   line.
 * Closes the file, after reading in all the lines.
 * Calls quicksort based on type (int, double, string) supplied on the command
 * line.
 * Frees all data.
 * Ensures there are no memory leaks with valgrind. 
 */

#define usage_text "Usage: ./sort [-i|-d] filename\n\
   -i: Specifies the file contains ints.\n\
   -d: Specifies the file contains doubles.\n\
   filename: The file to sort.\n\
   No flags defaults to sorting strings.\n"

/**
 * Reads data from filename into an already allocated 2D array of chars.
 * Exits the entire program if the file cannot be opened.
 */
size_t read_data(char *filename, char **data) {
	// Open the file.
	FILE *fp = fopen(filename, "r");
	if (fp == NULL) {
		//Catches case 3; invalid file name
		fprintf(stderr, "Error: Cannot open '%s'. %s.\n", filename,
				strerror(errno));
		free(data);
		exit(EXIT_FAILURE);
	}

	// Read in the data.
	size_t index = 0;
	char str[MAX_STRLEN + 2];
	char *eoln;
	while (fgets(str, MAX_STRLEN + 2, fp) != NULL) {
		eoln = strchr(str, '\n');
		if (eoln == NULL) {
			str[MAX_STRLEN] = '\0';
		} else {
			*eoln = '\0';
		}
		// Ignore blank lines.
		if (strlen(str) != 0) {
			data[index] = (char*) malloc((MAX_STRLEN + 1) * sizeof(char));
			strcpy(data[index++], str);
		}
	}

	// Close the file before returning from the function.
	fclose(fp);

	return index;
}

int main(int argc, char **argv) {

	//Case 1: Catches the case of no arguments given
	if (argc == 1) {
		printf("%s", usage_text);
		return EXIT_FAILURE;
	}

	//Flag checking; catches the case of invalid flag.
	int opt;
	int iflag = 0;
	int dflag = 0;

	opterr = 0;

	while ((opt = getopt(argc, argv, "id")) != -1) {
		switch (opt) {
		case 'i':
			iflag = 1;
			break;
		case 'd':
			dflag = 1;
			break;
		default:
			//Case 2,7: Catches the case of an invalid flag
			printf("Error: Unknown option '%c' received.\n", optopt);
			printf("%s", usage_text);
			return EXIT_FAILURE;
		}
	}

	// Case 6: Catches the case of too many flags given.
	if (iflag == 1 && dflag == 1) {
		printf("Error: Too many flags specified.\n");
		return EXIT_FAILURE;
	}

	int sflag = 0;
	//If no flags passed, then by default, assume s.
	if (iflag == 0 && dflag == 0) {
		sflag = 1;
	}

	if (sflag && argc > 2) {
		// Case 5: Catches the cases of too many files inputed:
		printf("Error: Too many files specified.\n");
		return EXIT_FAILURE;
	}

	if ((iflag + dflag) == 1 && argc < 3) {
		// Case 4: Catches the case of no file inputed.
		printf("Error: No input file specified.\n");
		return EXIT_FAILURE;
	} else if ((iflag + dflag) == 1 && argc > 3) {
		// Case 5: Catches the cases of too many files inputted:
		printf("Error: Too many files specified.\n");
		return EXIT_FAILURE;
	}

	// argv[ 1 + iflag + dflag ] = argv[1] if no flags given & argv[2] if a flag is given.
	const int file_index = 1 + iflag + dflag;

	char **data = malloc(MAX_ELEMENTS * sizeof(char*));	//stores parsed data from input txt file
	const int line_count = read_data(argv[file_index], data); // populate data

	// Sort the data:

	size_t elem_size = sizeof(char*);	// by default, 1 (1 byte).

	if (sflag == 1) {
		quicksort(data, line_count, elem_size, str_cmp);

		//print sorted array
		for (int i = 0; i < line_count; i++) {
			printf("%s\n", data[i]);
		}

	} else if (iflag == 1) {
		// pass in array of ints
		int *p;
		int data_int[line_count];

		for (int i = 0; i < line_count; i++) {
			data_int[i] = atoi(data[i]);
		}

		p = data_int;
		elem_size = sizeof(int);
		quicksort(p, line_count, elem_size, int_cmp);

		//print sorted array
		for (int i = 0; i < line_count; i++) {
				printf("%d\n", p[i]);
		}

	} else {
		//pass in array of doubles
		double *p;
		double data_double[line_count];

		for (int i = 0; i < line_count; i++) {
			data_double[i] = atof(data[i]);
		}

		p = data_double;
		elem_size = sizeof(double);
		quicksort(p, line_count, elem_size, dbl_cmp);

		//print sorted array
		for (int i = 0; i < line_count; i++) {
				printf("%f\n", p[i]);
		}
	}

	// deallocate memory
	for (int i = 0; i < line_count; i++) {
		free(data[i]);
	}
	free(data);

	return EXIT_SUCCESS;
}
