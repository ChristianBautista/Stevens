/*
 * taylor.s
 *
 *  Created on: Dec 11, 2020
 *      Author: Christian Bautista
 * I pledge my honor that I have abided by the Stevens Honor System.
 */

  	.text
 	.global main
 	.extern printf
main:
	.global taylor_func
taylor_func:
	sub sp, sp, #16 // make space for LR
	str x30, [sp]	// store LR in stack
	ldr x9, =x		// x9 = address of x
	ldr d0, [x9]	// d0 = x (value)
	ldr x9, =i		// x9 = address of i
	ldr x1, [x9]	// x1 = i (value)
	bl taylor		// call taylor function
output:
	ldr x0, =string	// push the string into x0
	bl printf		// print out value
	ldr x30, [sp]
	add sp, sp, #16
	br x30			// return to caller
	.func taylor
taylor:						// deal with base cases first
	stp x1, x30, [sp, #-16]!// save i and lr on the stack
	mov x9, xzr				// x9 = int representation of sum
	scvtf d1, x9			// d1 = sum (double)
	cbz x1, taylor_end		// if(i==0) return 0
	mov x2, #1				// x2 = memoized factorial = 1
	mov x9, #1				// x9 = int representation of memoized power & sum
	scvtf d2, x9			// d2 = memoized power (double) = 1
	scvtf d1, x9			// d1 = sum (double) = 1
	mov x3, #1				// x3 = j (iterator) = 1
taylor_i:					// computes ith term and adds to sum
	cmp x3, x1				// j<i
	bge taylor_end			// Yes! Jump to taylor_end
	fmul d2, d2, d0			// power = power * x = x^j
	mul x2, x2, x3			// factorial = factorial * j = j!
	scvtf d3, x2			// d3 = factorial (double)
	fdiv d4, d2, d3			// d4 = power/factorial = quotient/jth term
	fadd d1, d1, d4			// sum = sum + jth term
	add x3, x3, #1			// j++
	b taylor_i				// Repeat the loop
taylor_end:
	ldp x1, x30, [sp], #16	// Reload i and lr
	br x30					// Jump to Caller
	.endfunc

	.data
x:
	.double 2.0
i:
	.quad 9
string:
	.ascii "The %d term approximation of e^%f=%f\n\0"

	.end
