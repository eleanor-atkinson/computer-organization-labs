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
    format_string: .asciz "%ld";        # long digit/quadword format string (meaning a long C)

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

    movq %rax, %rsi                     # move rax (where we returned the answer to) to rsi (second argument register)
    leaq format_string(%rip), %rdi      # using instruction pointer, load the value we want to print onto the first argument register
    movq    $0, %rax                    # move 0 to rax register so that the system calls the correct function
    call    printf                      # call the print function from the C standard library


end:                                    # clear the stack and return
        movq     $0, %rdi               # move 0 into the first argument register so that we can call exit(0) when we exit
        call     exit                   # calls the exit function to exit the program

my_pow:
    pushq %rbp                          # push base register onto my_pow local stack
    movq %rsp, %rbp                     # move stack pointer to point to same location as base register on my_pow local stack

    subq $16, %rsp                      # align the stack

    # my_pow actual function

    movq %rdi, -8(%rbp)                 # move the contents of rdi(base argument) into the first position in the stack
    movq %rsi, -16(%rbp)                # move the contents of rsi(exponent argument) into the second position in the stack
    movq -8(%rbp), %rax                 # move contents of rbp(our desired answer) into the return register so we can return it l8ter

    # loop
    # multiplying base by (exponent - 1) amount of times

L1:

    cmpq $1, -16(%rbp)                  # is 1 == to the exponent (which is stored in the register base pointer)
    
    # if the exponent is less than 1, it must be 0, so we jump to returning 1 (which is an exception)

    jmp exception

    # if n = 1, jump to the end (je = jump if equal)
    # if n = 1, jump to the end (je = jump if equal)

    je end_my_pow

    imulq -8(%rbp), %rax               # multiply rax (result) by -8(%rbp), the base

    subq $1, -16(%rbp)                 # decrement

    jmp L1                             # continue the loop


exception:

    movq $1, %rax                       # move 1 to the return register (we return 1 if exponent is 0)
        
end_my_pow:

    movq %rbp, %rsp                     # move register of the base pointer to the reigster of the stack pointer
    popq %rbp                           # pop base pointer (remove base pointer aka first element of the stack)
    ret                                 # return
