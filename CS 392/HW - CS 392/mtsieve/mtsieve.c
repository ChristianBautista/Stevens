/*******************************************************************************
 * Name        : mtsieve.c
 * Author      : Ankit Patel & Christian Bautista
 * Date        : 4/23/2021
 * Description : mtsieve programming assignment.
 * Pledge      : I pledge my honor that I have abided by the Stevens Honor System.
 ******************************************************************************/

#include <ctype.h>
#include <errno.h>
#include <getopt.h>
#include <math.h>
#include <pthread.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/sysinfo.h>

int total_count = 0;
pthread_mutex_t lock;

#define usage "Usage: ./mtsieve -s <starting value> -e <ending value> -t <num threads>"
#define MAX(x, y) (((x) > (y)) ? (x) : (y))
#define MIN(x, y) (((x) < (y)) ? (x) : (y))

typedef struct arg_struct {
	int start;
	int end;
} thread_args;

thread_args *targs;

/*
 * return true if int c has 2 or more " 3's " digits. False otherwise.
 */
bool two_or_more_threes(int c) {

	int digit, three_count = 0;

	while (c > 0) {
		digit = c % 10;
		if (digit == 3) {
			three_count++;
		}
		c /= 10;

	}

	return three_count >= 2;
}

void* sieve(void *ptr) {

	thread_args thread_params = *(thread_args*) ptr;

	//Step 1
	int a = thread_params.start, b = thread_params.end;

	// For low_primes: index = the integer. bool val of true = prime.
	int limit = (int) sqrt(b);
	bool *low_primes = malloc(sizeof *low_primes * (limit + 1));

	if (low_primes == NULL) {
		fprintf(stderr, "Error: malloc failed.\n");
		exit(EXIT_FAILURE);
	}

	low_primes[0] = false;
	low_primes[1] = false;
	for (int i = 2; i <= limit; i++) {
		low_primes[i] = true;
	}

	for (int i = 2; i <= (int) sqrt(limit); i++) {
		if (low_primes[i]) {
			for (int j = (int) pow(i, 2.0); j <= limit; j += i) {
				low_primes[j] = false;
			}
		}
	}

	//Step 2:
	// For high_primes: index 0 represents start, 1 = start + 1, 2 = start + 2, ...,
	//		index i = start + i, last index = start + end
	int high_primes_len = b - a + 1;
	bool *high_primes = malloc(sizeof *high_primes * high_primes_len);
	for (int i = 0; i < high_primes_len; i++) {
		high_primes[i] = true;
	}

	//step 3:
	int i;
	for (int p = 0; p <= limit; p++) {
		if (low_primes[p]) {
			i = ceil((double) a / p) * p - a;

			if (a <= p) {
				i += p;
			}

			for (i = i + 0; i < high_primes_len; i += p) {
				high_primes[i] = false;
			}
		}
	}

	int seg_prime_count = 0;

	//step 4:
	for (int i = 0; i < high_primes_len; i++) {

		if (high_primes[i] && two_or_more_threes(i + a)) {
			seg_prime_count++;
		}
	}
	int retval;
	if ((retval = pthread_mutex_lock(&lock)) != 0) {
		fprintf(stderr, "Warning: Cannot lock mutex. %s.\n", strerror(retval));
	}

	total_count += seg_prime_count; /* critical section */

	if ((retval = pthread_mutex_unlock(&lock)) != 0) {
		fprintf(stderr, "Warning: Cannot unlock mutex. %s.\n",
				strerror(retval));
	}

	free(low_primes);
	free(high_primes);
	pthread_exit(NULL);

}

int get_integer(char *input, int *value, char option) {
	long long long_long_i;
	if (sscanf(input, "%lld", &long_long_i) != 1) {
		fprintf(stderr,
				"Error: Invalid input '%s' received for parameter '-%c'.\n",
				input, option);
		return -1;
	}
	*value = (int) long_long_i;
	if (long_long_i != (long long) *value) {
		fprintf(stderr, "Error: Integer overflow for parameter '-%c'.\n",
				option);
		return -1;
	}
	return 0;
}

