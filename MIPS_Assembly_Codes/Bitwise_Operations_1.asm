.data
msg_s3: .asciiz "$s3 (AND) = "
msg_s4: .asciiz "\n$s4 (OR) = "
msg_s5: .asciiz "\n$s5 (XOR) = "
msg_s6: .asciiz "\n$s6 (NOR) = "

.text
.globl main
main:
    li $s1, 0x12345678
    li $s2, 0xffff9a00

    and $s3, $s1, $s2
    or  $s4, $s1, $s2
    xor $s5, $s1, $s2
    nor $s6, $s1, $s2

    li $v0, 4
    la $a0, msg_s3
    syscall
    li $v0, 34
    move $a0, $s3
    syscall

    li $v0, 4
    la $a0, msg_s4
    syscall
    li $v0, 34
    move $a0, $s4
    syscall

    li $v0, 4
    la $a0, msg_s5
    syscall
    li $v0, 34
    move $a0, $s5
    syscall

    li $v0, 4
    la $a0, msg_s6
    syscall
    li $v0, 34
    move $a0, $s6
    syscall

    li $v0, 10
    syscall
