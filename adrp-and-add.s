// -------------------------------------------------
//  ADRP-ADD -- A detailed look at what ADRP-ADD
//              are actually doing (together with
//              scanf and printf) in Apple Silicon
//              (Aarch64) assembly code. 
//
//  COMPILE --> make main
//  RUN --> ./filename
// -------------------------------------------------
//  See additional notes at the end of this file.
// -------------------------------------------------


.global main
.align 4


main:

// -------------------------------------------------------------------------------------------------
//  Preparation -- backup the FP and LP
// -------------------------------------------------------------------------------------------------

	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             // Store x20 and x19 to SP+16
	stp	x29, x30, [sp, #32]             // Store FP and LP to SP+32
	add	x29, sp, #32                    // Calculate address of SP+32 (after FP/LP) and store in X29



// -------------------------------------------------------------------------------------------------
//  The main body of the program -- (int input = 123, scanf, printf)
// -------------------------------------------------------------------------------------------------

	mov x8, #123                        // Store #123 into X8 (int input = 123)


                                        // PREPARE TO READ IN FROM scanf
	add x8, sp, #12						// Calculate the address of SP+12 and store in x8
	str X8, [sp]						// Store the value of X8 (an address) on the stack

	adrp	x19, format@PAGE            // Get the address of the PAGE that contains format and
                                        //    store it in x19
	add	x19, x19, format@PAGEOFF        // Add an offset to get to the actual address of format
                                        //   within the PAGE (the page offset = PAGEOFF)


	mov	x0, x19                         // Copy the address of the format string (stored in x19)
                                        //   into x0
	bl	_scanf                          // scanf uses the formatting pointed to by the address
                                        //   in X0 and stores the input at the address stored
                                        //   at the SP (this address is X8 = SP+12). 


                                        // PREPARE TO WRITE OUT WITH printf
	ldr	x8, [sp, #12]                   // Load contents at address SP+12 (the scanned input) 
                                        //    into X8
	str	x8, [sp]                        // Place the value of X8 onto the stack (this is the
                                        //    data read in by scanf
	mov	x0, x19                         // Copy the address of the format string (stored in x19)
                                        //   into x0
	bl	_printf                         // printf uses the formatting pointed to by the address
                                        //    in X0 and grabs the data to print from the stack 



// -------------------------------------------------------------------------------------------------
//  Tidying up (restore the FP and LP) and terminate the program
// -------------------------------------------------------------------------------------------------
	mov	w0, #0                          // return 0;
	ldp	x29, x30, [sp, #32]             // Load back FP and LP from SP+32
	ldp	x20, x19, [sp, #16]             // Load back x20 and x19 from SP+16
	add	sp, sp, #48                     // Roll back the SP to -(32+16) = -48
	ret                                 // Exit the program



// -------------------------------------------------------------------------------------------------
//  Our data to store (gets placed in memory pages of (4k per page)
// -------------------------------------------------------------------------------------------------
.data
.balign 4
format:   .asciz "%d"






// -------------------------------------------------------------------------------------------------
//   NOTES
// -------------------------------------------------------------------------------------------------
//  The assembly code above is closely based on the output given on an M1 MacBook Air by:
//       gcc -O2 -S tempC.c -0 tempC.s
//
//       ---------------------------
//        tempC.c
//       ---------------------------
//         #include <stdio.h>
//
//         int main(){
//             int input = 123;
//             scanf("%d", &input);
//             printf("%d", input);
//             return 0;
//         }
// ------------------------------------------------------------
//
//   W registers are 32-bit  (on Aarch64)
//   X registers are 64-bit  (on Aarch64)
//
//   ---
//
//   GCC created this output for (int input = 123) and putting it onto the stack.
//   It looks like it started with a 32-bit number then converted it to a 64-bit.
//   I removed the 32-bit number and used a 64-bit number directly. This works fine.
//   Perhaps it is an optimization thing?
//
//		mov	w8, #123            // store 123 into w8 (32-bit register)
//		str	w8, [sp, #12]       // place w8 onto stack at SP+12b
//		add	x8, sp, #12         // calculate address at sp+12 and store in x8 (64-bit)
//		str	x8, [sp]            // place this 64-bit address (x8) onto the stack
//
//   ---
//
//   The initial (mov X8, 123) is actually redundant as we simply overwrite it a few lines
//   later with (add x8, sp, #12).
//
//   ---
//
//   ADRP -- loads the address of a memory location where the .data is stored. The address
//           will be a 4k page in memory which holds the desired data somewhere inside.
//
//           For example, (adrp x19, format@PAGE) will look for the address of the 
//           memory PAGE that contains "format). It will then save the address for that
//           PAGE in x19.
//
//   ADD -- A simple add function. But combined with ADRP, it calculates the exact 
//          memory location of the desired data with the given PAGE.
//
//          For example, (add x19, x19, format@PAGEOFF) will take the PAGEOFF (the
//          page offset = how far inside the page the desired item is from the
//          start of the page) and add it to the address for the start of the page.
//          Thus, X19 = start-of-page-address + how-far-data-is-in-page-offset.
//
// ---------------------------------------------------------------------------------------------------
