/*
 * hello_world.s
 *
 *  Created on: Oct 21, 2020
 *      Author: chris
 */

  .text
  .global main
  .extern printf
main:
  ldr x0, =hello_str
  bl printf
  br x30
  .data
hello_str:
  .ascii "Hello from 10450958!\n\0"
  .end
