.data
msg: .asciiz "Enter a number: "

.text
main:
    li $v0, 4
    la $a0, msg
    syscall
    li $v0, 5
    syscall
    move $t0, $v0
    move $s0, $sp
    li $t1, 2
    
loop:
    beq $t0, $zero, print_number
    div $t0, $t1
    mflo $t0
    mfhi $t2
    addi $sp, $sp, -4
    sw $t2, 0($sp)
    j loop

print_number:
    beq $sp, $s0, end
    lw $t2, 0($sp)
    addi $sp, $sp, 4
    li $v0, 1
    move $a0, $t2      
    syscall
    j print_number

end:
    li $v0, 10
    syscall
