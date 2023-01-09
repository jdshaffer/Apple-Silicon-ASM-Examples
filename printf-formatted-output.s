// ------------------------------------------------
// Porting Raspberry Pi ARM code to Apple Silicon
// 2023-01-09
// Jds
// ------------------------------------------------
// printf -- Formatted printing of several ints
//
// Variables to be picked up and printed using
// printf need to be placed on the stack in 
// reverse order (LIFO)
//
// RUN --> ./filename
// ------------------------------------------------


.global main
.align 4


main:
	mov	x1, 11					// Store 11 in X1
	mov	x2, 12					// Store 12 in X2
	mov	x3, 13					// Store 13 in X3
	mov	x4, 14					// Store 14 in X4
	mov	X5, 15					// Store 15 in X5

	str X5, [SP, #-16]!			// Put each item on the stack BACKWARDS
	stp	X3, X4, [SP, #-16]!		// (to be read off backwards -- LIFO)
	stp	X1, X2, [SP, #-16]!

	adrp	X0, ptfStr@PAGE		// Load our printf format str
	add	X0, X0, ptfStr@PAGEOFF

	
end:
	BL	_printf					// printf reads string from X0, but data from stack
	mov	X16, #1
	svc	0


.data
	ptfStr: .asciz	"The numbers are %d and %d and %d and %d and %d. \n"

