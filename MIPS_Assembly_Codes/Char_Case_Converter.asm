.data
msg: .asciiz "enter character \n"
lower: .asciiz "\n uppercase: \n"
upper: .asciiz "\n lowercase: \n"
.text
.globl main
main:
    li $v0, 4
    la $a0, msg
    syscall
    
    li $v0, 12
    syscall
    
    move $t0, $v0
    
    move $s0, $t0
    
    andi $t0, $t0, 0xDF
    
    ori $t1, $s0, 0x20
    
    li $v0, 4
    la $a0, lower
    syscall
    
    li $v0, 11
    move $a0, $t0
    syscall
    
    li $v0, 4
    la $a0, upper
    syscall
    
    li $v0, 11
    move $a0, $t1
    syscall
