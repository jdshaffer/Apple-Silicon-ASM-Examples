// ------------------------------------------------------
// Porting Raspberry Pi ARM code to Apple Silicon
// 2023-01-09
// Jds
//
// Updated -- 2025-06-15
//    - Originally improperly used BL instead of B
//    - BL means "Branch with link" (see relevant example)
//    - Thanks to Peter Hall for pointing this out!
//
// ------------------------------------------------------
// Implementing a Switch in ASM
//
// Change the values in the first line (MOV X2, 1) to
// get different results.
//
// COMPILE  -->  make main
// RUN      -->  ./filename ; echo $?
// ------------------------------------------------------


.global main
.align 4


main:
	MOV   X2, 1                       // Store 1 in X2
	CMP   X2, 0                       // Compare 0 with X2 (1)
	B.EQ  case_0                      // If equal, branch to case_0

	CMP   X2, 1                       // Compare 1 with X2 (1)
	B.EQ  case_1                      // If equal, branch to case_1

	B     case_def                    // Else, branch to case_def (default)


case_0:
	ADRP  X0, output_0@PAGE           // load the string to print
	ADD   X0, X0, output_0@PAGEOFF
	B     end                         // Branch to end


case_1:
	ADRP  X0, output_1@PAGE           // load the string to print
	ADD   X0, X0, output_1@PAGEOFF
	B     end                         // Branch to end


case_def:
	ADRP  X0, output_def@PAGE         // load the string to print
	ADD   X0, X0, output_def@PAGEOFF  // No need to branch to end as we simply
                                     //    fall through.

end:
	B 	_printf                        // print the loaded message
	mov   X16, 1                      // System call to terminate this program
	svc   0


.data
output_0:   .asciz "Case 0 -- They are not equal.\n"
output_1:   .asciz "Case 1 -- They are equal.\n"
output_def: .asciz "Case 2 -- I have no idea.\n"
