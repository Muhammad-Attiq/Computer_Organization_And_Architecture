.data
prompt: .asciiz "Enter a number: "
result: .asciiz "Number * 24 = "

.text
main:
    li $v0, 4
    la $a0, prompt
    syscall
    li $v0, 5
    syscall
    move $t0, $v0

    sll $t1, $t0, 3
    sll $t2, $t0, 4
    add $t3, $t1, $t2
    li $v0, 4
    la $a0, result
    syscall
    li $v0, 1
    move $a0, $t3
    syscall
    li $v0, 10
    syscall
