# *********************************************************************************
# * Program name: pow                                                             *
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

.global my_main
.global my_pow


my_main:
    pushq %rbp                          # push base register onto main local stack
    movq %rsp, %rbp                     # move stack pointer to point to same location as base register on inout local stack

    subq $16, %rsp                      # move the stack pointer two positions forward so we know where the end is

    # to get base input

    movq $0, %rax                       # boilerplate to be able to use the rax register
    leaq format_string(%rip), %rdi      # load effective address of format string into the register of the first argument
    leaq -8(%rbp), %rsi                 # load memory address of the first spot in the stack into the register of the second argument
    call scanf                          # call scanf from the C standard library


    # to get exponent input

    movq $0, %rax                       # boilerplate to be able to use the rax register
    leaq format_string(%rip), %rdi      # load effective address of format string into the register of the first argument
    leaq -16(%rbp), %rsi                # load memory address of the first spot in the stack into the register of the second argument
    call scanf                          # call scanf from the C standard library

    
    movq -8(%rbp), %rdi                 # move the first position of the stack (base) into the first argument
    movq -16(%rbp), %rsi                # move the second position of the stack (exponent) into the second argument
    call my_pow                         # call my_pow


end:                                        # clear the stack and return
        movq     $0, %rdi                   # move 0 into the first argument register so that we can call exit(0) when we exit
        call     exit                       # calls the exit function to exit the program

my_pow:
    pushq %rbp                          # push base register onto my_pow local stack
    movq %rsp, %rbp                     # move stack pointer to point to same location as base register on my_pow local stack

    subq $16, %rsp                      # align the stack

    # my_pow function

    # NEED TO IMPLEMENT

    movq %rbp, %rsp                     # move register of the base pointer to the reigster of the stack pointer
    popq %rbp                           # pop base pointer (remove base pointer aka first element of the stack)
    ret                                 # return
