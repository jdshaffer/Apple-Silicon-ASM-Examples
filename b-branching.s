// -----------------------------------------------------------
// Porting Raspberry Pi ARM code to Apple Silicon
// 2023-01-08
// Jds
//
// Updated -- 2025-06-15
//    - Originally improperly used BL instead of B
//    - BL means "Branch with link" (see relevant example)
//    - Thanks to Peter Hall for pointing this out!
//
// -----------------------------------------------------------
// Branching
//
// COMPILE  -->  make
// RUN      -->  ./filename ; echo $?
// -----------------------------------------------------------


.global _start
.align 2


_start: 
	MOV   X0, 14              // Set X0 to #14
	B     other               // Branch to "other"
	MOV   X0, 11              // (X0 is not set to 11 because of branch)

other:
	MOV   X16, 1              // System call to terminate this program
	SVC   0                   // Call kernel to perform the action
