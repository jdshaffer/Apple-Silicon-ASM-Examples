// ------------------------------------------------
// Porting Raspberry Pi ARM code to Apple Silicon
// 2023-01-09
// Jds
// ------------------------------------------------
// FCMP -- Compare two floating point numbers
//
// NOTE: Change the values in .data to test
//       different floating point numbers
//
// COMPILE  -->  make main
// RUN      -->  ./filename
// ------------------------------------------------


.global main
.align 4


main:
	ADRP	X1, num_1@PAGE			// Load the address of num_1
	ADD	X1, X1, num_1@PAGEOFF
	LDR	D1, [X1]					// Store the contents of X1 to D1

	ADRP	X2, num_2@PAGE			// Load the address of num_2
	ADD	X2, X2, num_2@PAGEOFF
	LDR	D2, [X2]					// Store the contents of X1 to D1

	FCMP	D1, D2					// Compare the floats D1 and D2
	B.EQ	nums_equal				// If equal, branch to nums_equal
	B.NE	nums_not_equal			// If not equal, branch to nums_not_equal


nums_equal:
	ADRP	X0, eq_message@PAGE		// Load the address of our printf format string
	ADD	X0, X0, eq_message@PAGEOFF
	BL end							// Branch to end


nums_not_equal:
	ADRP	X0, ne_message@PAGE		// Load the address of our printf format string
	ADD	X0, X0, ne_message@PAGEOFF	// Do not need to branch as falls through to end


end:
	BL	_printf						// print -- reads string from X0 and data from stack
	MOV	X16, #1
	SVC	0



.data
num_1: .double 1.234567
num_2: .double 1.111111
eq_message: .asciz "The numbers are equal.\n"
ne_message: .asciz "The numbers are not equal.\n"
