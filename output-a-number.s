// ------------------------------------------------
// Porting Raspberry Pi ARM code to Apple Silicon
// 2023-01-08
// Jds
// ------------------------------------------------
// MOV -- Move a value (65) into a register (X0)
//
// NOTE: T
//
// COMPILE  -->  make
// RUN      -->  ./filename ; echo $?
// ------------------------------------------------


.global _start
.align 2


_start:
	MOV	X0, 65					// Move the value 65 into the register X0

	MOV	X16, 1					// System call to terminate this program
	SVC	0						// Kernel call to terminate the program
