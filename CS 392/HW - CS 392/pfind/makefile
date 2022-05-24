##
# Name        : makefile
# Author      : Ankit Patel & Christian Bautista
# Date        : 3/16/2021
# Description : makefile for pfind.c
# Pledge      : I pledge my honor that I have abided by the Stevens Honor System.
##
#

pfind: pfind.o permission.o
	gcc pfind.o permission.o -o pfind
pfind.o: pfind.c
	gcc -Wall -Werror -pedantic-errors -c pfind.c
permission.o: permission.c permission.h
	gcc -Wall -Werror -pedantic-errors -c permission.c
clean:
	rm -f *.o pfind pfind.exe