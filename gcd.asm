# S24 CS 64 
# Lab 04
# gcd.asm 

##### C++ (NON-RECURSIVE) code snippet of gcd(a,b):
    # int main()
    # {
    #     int a, b, n;
    #     int gcd = 1;

    #     cout << "Enter the first number:\n"; 
    #     cin >> a;
    #     cout << "Enter the second number:\n"; 
    #     cin >> b;
        
    #     if(a<b)
    #     {    n = a; }
    #     else
    #     {    n = b; }

    #     for(int i = 1; i <= n; i++)
    #     {
    #         if(a%i==0 && b%i==0)
    #             gcd = i;
    #     }

    #     cout << "GCD: " << gcd <<  "\n"; 

    #     return 0;
    # }


##### Assembly (NON-RECURSIVE) code version of gcd(a,b):

.data
    enterFirst: .asciiz "Enter the first number:\n"
    enterSecond: .asciiz "Enter the second number:\n"
    gcd: .asciiz "GCD:\n"
    endl: .asciiz "\n"
    test: .asciiz "test\n"

.text

main:
	
    # a is s0
    # b is s1
    # n is s2
    # gcd is s3
    li $s3, 1
    # i is s4

getInput:
    # print enterFirst
    li $v0, 4
    la $a0, enterFirst
    syscall
    # take in int as a
    li $v0, 5
    syscall
    move $s0, $v0
    # print enterSecond
    li $v0, 4
    la $a0, enterSecond
    syscall
    # take in int b
    li $v0, 5
    syscall
    move $s1, $v0


setna:
    bgt $s0, $s1, setnb
    move $s2, $s0
    j setndone
setnb:
    move $s2, $s1
setndone:


    li $s4, 1
forloop:
    bgt $s4, $s2, endforloop

    div $s0, $s4
    mfhi $t0
    bne $t0, $zero, endconditionals
    div $s1, $s4
    mfhi $t0
    bne $t0, $zero, endconditionals
    move $s3, $s4

endconditionals:

    addi $s4, $s4, 1
    j forloop
endforloop:

    # print gcd
    li $v0, 4
    la $a0, gcd
    syscall
    # print i
    li $v0, 1
    move $a0, $s3
    syscall
    # print newline
    li $v0, 4
    la $a0, endl
    syscall

exit:
	li $v0, 10
    syscall
