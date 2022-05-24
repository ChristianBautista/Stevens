#*******************************************************************************
# * Name        : makefile
# * Author      : Ankit Patel & Christian Bautista
# * Date        : 4/14/2021
# * Description : makefile for minishell.c
# * Pledge      : I pledge my honor that I have abided by the Stevens Honor System.
# ******************************************************************************/

CC     = gcc
C_FILE = $(wildcard *.c)
TARGET = $(patsubst %.c,%,$(C_FILE))
CFLAGS = -O3 -Wall -Werror -pedantic-errors -pthread 

all:
	$(CC) $(CFLAGS) $(C_FILE) -o $(TARGET) -lm
clean:
	rm -f $(TARGET) $(TARGET).exe
