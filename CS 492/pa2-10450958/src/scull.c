#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/ioctl.h>

#include "scull.h"
//added wait
#include <sys/types.h>
#include <sys/wait.h>
//added threads
#include <pthread.h>

#define CDEV_NAME "/dev/scull"

/* Quantum command line option */
static int g_quantum;

static void usage(const char *cmd)
{
	//added i to usage
	//added p and t to usage (will add t once p is done)
	printf("Usage: %s <command>\n"
	       "Commands:\n"
	       "  R          Reset quantum\n"
	       "  S <int>    Set quantum\n"
	       "  T <int>    Tell quantum\n"
	       "  G          Get quantum\n"
	       "  Q          Query quantum\n"
	       "  X <int>    Exchange quantum\n"
	       "  H <int>    Shift quantum\n"
		   "  i          Get task info\n"
		   "  p          Create 4 processes\n"
		   "  t          Create 4 threads\n"
	       "  h          Print this message\n",
	       cmd);
}

typedef int cmd_t;

static cmd_t parse_arguments(int argc, const char **argv)
{
	cmd_t cmd;

	if (argc < 2) {
		fprintf(stderr, "%s: Invalid number of arguments\n", argv[0]);
		cmd = -1;
		goto ret;
	}

	/* Parse command and optional int argument */
	cmd = argv[1][0];
	switch (cmd) {
	case 'S':
	case 'T':
	case 'H':
	case 'X':
		if (argc < 3) {
			fprintf(stderr, "%s: Missing quantum\n", argv[0]);
			cmd = -1;
			break;
		}
		g_quantum = atoi(argv[2]);
		break;
	case 'R':
	case 'G':
	case 'Q':
	//added case i
	case 'i':
	//added case p
	case 'p':
	//added case t
	case 't':
	case 'h':
		break;
	default:
		fprintf(stderr, "%s: Invalid command\n", argv[0]);
		cmd = -1;
	}

ret:
	if (cmd < 0 || cmd == 'h') {
		usage(argv[0]);
		exit((cmd == 'h')? EXIT_SUCCESS : EXIT_FAILURE);
	}
	return cmd;
}

//define function declaration
static void *doTwice(void *fd);

static int do_op(int fd, cmd_t cmd)
{
	int ret, q, status;
	struct task_info ti;
	pid_t p;
	pthread_t t[4];

	switch (cmd) {
	case 'R':
		ret = ioctl(fd, SCULL_IOCRESET);
		if (ret == 0)
			printf("Quantum reset\n");
		break;
	case 'Q':
		q = ioctl(fd, SCULL_IOCQQUANTUM);
		printf("Quantum: %d\n", q);
		ret = 0;
		break;
	case 'G':
		ret = ioctl(fd, SCULL_IOCGQUANTUM, &q);
		if (ret == 0)
			printf("Quantum: %d\n", q);
		break;
	case 'T':
		ret = ioctl(fd, SCULL_IOCTQUANTUM, g_quantum);
		if (ret == 0)
			printf("Quantum set\n");
		break;
	case 'S':
		q = g_quantum;
		ret = ioctl(fd, SCULL_IOCSQUANTUM, &q);
		if (ret == 0)
			printf("Quantum set\n");
		break;
	case 'X':
		q = g_quantum;
		ret = ioctl(fd, SCULL_IOCXQUANTUM, &q);
		if (ret == 0)
			printf("Quantum exchanged, old quantum: %d\n", q);
		break;
	case 'H':
		q = ioctl(fd, SCULL_IOCHQUANTUM, g_quantum);
		printf("Quantum shifted, old quantum: %d\n", q);
		ret = 0;
		break;
	//added case i
	case 'i':
		ret = ioctl(fd, SCULL_IOCIQUANTUM, &ti);
		//print out all information received from the driver
		printf("state %ld, stack %p, cpu %d, prio %d, sprio %d, nprio %d, rtprio %d, pid %d, tgid %d, nv %lu, niv %lu\n", ti.state, ti.stack, ti.cpu, ti.prio, ti.static_prio, ti.normal_prio, ti.rt_priority, ti.pid, ti.tgid, ti.nvcsw, ti.nivcsw);
		break;
	//added case p
	case 'p':
		//Create 4 child processes that call case i twice
		//All 4 processes will run concurrently
		//Parent exits after all 4 processes have finished
		//create 4 child processes
		p = fork();
		if(p!=0) {
			p = fork();
		}
		if(p!=0) {
			p = fork();
		}
		if(p!=0) {
			p = fork();
		}
		if(p==0) {
			//child process
			//call case i twice
			do_op(fd, 'i');
			do_op(fd, 'i');
			exit(0);
		}
		//wait for all child processes to finish
		while(wait(&status)>0);
		ret = 0;
		break;
	//added case t
	case 't':
		//create 4 threads that will run case i twice
		for(int i=0; i<4; i++) {
			//create thread that will use the doTwice and passes fd as argument
			pthread_create(&t[i], NULL, doTwice, (void *) &fd);
		}
		//wait for all threads to finish
		for(int i=0; i<4; i++) {
			pthread_join(t[i], NULL);
		}
		ret = 0;
		break;
	default:
		/* Should never occur */
		abort();
		ret = -1; /* Keep the compiler happy */
	}

	if (ret != 0)
		perror("ioctl");
	return ret;
}

//thread function
static void *doTwice(void *fd)
{
	//run case i in do_op twice using arg as fd
	do_op((*(int *)fd), 'i');
	do_op((*(int *)fd), 'i');
	return NULL;
}

int main(int argc, const char **argv)
{
	int fd, ret;
	cmd_t cmd;

	cmd = parse_arguments(argc, argv);

	fd = open(CDEV_NAME, O_RDONLY);
	if (fd < 0) {
		perror("cdev open");
		return EXIT_FAILURE;
	}

	printf("Device (%s) opened\n", CDEV_NAME);

	ret = do_op(fd, cmd);

	if (close(fd) != 0) {
		perror("cdev close");
		return EXIT_FAILURE;
	}

	printf("Device (%s) closed\n", CDEV_NAME);

	return (ret != 0)? EXIT_FAILURE : EXIT_SUCCESS;
}
