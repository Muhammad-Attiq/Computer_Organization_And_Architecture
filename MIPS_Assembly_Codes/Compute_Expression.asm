.data
promptA: .asciiz "Enter integer A: "
promptB: .asciiz "Enter integer B: "
result_msg: .asciiz "Result (A + 2B - 5) = "

.text
.globl main
main:
    li $v0, 4
    la $a0, promptA
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    li $v0, 4
    la $a0, promptB
    syscall

    li $v0, 5
    syscall
    move $t1, $v0

    sll $t2, $t1, 1
    add $t3, $t0, $t2
    addi $t3, $t3, -5

    li $v0, 4
    la $a0, result_msg
    syscall

    li $v0, 1
    move $a0, $t3
    syscall

    li $v0, 10
    syscall
