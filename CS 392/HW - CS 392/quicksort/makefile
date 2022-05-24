##
# Name        : makefile
# Author      : Ankit Patel & Christian Bautista
# Date        : 3/02/2021
# Description : makefile for sort.
# Pledge      : I pledge my honor that I have abided by the Stevens Honor System.
##

sort: sort.o quicksort.o
	gcc sort.o quicksort.o -o sort
sort.o: sort.c
	gcc -Wall -Werror -pedantic-errors -c sort.c
quicksort.o: quicksort.c quicksort.h
	gcc -Wall -Werror -pedantic-errors -c quicksort.c
clean:
	rm -f *.o sort sort.exe