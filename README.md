# Computer Organization Lab Framework

This is a collection of labs that I did for my Computer Organization course.  

## Assignment 0 - Sieve of Eratosthenes Example Program

An example assignment to familiarize myself with x86\_64 Assembly and to test my setup.  
To compile, `cd` into the Assignment 0 directory (`a0-sieve` by default).  
`gcc -o sieve sieve.S -g` compiles the program.  
`./sieve` will run the compiled program.  

## Assignment 1 - Hello World

Hello world program written in assembly (first time ever using Assembly). 
Use the `a1-frame.S` file to get started.  
To compile, `cd` into the Assignment 1 directory (`a1-hello` by default).  
`gcc -o a1 a1-frame.S -g` compiles the program.  
`./a1` will run the compiled program.  

## Assignment 2 - Inout

Make sure to use `my_main` instead of `main`. You **must** have a global subroutine `my_increment` that takes as input an integer, `n`, and returns as a result `n + 1`.  
You can use the `a2-frame.S` file to get started.  
To compile, `cd` into the Assignment 2 directory (`a2-inout` by default).  
`gcc -o a2 a2-frame.S -g` compiles the program.  
`./a2` will run the compiled program.  

## Assignment 3 - Power

Make sure to use `my_main` instead of `main`. You **must** have a global subroutine `my_pow` that takes as input two integers, first the `base`, then the `exponent`, and returns as a result `base` to the power of `exponent`.  
You can use the `a3-frame.S` file to get started.  
To compile, `cd` into the Assignment 3 directory (`a3-pow` by default).  
`gcc -o a3 a3-frame.S -g` compiles the program.  
`./a3` will run the compiled program.  

## Assignment 4 - Factorial

Make sure to use `my_main` instead of `main`. You **must** have a global subroutine `factorial` that takes as input an integer, `n`, and returns as a result `n` factorial.
You can use the `a4-frame.S` file to get started.  
To compile, `cd` into the Assignment 4 directory (`a4-fac` by default).  
`gcc -o a4 a4-frame.S -g` compiles the program.  
`./a4` will run the compiled program.  

## Online Compiler

Should you have no option to run code locally, there is an [online compiler](onlinegdb.com). Please note that this is not maintained by us and that we do explicitly not provide any support for issues that you may have when using the online compiler.
Your best bet when using the online compiler is to use the `aX-frame.S` files for each assignment. Should you want to pass a flag to the online compiler, you can do so by clicking the little cog in the top right, then clicking "extra compiler flags".
