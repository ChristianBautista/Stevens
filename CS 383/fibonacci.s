/*
 * fibonacci.s
 *
 *  Created on: Nov 2, 2020
 *      Author: Christian Bautista
 */

 	.text
 	.global main
 	.extern printf
main:
 	.global fib_func
fib_func:
	ldr x0, =stack	// load sp
	mov sp, x0		// move stack into sp
	sub sp, sp, #16 // make space for LR
	str x30, [sp]	// store LR in stack
	mov x0, #1		// x0 = fibCurrent (answer)
	mov x1, #0		// x1 = fibPrevious
	ldr x8, =n		// x8 = address of n
	ldr x2, [x8]	// x2 = n (value)
	bl fib			// call fib function
output:
	mov x1, x2		// move n into x1
	mov x2, x0		// move fibCurrent into x2
	ldr x0, =string	// push the string into x0
	bl printf		// print out value
	ldr x30, [sp]
	add sp, sp, #16
	br x30			// return to caller

	.func fib
fib:						// Called from bl fib line
	stp x2, x30, [sp, #-16]!// Save n and lr on the stack
	cmp x2, #1				// if(n == 1)
	beq fib_end				// No! Call the recursive func
	add x0, x0, x1			// fibCurrent = fibCurrent + fibPrevious
	sub x1, x0, x1			// fibPrevious = fibCurrent - fibPrevious
	sub x2, x2, #1			// n--
	bl fib					// Jump back to top
fib_end:
	ldp x2, x30, [sp], #16	// Reload n and lr
	br x30					// Jump to Caller
	.endfunc

 	.data
n:
 	.quad 9
string:
	.ascii "fibonacci(%d)=%d\n\0"

	.bss
	.align 8
out:
	.space 8
	.align 16
	.space 4096
stack:
	.space 16
	.end
