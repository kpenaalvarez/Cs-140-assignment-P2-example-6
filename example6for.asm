# Title:	lab  A P2		Filename: example6for.asm
# Author: 	Kevin Peña	Date: 5/6/25
# Description:
# Input:
# Output:
################# Data segment #####################
.data
A: .word 2, 4, 6, 8
sum: .word 0
N: .word 4

################# Code segment #####################
.text
.globl main

main:

    li $t0, 0 #sum = 0 is stored in $t0
    la $t1, N  #load address of array
    lw $t1, 0($t1)  #load N into $t1
    li $t2, 0   #i = 0 into $t2

loop:

    bge $t2, $t1, done  # If i >= N, exit loop (this is the exit condition)
    la $t4, A   #loads address of A
    mul $t3, $t2, 4  
    add $t3, $t4, $t3   #add i to address of A getting A[i]
    lw $t3, 0($t3)  #load A[i] into $t3

    add $t0, $t0, $t3 # sum+= A[i]

    addi $t2, $t2, 1 # i += 1

    j loop  #loops
done: 

    la $t5, sum  #loads address of sum
    sw $t0, 0($t5) # stores sum in memory

    li  $v0, 1         # Print integer 
    move $a0, $t0      # Move sum into $a0 for printing
    syscall

    # Exit
    li  $v0, 10        # Exit syscall
    syscall
