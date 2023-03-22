# *********************************************************************************
# * Program name: factorial                                                       *
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
.global factorial


my_main:
    pushq %rbp                          # push base register onto main local stack
    movq %rsp, %rbp                     # move stack pointer to point to same location as base register on inout local stack


    subq $16, %rsp                      # move the stack pointer two positions forward so we know where the end is

    # to get input
    movq $0, %rax                       # boilerplate to be able to use the rax register
    leaq format_string(%rip), %rdi      # load effective address of format string into the register of the first argument
    leaq -8(%rbp), %rsi                 # load memory address of the first spot in the stack into the register of the second argument
    call scanf                          # call scanf from the C standard library

    # load number
    movq -8(%rbp), %rdi                 # load input into first argument
    call factorial                      # call factorial function

    

    # print
    movq %rax, %rsi                     # move rax (where we returned the increment to) to rsi (second argument register)
    leaq format_string(%rip), %rdi      # using instruction pointer, load the value we want to print onto the first argument register
    movq    $0, %rax                    # move 0 to rax register so that the system calls the correct function
    call    printf                      # call the print function from the C standard library

end:                                        # clear the stack and return
        movq     $0, %rdi                   # move 0 into the first argument register so that we can call exit(0) when we exit
        call     exit                       # calls the exit function to exit the program

factorial:
    # boilerplate
    pushq %rbp                          # push base register onto main local stack
    movq %rsp, %rbp                     # move stack pointer to point to same location as base register on inout local stack

    # base case (epilogue)
