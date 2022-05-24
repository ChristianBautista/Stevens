# Christian Bautista
#
# CS 115 Lab 5: Turtle
#
# Due: September 27, 2019
#
# I pledge my honor that I have abided by the Stevens Honor System.
#
# Code a homebrew version of the tree function in turtle graphics.

import turtle
def svTree(branchLength, depth):
    def recursiveStep(branchLength, depth):
        if depth > 0:
            turtle.forward(branchLength)
            turtle.right(20)
            recursiveStep(branchLength/2, depth-1)
            turtle.left(40)
            recursiveStep(branchLength/2, depth-1)
            turtle.right(20)
            turtle.backward(branchLength)
    if branchLength == 0 or depth == 0:
        turtle.done()
    else:
        recursiveStep(branchLength, depth)
