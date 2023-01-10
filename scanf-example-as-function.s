// ------------------------------------------------
// Porting Raspberry Pi ARM code to Apple Silicon
// 2023-01-09
// Jds
// ------------------------------------------------
// Use scanf and printf to interact with the user
//
// NOTE: This is the same program as scanf-example.s
//       However, the scanf code has been moved
//       to a function (a branch).
//       This allows a demonstration of backing
//       up the frame pointer (X29) and link
//       register (X30) when jumping into a 
//       function, and then restoring them
//       when returning from the function.
//
// COMPILE --> make main
// RUN --> ./filename
// ------------------------------------------------


.global main
.align 4


main:
    										// --- PRINT INITIAL MESSAGE ---
	ADRP	X0, message@PAGE				// Load the address of the format string for printf
	ADD	X0, X0, message@PAGEOFF
	BL	_printf								// print using formatted string in X0 and data in stack


											// --- READ USER INPUT USING SCANF ---
    BL read_from_keyboard					// Branch to the function read_from_keyboard


											// -- READ NUMBER FROM DATA AND MOVE TO STACK FOR PRINTING ---
	ADRP	X10, num@PAGE					// Load the address of the number to print
	ADD	X10, X10, num@PAGEOFF
	LDR X1, [X10]							// Load the value from address X10 into X1
	STR	X1, [SP, #-16]!						// Store the number onto the stack for printing


											// --- LOAD THE PRINTF FORMATTED MESSAGE ---
	ADRP	X0, output_format@PAGE			// Load the address of our printf format string
	ADD	X0, X0, output_format@PAGEOFF



end:
	BL	_printf								// print -- reads string from X0 and data from stack
	MOV	X16, #1
	SVC	0



read_from_keyboard:
    STP X29, X30, [SP, #-16]!				// Backup frame pointer (X29) and link register (X30)
											// (wise to do when bouncing between functions)
    ADRP    X0, input_format@PAGE			// Load the formatting information into X0
    ADD X0, X0, input_format@PAGEOFF

    ADRP    X1, num@PAGE					// Load the destination address into the stack (X1-->SP)
    ADD X1, X1, num@PAGEOFF
    STR X1, [SP, #-16]!						// Put address of num on the stack (just like with printf)
    BL _scanf								// Scanf using format in X0 and data in stack
    ADD SP, SP, #16							// Back up the SP (take off the num data ???)

    LDP X29, X30, [SP], #16					// Restore frame pointer (X29) and link register (X30)
    										//    and back up the SP 16 bytes per register
	RET



.data
.balign 4
message:    .asciz "What is your favorite number?\n"
.balign 4
num:    .word 32
.balign 4
input_format:   .asciz "%d"
.balign 4
output_format:  .asciz "Your favorite number is %d \n"
