/*******************************************************************************
 * Name        : chatclient.c
 * Author      : Ankit Patel & Christian Bautista
 * Date        : 5/07/2021
 * Description : chat client programming assignment.
 * Pledge      : I pledge my honor that I have abided by the Stevens Honor System.
 ******************************************************************************/

#include <arpa/inet.h>
#include <errno.h>
#include <fcntl.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <sys/time.h>
#include <unistd.h>
#include "util.h"

int client_socket = -1;
char username[MAX_MSG_LEN * 10]; /* stores the username */
char inbuf[BUFLEN + 1]; /* stores the incoming message */
char outbuf[MAX_MSG_LEN + 1]; /* stores the outbound message */


/**
 * return 0 if msg is "bye"
 * return 1 if msg is not "bye" OR warning
 */
int handle_stdin() {
	fflush(stdout);
	int getString_RetVal = get_string(outbuf, MAX_MSG_LEN + 1);

	if (getString_RetVal == TOO_LONG) {
		printf("Sorry, limit your message to %d characters.\n", MAX_MSG_LEN);
		return 1;
	} else {
		if (send(client_socket, outbuf, strlen(outbuf), 0) == -1) {
			fprintf(stderr, "Warning: Failed to send message to server. %s.\n", //print warning
					strerror(errno));
		}

		if (strcmp(outbuf, "bye") == 0){
			return 0;
		} else {
			return 1;
		}
	}
}

/**
 * return:
 * 	0	- connection lost
 * 	1	- "bye" received
 * 	2 	- normal; data received normally OR recv failed.
 */
int handle_client_socket() {
	int rec_RetVal = recv(client_socket, inbuf, sizeof inbuf, 0);

	if (rec_RetVal == -1) {
		printf("Warning: Failed to receive incoming message. %s.\n", strerror(errno));
		return 2;
	} else if (rec_RetVal == 0) {
		fprintf(stderr, "\nConnection to server has been lost.\n");
		return 0;
	} else { /* Data received successfully */
		inbuf[rec_RetVal] = '\0';

		if (strcmp(inbuf,"bye") == 0) { /* bye received -> shut down server */
			printf("\nServer initiated shutdown.\n");
			fflush(stdout);
			return 1;
		} else {
			printf("\n%s\n", inbuf);
			printf("[%s]: ", username);
			fflush(stdout);
			return 2;
		}

	}
}

int main(int argc, char *argv[]) {
	if (argc == 1) {
		fprintf(stderr, "Usage: %s <server IP> <port>\n", argv[0]);
		return EXIT_FAILURE;
	}

	int bytes_recvd, retval = EXIT_SUCCESS;
	struct sockaddr_in serv_addr;
	socklen_t addrlen = sizeof(struct sockaddr_in);

	memset(&serv_addr, 0, addrlen);
	int ip_conversion = inet_pton(AF_INET, argv[1], &serv_addr.sin_addr);
	if (ip_conversion <= 0) {
		fprintf(stderr, "Error: Invalid IP address '%s'.\n", argv[1]);
		return EXIT_FAILURE;
	}

	serv_addr.sin_family = AF_INET;

	int port;
	if (!parse_int(argv[2], &port, "port number")) {
		return EXIT_FAILURE;
	}
	if (port < 1024 || port > 65535) {
		fprintf(stderr, "Error: Port must be in range [1024, 65535].\n");
		return EXIT_FAILURE;
	}

	serv_addr.sin_port = htons(port);

	int name_num_bytes;

	while (true) {
		memset(username, 0, sizeof username);
		printf("Enter your username: ");
		fflush(stdout);

		name_num_bytes = read(STDIN_FILENO, username, MAX_MSG_LEN * 10);

		/* remove the trailing '\n' from the user input. */
		if (username[strlen(username) - 1] == '\n') {
			username[strlen(username) - 1] = '\0';
			name_num_bytes--;
		}

		if (name_num_bytes == 0) {
		} else if (name_num_bytes == -1) {
			fprintf(stderr, "Error: Failed to read username from stdin. %s.\n",
					strerror(errno));
			memset(username, 0, sizeof username);
			/* should i return exit_failure? */
		} else if (name_num_bytes > MAX_NAME_LEN) {
			printf("Sorry, limit your username to %d characters.\n",
					MAX_NAME_LEN);
			memset(username, 0, sizeof username);
		} else {
			/* username is valid */
			break;
		}
		fflush(stdout);
	}

	printf("Hello, %s. Let's try to connect to the server.\n", username);

	/* socket stuff */
	if ((client_socket = socket(AF_INET, SOCK_STREAM, 0)) < 0) {
		fprintf(stderr, "Error: Failed to create socket. %s.\n",
				strerror(errno));
		retval = EXIT_FAILURE;
		goto EXIT;
	}

	if (connect(client_socket, (struct sockaddr*) &serv_addr, addrlen) < 0) {
		fprintf(stderr, "Error: Failed to connect to server. %s.\n",
				strerror(errno));
		retval = EXIT_FAILURE;
		goto EXIT;
	}

	if ((bytes_recvd = recv(client_socket, inbuf, BUFLEN - 1, 0)) < 0) {
		fprintf(stderr, "Error: Failed to receive message from server. %s.\n",
				strerror(errno));
		retval = EXIT_FAILURE;
		goto EXIT;
	} else if (bytes_recvd == 0) {
		fprintf(stderr, "All connections are busy. Try again later.\n");
		retval = EXIT_FAILURE;
		goto EXIT;
	}

	/* print welcome message if connected successfully */
	printf("\n%s\n\n",inbuf);

	if (send(client_socket, username, strlen(username), 0) < 0) {
		fprintf(stderr, "Error: Failed to send username to server. %s.\n",
				strerror(errno));
		retval = EXIT_FAILURE;
		goto EXIT;
	}

	// Use two fd_set objects, because select() is destructive.
	fd_set temp_socks, list_socks;
	FD_ZERO(&temp_socks);
	FD_ZERO(&list_socks);
	FD_SET(STDIN_FILENO, &list_socks);
	FD_SET(client_socket,&list_socks);

	printf("[%s]: ",username);
	fflush(stdout);

	while(true) {
		temp_socks = list_socks;

						// 	fdsets : reading, writing, error, timeout value
		if ((/*sel_RV = */select(FD_SETSIZE, &temp_socks, NULL, NULL, NULL)) == -1) {
			fprintf(stderr, "Error: Select Failed. %s.\n", strerror(errno));
			retval = -1;
			goto EXIT;
		}

		/* &temp_socks now contains the fd's that are good for reading. */
		for (int i = 0; i < FD_SETSIZE; i++) {
			if (FD_ISSET(i, &temp_socks)) { /* 'i' is an fd w/ data that can be read */
				if (i == STDIN_FILENO) {
					int stdin_rv = handle_stdin();

					if (stdin_rv == 0){ /* "bye" was entered */
						printf("Goodbye.\n");
						close(STDIN_FILENO);
						retval = 0;
						goto EXIT;
					} else if (stdin_rv == 1) {
						printf("[%s]: ",username);
						fflush(stdout);
					}
				} else if (i == client_socket) {
					int cs_RetVal = handle_client_socket();

					if (cs_RetVal == 0) { // lost connection
						retval = -1;
						goto EXIT;

					} else if (cs_RetVal == 1) { // "bye" received
						retval = 0;
						goto EXIT;
					}
				}

			}
		}

	}	// end of loop


EXIT:
	if (fcntl(client_socket, F_GETFD) >= 0) {
		close(client_socket);
	}
	return retval;

}
