.data
msg: .asciiz "Enter the number: \n"
remsg: .asciiz "The combined number is: "

.text
main:
li $t0, 0
li $t1, 0

read_inputs:
li $v0, 4
la $a0, msg
syscall

li $v0, 5
syscall

mul $t1, $t1, 10
add $t1, $t1, $v0

addi $t0, $t0, 1

blt $t0, 3, read_inputs

li $v0, 4
la $a0, remsg
syscall

li $v0, 1
move $a0, $t1
syscall

li $v0, 10
syscall
