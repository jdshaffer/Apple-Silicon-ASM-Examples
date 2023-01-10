// --------------------------------------------------------
// Porting Raspberry Pi ARM code to Apple Silicon
// 2023-01-10
// Jds
// --------------------------------------------------------
// scanf -- Read in two numbers and return the sum
//
// FUN NOTE: This program was written in a VR
//           environment using Immersed running
//           on an Oculus Quest 2. 
//           It took about 3x longer to write 
//           because of it, and gave me a headache.
//
//                            o_O
//
// COMPILE  -->  make main
// RUN      -->  ./filename
// --------------------------------------------------------


.global main
.align 4


main:
										// --- PRINT THE FIRST MESSAGE ---
	ADRP	X0, get_val_1@PAGE			// Load the address of the formatted output 
	ADD	X0, X0, get_val_1@PAGEOFF
	BL	_printf							// Print the formatted output


										// --- READ IN THE FIRST NUMBER ---
	ADRP	X0, pattern@PAGE			// Load the address of pattern to scan
	ADD	X0, X0, pattern@PAGEOFF
	ADRP	X1, num_1@PAGE				// Load the address of where to store num_1
	ADD	X1, X1, num_1@PAGEOFF
	STR	X1, [SP, #-16]!					// Put this address on the stack for scanf
	BL	_scanf							// Scan the formatted input


										// --- PRINT THE SECOND MESSAGE ---
	ADRP	X0, get_val_2@PAGE			// Load the address of the formatted output 
	ADD	X0, X0, get_val_2@PAGEOFF
	BL	_printf							// Print the formatted output


										// --- READ IN THE SECOND NUMBER ---
	ADRP	X0, pattern@PAGE			// Load the address of pattern to scan
	ADD	X0, X0, pattern@PAGEOFF
	ADRP	X1, num_2@PAGE				// Load the address of where to store num_1
	ADD	X1, X1, num_2@PAGEOFF
	STR	X1, [SP, #-16]!					// Put this address on the stack for scanf
	BL	_scanf							// Scan the formatted input


										// --- LOAD THE TWO SAVED NUMBERS FOR USE ---
	ADRP	X11, num_1@PAGE				// Load the address of num_1
	ADD	X11, X11, num_1@PAGEOFF
	LDR	X1, [X11]						// Copy num_1 from address [X11] to X1

	ADRP	X12, num_2@PAGE				// Load the address of num_2
	ADD	X12, X12, num_2@PAGEOFF
	LDR	X2, [X12]						// Copy num_1 from address [X12] to X2

	BL	sum_vals						// Send num_1 (X1) and num_2 (X2) to be summed


										// --- PRINT THE RESULTS ---
	STR	X3, [SP, #-16]!					// Load all three numbers (X1, X2, X3) onto the
	STP	X1, X2, [SP, #-16]!				// stack in reverse order

	ADRP	X0, output@PAGE				// Load the address of the formatted output 
	ADD	X0, X0, output@PAGEOFF

	BL	_printf							// Print the data on the stack using the
										//  formatted string in X0

end:
	MOV	X16, #1
	SVC	0


sum_vals:
	ADD	X3, X1, X2						// Add the values in X2 and X1 and store in X3
	RET									// Return back to where we left off (in main)



.data
.balign 4
get_val_1: .asciz "Enter a number between 0 and 255: "
.balign 4
get_val_2: .asciz "Enter another  between 0 and 255: "
.balign 4
pattern:   .asciz "%d"
.balign 4
num_1:     .word  0
.balign 4
num_2:     .word  0
.balign 4
sum:       .word  0
.balign 4
output:    .asciz "\n  %d + %d = %d\n\n"
.balign 4
lr_bu:     .word  0
.balign 4
lr_bu_2:   .word  0
