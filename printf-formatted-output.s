// ------------------------------------------------
// Porting Raspberry Pi ARM code to Apple Silicon
// 2023-01-09
// Jds
// ------------------------------------------------
// printf -- Formatted printing of several ints
//
// NOTE: Variables to be picked up and printed using
//       printf need to be placed on the stack in 
//       reverse order (LIFO)
//
// COMPILE  -->  make main
// RUN      -->  ./filename
// ------------------------------------------------


.global main
.align 4


main:
	MOV	x1, 11						// Store 11 in X1
	MOV	x2, 12						// Store 12 in X2
	MOV	x3, 13						// Store 13 in X3
	MOV	x4, 14						// Store 14 in X4
	MOV	X5, 15						// Store 15 in X5

	STR X5, [SP, #-16]!				// Put each item on the stack BACKWARDS
	STP	X3, X4, [SP, #-16]!			// (to be read off backwards -- LIFO)
	STP	X1, X2, [SP, #-16]!

	ADRP	X0, ptfStr@PAGE			// Load our printf format str
	ADD	X0, X0, ptfStr@PAGEOFF

	
end:
	BL	_printf						// printf reads string from X0, but data from stack
	MOV	X16, #1
	SVC	0


.data
ptfStr: .asciz	"The numbers are %d and %d and %d and %d and %d. \n"

