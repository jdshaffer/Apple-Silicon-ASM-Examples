// ------------------------------------------------
// Porting Raspberry Pi ARM code to Apple Silicon
// 2023-01-08
// Jds
// ------------------------------------------------
// Use EQU to give names to variables
//
// COMPILE  -->  make
// RUN      -->  ./filename ; echo $?
// ------------------------------------------------


.global _start
.align 2

.equ	two, 2


_start: 
	MOV	X0, #two				// Store #2 into X0 using the EQU name


_end:
	MOV	X16, 1					// System call to terminate this program
	SVC	0						// Call kernel to perform the action
