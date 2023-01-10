// ------------------------------------------------
// Porting Raspberry Pi ARM code to Apple Silicon
// 2023-01-08
// Jds
// ------------------------------------------------
// Print a string to the standard out (screen)
//
// NOTE: This example uses system and kernel calls
//       to write to the screen, instead of using
//       printf (shown in other examples).
//
// COMPILE  -->  make
// RUN      -->  ./filename ; echo $?
// ------------------------------------------------


.global _start
.align 2


_start:
	MOV	X0, 1					// Tell system to use StdOut (screen)

	ADR	X1, helloworld			// Load address of our string
	MOV	X2, 13					// Length of message to print

	MOV	X16, 4					// Call system to write to StdOut
	SVC	0						// Call kernel to write to StdOut


_end:							// Split this off to a new label for clarity
	MOV	X0, 0					// Return 0
	MOV	X16, 1					// System call to terminate this program
	SVC	0						// Kernel call to terminate the program


helloworld:	.ascii	"Hello World!\n"