// ------------------------------------------------
// Porting Raspberry Pi ARM code to Apple Silicon
// 2023-01-09
// Jds
// ------------------------------------------------
// FADD -- Add two floating point numbers and print
//
// RELATED COMMANDS:
//    FADD = add two floats
//    FSUB = subtract two floats
//    FMUL = multiply two floats
//    FDIV = divide two floats
//    FABS = absolute value
//    FSQR = square root
//
// COMPILE  -->  make
// RUN      -->  ./filename
// ------------------------------------------------


.global main
.align 4


main:
	ADRP	X1, num_1@PAGE		// Load the address of num_1
	ADD	X1, X1, num_1@PAGEOFF
	LDR	D1, [X1]				// Store the contents of X1 to D1

	ADRP	X2, num_2@PAGE		// Load the address of num_2
	ADD	X2, X2, num_2@PAGEOFF
	LDR	D2, [X2]				// Store the contents of X1 to D1

	FADD	D0, D1, D2				// Add the floats (D0 = D1 + D2)


prepare_to_print:
	STR	D0, [SP, #-16]!			// Store the result onto the stack
	ADRP	X0, format@PAGE		// Load the address of our printf format string
	ADD	X0, X0, format@PAGEOFF

	
end:
	BL	_printf					// print -- reads string from X0 and data from stack
	MOV	X16, #1
	SVC	0


.data
num_1: .double 1.234567
num_2: .double 1.111111
format: .asciz "1.2345 + 1.1111 = %f \n"
