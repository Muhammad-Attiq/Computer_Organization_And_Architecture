.data
prompt_num: .asciiz "Enter number: "
prompt_bit: .asciiz "Enter bit (0-31): "
result:    .asciiz "Bit value: "

.text
main:
    li $v0, 4
    la $a0, prompt_num
    syscall
    li $v0, 5
    syscall
    move $t0, $v0

    li $v0, 4
    la $a0, prompt_bit
    syscall
    li $v0, 5
    syscall
    move $t1, $v0

    srlv $t2, $t0, $t1
    andi $t3, $t2, 1
    li $v0, 4
    la $a0, result
    syscall
    li $v0, 1
    move $a0, $t3
    syscall

    li $v0, 10
    syscall
