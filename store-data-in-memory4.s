// ------------------------------------------------
// Porting Raspberry Pi ARM code to Apple Silicon
// 2023-01-09
// Jds
// ------------------------------------------------
// Storing Data in Memory -- Example 4
//
// (1) Create an array (not in memory)
// (2) Load each array element into a register
//     using memory offsets
// (3) Copy one element for output
//     (You can change the X4 in (MOV X0, X4)
//      to output a different register.)
//
// COMPILE --> make
// RUN --> ./filename ; echo $?
// ------------------------------------------------


.global _start
.align 4


_start:
	ADR	X10, numbers		// Load address of "numbers" array into X10

	LDR X1, [X10]			// Loads value at first  word from address [X10] (1)
	LDR X2, [X10, #4]		// Loads value at second word from address [X10] (2)
	LDR X3, [X10, #8]		// Loads value at third  word from address [X10] (3)
	LDR X4, [X10, #12]		// Loads value at fourth word from address [X10] (4)

	MOV X0, X4				// Copy the data from X4 into X0


_end:
	MOV	X16, #1
	SVC	0


numbers:					// Create an array (not stored in memory)
  .word 1, 2, 3, 4