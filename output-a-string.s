// ------------------------------------------------
// Porting Raspberry Pi ARM code to Apple Silicon
// 2023-01-08
// Jds
// ------------------------------------------------
// Print a string to the standard out (screen)
// ------------------------------------------------


.global _start
.align 2


_start:
	mov	X0, 1					// Tell system to use StdOut (screen)

	adr	X1, helloworld			// Load address of our string
	mov	X2, 13					// Length of message to print

	mov	X16, 4					// Call system to write to StdOut
	svc	0						// Call kernel to write to StdOut


_end:							// Split this off to a new label for clarity
	mov	X0, 0					// Return 0
	mov	X16, 1					// System call to terminate this program
	svc	0						// Kernel call to terminate the program


helloworld:	.ascii	"Hello World!\n"