int main(int argc, char *argv[]) {

	if (argc == 1) {
		fprintf(stderr, "%s\n", usage);
		return EXIT_SUCCESS;
	}

	int opt = 0, start = 0, end = 0, num_threads = 0;
	bool s_bool = false, e_bool = false, nt_bool = false; //set to true if seen.
	opterr = 0; 	//i think i need this.
	while ((opt = getopt(argc, argv, "s:e:t:")) != -1) {

		switch (opt) {
		case 's':
			if (get_integer(optarg, &start, 's') == -1) {
				return EXIT_FAILURE;
			}
			s_bool = true;
			break;
		case 'e':
			if (get_integer(optarg, &end, 'e') == -1) {
				return EXIT_FAILURE;
			}
			e_bool = true;
			break;

		case 't':
			if (get_integer(optarg, &num_threads, 't') == -1) {
				return EXIT_FAILURE;
			}
			nt_bool = true;
			break;

		case '?':
			if (optopt == 'e' || optopt == 's' || optopt == 't') {
				fprintf(stderr, "Error: Option -%c requires an argument.\n",
						optopt);
			} else if (isprint(optopt)) {
				fprintf(stderr, "Error: Unknown option '-%c'.\n", optopt);
			} else {
				fprintf(stderr, "Error: Unknown option character '\\x%x'.\n",
						optopt);
			}
			return EXIT_FAILURE;
		}
	}

	for (int i = optind; i < argc; i++) {
		fprintf(stderr, "Error: Non-option argument '%s' supplied.\n", argv[i]);
		return EXIT_FAILURE;
	}
	if (!s_bool) {
		fprintf(stderr,
				"Error: Required argument <starting value> is missing.\n");
		return EXIT_FAILURE;
	}
	if (start < 2) {
		fprintf(stderr, "Error: Starting value must be >= 2.\n");
		return EXIT_FAILURE;
	}
	if (!e_bool) {
		fprintf(stderr,
				"Error: Required argument <ending value> is missing.\n");
		return EXIT_FAILURE;
	}
	if (end < 2) {
		fprintf(stderr, "Error: Ending value must be >= 2.\n");
		return EXIT_FAILURE;
	}
	if (!(end >= start)) {
		fprintf(stderr, "Error: Ending value must be >= starting value.\n");
		return EXIT_FAILURE;
	}
	if (!nt_bool) {
		fprintf(stderr, "Error: Required argument <num threads> is missing.\n");
		return EXIT_FAILURE;
	}
	if (num_threads < 1) {
		fprintf(stderr, "Error: Number of threads cannot be less than 1.\n");
		return EXIT_FAILURE;
	}
	if (num_threads > (2 * get_nprocs())) {
		fprintf(stderr,
				"Error: Number of threads cannot exceed twice the number of processors(%d).\n",
				get_nprocs());
		return EXIT_FAILURE;
	}

	// thread & mutex stuff:
	int start_cpy = start;
	int nums_to_process = (end - start) + 1;
	int num_processed_per_thread, remainder;
	// num_to_compute = number of primes in [start, end].

	if (nums_to_process < num_threads) {
		num_threads = nums_to_process;
		num_processed_per_thread = 1;
		remainder = 0;
	} else {
		num_processed_per_thread = (int) (nums_to_process / num_threads);
		remainder = nums_to_process % num_threads;
		// remainder is b/w [0, num_threads)
	}

	//malloc for num_threads # of threads
	pthread_t *threads;
	if ((threads = (pthread_t*) malloc(num_threads * sizeof(pthread_t))) == NULL) {
		fprintf(stderr, "Error: Cannot allocate memory for threads.\n");
		return EXIT_FAILURE;
	}

	//malloc num_threads length array of targs.
	if ((targs = (thread_args*) malloc(num_threads * sizeof(thread_args)))
			== NULL) {
		fprintf(stderr,
				"Error: Cannot allocate memory for array of size '%d'. %s.\n",
				num_threads, strerror(errno));
		free(threads);
		return EXIT_FAILURE;
	}

	int retval;

	if ((retval = pthread_mutex_init(&lock, NULL)) != 0) {
		fprintf(stderr, "Error: Cannot create mutex. %s.\n", strerror(retval));
		free(threads);
		free(targs);
		return EXIT_FAILURE;
	}

	printf("Finding all prime numbers between %d and %d.\n", start, end);
	printf("%d segment", num_threads);

	if (num_threads > 1) {
		printf("s:\n");
	} else {
		printf(":\n");
	}

	// create threads w/ start routine of sieve
	for (int i = 0; i < num_threads; i++) {

		int rc;

		if (remainder > 0) {
			rc = 1;
		} else {
			rc = 0;
		}

		targs[i].start = start;
		targs[i].end = start + (num_processed_per_thread - 1) + rc;

		printf("   [%d, %d]\n", targs[i].start, targs[i].end);

		if (remainder != 0) {
			remainder--;
		}

		start = targs[i].end + 1; // update start for next iteration of loop.

		if ((retval = pthread_create(&threads[i], NULL, sieve,
				(void*) (&targs[i]))) != 0) {
			fprintf(stderr, "Error: Cannot create thread %d. %s.\n", i + 1,
					strerror(retval));
			free(targs);
			free(threads);
			return EXIT_FAILURE;
		}
	}

	for (int i = 0; i < num_threads; i++) {
		if (pthread_join(threads[i], NULL) != 0) {
			fprintf(stderr, "Warning: Thread %d did not join properly.\n",
					i + 1);
		}
	}

	if ((retval = pthread_mutex_destroy(&lock)) != 0) {
		fprintf(stderr, "Warning: Cannot destroy mutex. %s.\n",
				strerror(retval));
	}

	free(threads);
	free(targs);

	printf("Total primes between %d and %d with two or more '3' digits: %d\n",
			start_cpy, end, total_count);
	return EXIT_SUCCESS;
}

