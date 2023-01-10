// ------------------------------------------------
// Porting Raspberry Pi ARM code to Apple Silicon
// 2023-01-09
// Jds
// ------------------------------------------------
// printf -- Print the value of Pi (a float)
//
// COMPILE  -->  make main
// RUN      -->  ./filename
// ------------------------------------------------


.global main
.align 4


main:
	ADRP	X1, pi@PAGE					// Load the address for our "pi" data
	ADD	X1, X1, pi@PAGEOFF
	LDR	D1, [X1]						// Store the contents of X1 to D1

	STR	D1, [SP, #-16]!					// Store the float (D1) onto the stack for printing
	ADRP	X0, format@PAGE				// Load the address of our printf format string
	ADD	X0, X0, format@PAGEOFF

	
end:
	BL	_printf							// print -- reads string from X0 and data from stack
	MOV	X16, #1
	SVC	0


.data
pi: .double 3.141519
format: .asciz	"Pi is %f \n"
