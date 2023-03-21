# *********************************************************************************
# * Program name: inout                                                           *
# * Description :                                                                 *
# *********************************************************************************

#ifndef MACOS
.ifndef CODEGRADE
    .global main
    main: jmp my_main
.endif
#else
    .global _main
    _main: jmp my_main
    printf: jmp _printf
    scanf: jmp _scanf
    exit: jmp _exit
#endif

.text
# your strings here

.global my_main                         # make my_main accessible globally
.global my_increment                    # make my_increment accessible globally

my_main:
        # set up the stack frame
        pushq   %rbp                        # push base register onto my_main local stack
        movq    %rsp, %rbp                  # move the stack pointer to point to the same location as the base register


        call    inout


end:                                        # clear the stack and return
        movq     $0, %rdi                   # move 0 into the first argument register so that we can call exit(0) when we exit
        call     exit                       # calls the exit function to exit the program


# read input and increment it using my_increment
inout:

        pushq %rbp                          # push base register onto inout local stack
        movq %rsp, %rbp                     # move stack pointer to point to same location as base register on inout local stack

        subq $16, %rsp                      # move the stack pointer two positions forward so we know where the end is

        call    my_increment

        # output incremented number

my_increment:
        # IMPLEMENT ME



