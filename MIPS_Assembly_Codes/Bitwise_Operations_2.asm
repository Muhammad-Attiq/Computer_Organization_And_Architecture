.data
msg_s2: .asciiz "$s2 (SLL) = "
msg_s3: .asciiz "\n$s3 (SRL) = "
msg_s4: .asciiz "\n$s4 (SRA) = "

.text
.globl main
main:
    li $s1, 0x87654321

    sll $s2, $s1, 16
    srl $s3, $s1, 8
    sra $s4, $s1, 12

    li $v0, 4
    la $a0, msg_s2
    syscall
    li $v0, 34
    move $a0, $s2
    syscall

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

    li $v0, 10
    syscall
