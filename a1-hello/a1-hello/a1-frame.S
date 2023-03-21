# *********************************************************************************
# * Program name: Hello World                                                     *
# * Description : Print Student Information                                       *
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
    exit: jmp _exit
#endif

.text                                   # to put string in memory
    string_to_print: .asciz "Eleanor Atkinson, eat207, a1-frame"

.global my_main                         # make my_main accessible globally

my_main:
    pushq   %rbp                        # push base register onto stack so later can                                          access variable containing string
    movq    %rsp, %rbp                  # move the stack pointer to point to the same                                         location as the base register

    leaq    string_to_print(%rip), %rdi # using the instruction pointer, we load the value we want to print onto the first argument register
    movq    $0, %rax                    # move 0 to rax register so that the system calls  the correct function
    call    printf                      # call the print function

    
end:
    movq     $0, %rdi                   # move 0 into the first argument register so that   we can call exit(0) when we exit
    call     exit                       # calls the exit function to exit the program
