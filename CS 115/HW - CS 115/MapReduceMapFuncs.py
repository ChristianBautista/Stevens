# Christian Bautista
#
# CS 115 HW1 - Applications of Map & Reduce
#
# Due: September 20th, 2019
#
# I pledge my honor that I have abided by the Stevens Honor System
#
# Using only map and reduce, codes three different methods

from functools import reduce
from math import factorial
from math import sqrt

def mySum(x,y):
    '''Takes two inputs (x,y) and returns their sum'''
    return x+y

def taylorPolynomialE(x):
    '''Takes a number (x) and divides it by its facotrial'''
    return 1/factorial(x)

def square(x):
    '''Takes a number (x) and squares it'''
    return x*x

def taylorApproxE(lastIter):
    '''Computes an approximation of e using a taylor series up to the last iteration (lastIter)'''
    return reduce(mySum, list(map(taylorPolynomialE, list(range(lastIter+1)))))

def vectorNorm(vect1):
    '''Computes the vector norm of a list (the square root of the sum of squares of the list entries'''
    return sqrt(reduce(mySum, list(map(square, vect1))))

def arithMean(vect1):
    '''Computes the mean of a list of numbers'''
    return reduce(mySum, vect1) / len(vect1)
