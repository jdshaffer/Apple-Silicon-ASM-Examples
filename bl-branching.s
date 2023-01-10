// ------------------------------------------------
// Porting Raspberry Pi ARM code to Apple Silicon
// 2023-01-08
// Jds
// ------------------------------------------------
// Branching
//
// COMPILE  -->  make
// RUN      -->  ./filename ; echo $?
// ------------------------------------------------


.global _start
.align 2


_start: 
	MOV	X0, 14					// Set X0 to #14
	BL	other					// Branch to "other"
	MOV	X0, 11					// (X0 is not set to 11 because of branch)

other:
	MOV	X16, 1					// System call to terminate this program
	SVC	0						// Call kernel to perform the action
