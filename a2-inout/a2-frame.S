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
        format_string: .asciz "%ld";         # long digit/quadword format string (meaning a long C)

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

        
        movq $0, %rax                       # boilerplate to be able to use the rax register
        leaq format_string(%rip), %rdi      # load effective address of format string into the register of the first argument
        leaq -8(%rbp), %rsi                 # load memory address of the first spot in the stack into the register of the second argument
        call scanf                          # call scanf from the C standard library

        movq -8(%rbp), %rdi                 # move the value from the memory address to the register of the first argument
        call    my_increment                # call my_increment

        movq %rax, %rsi                     # move rax (where we returned the increment to) to rsi (second argument register)
        leaq format_string(%rip), %rdi      # using instruction pointer, load the value we want to print onto the first argument register
        movq    $0, %rax                    # move 0 to rax register so that the system calls the correct function
        call    printf                      # call the print function from the C standard library

        movq %rbp, %rsp                     # move register of the base pointer to the reigster of the stack pointer
        popq %rbp                           # pop base pointer (remove base pointer aka first element of the stack)
        ret                                 # return

# output incremented number
my_increment:
        pushq %rbp                          # boilerplate for setting up local stack
        movq %rsp, %rbp

        movq %rdi, %rax                     # move return register into the register of the first argument
        addq $1, %rax                       # add 1 to value in the return register

        movq %rbp, %rsp                     # move register of the base pointer to the reigster of the stack pointer
        popq %rbp                           # pop base pointer (remove base pointer aka first element of the stack)
        ret


