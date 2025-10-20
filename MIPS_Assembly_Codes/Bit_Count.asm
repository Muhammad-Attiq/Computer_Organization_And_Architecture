.data
msg: .asciiz "enter the number: \n"
no_of_bits: .asciiz "the number of bits are: \n"
.text
main:
li $v0, 4
la $a0, msg
syscall
li $v0, 5
syscall
move $t0, $v0
li $t4, 0

loop:
beq $t0, 0, end
andi $t1, $t0, 1
beqz $t1, skip
addi $t4, $t4, 1

skip:
srl $t0, $t0, 1
j loop

end:
li $v0, 4
la $a0, no_of_bits
syscall
li $v0, 1
move $a0, $t4
syscall
li $v0, 10
syscall
