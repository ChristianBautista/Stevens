#*******************************************************************************
# * Name        : makefile
# * Author      : Ankit Patel & Christian Bautista
# * Date        : 5/7/2021
# * Description : makefile for chatclient.c
# * Pledge      : I pledge my honor that I have abided by the Stevens Honor System.
# ******************************************************************************/

CC     = gcc
C_FILE = $(wildcard *.c)
TARGET = $(patsubst %.c,%,$(C_FILE))
CFLAGS = -O3 -Wall -Werror -pedantic-errors

all: chatserver chatclient

chatserver: chatserver.c
	$(CC) $(CFLAGS) -o chatserver chatserver.c 

chatclient: chatclient.c
	$(CC) $(CFLAGS) -o chatclient chatclient.c 

clean:
	rm -f $(TARGET) $(TARGET).exe
