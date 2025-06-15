# Apple-Silicon-ASM-Examples
Example Assembly Programs for Apple Silicon (M1)


<br>
tl;dr -- These are self-contained example programs written in assembly for the  Apple M1 chip (Apple Silicon). Use the included makefile and follow the instructions included inside each file to compile and run. <BR><BR>

<hr width = 75%>

### What You Will Find Here
Here are several simple programs written in assembly for Apple's M1 processor (Apple Silicon). Each program is intended to demonstrate some basic assembly instruction or programming concept (such as Loop and Switch). Each are self-contained and can be compiled on an Apple Silicon machine using the included makefile. Compilation instructions and execution instructions are included inside each file.
<BR><BR>

### Using These Files
To try any of these files, download the file of interest and the makefile to your own computer, then use the Terminal to execute the command given inside the file. To run the program, again, use the command given inside the file. Please note, however, that the included makefile expectes to find a file named ***temp.s***. Thus, you will need to either rename the file you wish to compile, or modify the makefile to compile and link the correct filename.

***Example:***<BR>
*file = add.two.values.s* <BR>
(1) Rename to temp.s <BR>
(2) Compile with: *make* <BR>
(3) Run with: *./temp ; echo $?* <BR>
(4) Output given: *20* <BR><BR>

### Sources Used
I originally created this collection of small example programs while watching a series of Assembly programming tutorials on YouTube by Derek Banas. There are four videos in his "[Assembly Language Tutorial"](https://www.youtube.com/watch?v=ViNnfoE56V8)" series. However, this tutorial series is aimed at assembly programming for the Raspberry Pi architecture, not Apple Silicon. 

Seeing as I mostly work on M1 Apple Machines, I had an interest in learning how to take what I had just learned and apply it to the machines I use in my daily life. However, I was not able to find any clear or simple examples of Apple Silicon Assembly (ASM) code. The only readily available examples I could find were found in Alexander von Below's amazing "[HelloSilicon](https://github.com/below/HelloSilicon)" repository on GitHub, though I found them a bit difficult to search through to find the example I needed.

So, in the end, with a lot of googling, the occasional glance at HelloSilicon, a lot of searching through the [ARM Developer](https://developer.arm.com/documentation/ddi0602/2022-12/Base-Instructions) website, a *ton* of trial-and-error, and some last minute help from [Peter Cordes](https://stackoverflow.com/users/224132/peter-cordes) and [Siguza](https://stackoverflow.com/users/2302862/siguza) over at StackOverflow to help me figure out [how scanf works on Apple Silicon](https://stackoverflow.com/questions/75054828/how-to-use-scanf-in-apple-silicon-aarch64-macos-assembly-to-read-in-user-inpu), I managed to port all of my little Raspberry Pi ASM examples over to Apple Silicon ASM. Whew. 

And... after a few years, an error has been found by Peter Hall, who kindly emailed me let me know. According to Mr. Hall, I was using BL (Branch with Link) when I meant to be using B (Branch). The way my two examples were setup still worked as I never expected the program to return to my main function. Based on Mr. Hall's suggestion, I rewrote the Branch examples `b-branching.s` and `b-case-switch.s` to use only B and I created a new example `bl-branch-with-link.s`, which is not found in the original Raspberry Pi examples. Hopefully this new example clearly shows how BL works and a programmer can use it.<BR><BR>

### Why This Repository Exists
I made these example programs publically available in the simple hope that someone else wishing to get started with Apple Silicon ASM programming will not have to go through the same trouble I had in finding easy-to-understand code examples to help them get started. Look at them, tinker with them, and then go one to create bigger and better things!<BR><BR>

### About Me
I'm a simple hobbiest who is interested in learning about a variety of things. I think computers are pretty neat, though I am not a professional programmer. In truth, I am an Associate Professor of English at a university in Japan. I started learning Python about four or five years ago, then I started learning C++ before I quickly switched to C. I enjoy the low-level aspect of working in pure C. This interest led me (only about ten days ago, actually) to take a peek at assembly programming. And thus I watched the four Assebly Language Tutorial videos mentioned above. 

Which all goes to say, please don't think I'm some coding expert! I'm simply fumbling my way along as I tinker and play, and I'm happy to share what little I've found along the way.
