# S24 CS 64 
# Lab 04
# middle.asm 

.data

    # TODO: Complete these declarations/initializations

    enterFirst: .asciiz "Enter the first number:\n"
    enterSecond: .asciiz "Enter the second number:\n"
    enterThird: .asciiz "Enter the third number:\n"
    middle: .asciiz "Middle:\n"
    endl: .asciiz "\n"


.text

main:
    # print string named enterFirst
    li $v0, 4
    la $a0, enterFirst
    syscall

    # read int and store in s0
    li $v0, 5
    syscall
    move $s0, $v0

    # print string named enterSecond
    li $v0, 4
    la $a0, enterSecond
    syscall

    # read int and store in s1
    li $v0, 5
    syscall
    move $s1, $v0

    # print string named enterThird
    li $v0, 4
    la $a0, enterThird
    syscall

    # read int and store in s2
    li $v0, 5
    syscall
    move $s2, $v0

    #if s0 > s1
        #swap
    #if s1 > s2
        #swap
    #if s0 > s1
        #swap
    #print s1

bubble1:
    ble $s0, $s1, bubble2
    move $t0, $s0
    move $s0, $s1
    move $s1, $t0
bubble2:
    ble $s1, $s2, bubble3
    move $t0, $s1
    move $s1, $s2
    move $s2, $t0
bubble3:
    ble $s0, $s1, endbubble
    move $t0, $s0
    move $s0, $s1
    move $s1, $t0
endbubble:

print:
    li $v0, 1
    move $a0, $s1
    syscall

exit:
    li $v0, 10
    syscall
