.data
msg1: .asciiz "enter number 1: \n"
msg2: .asciiz "enter number 2: \n"
answer: .asciiz "the sum from number 1 to number 2: \n"

.text
main:
li $v0, 4
la $a0, msg1
syscall

li $v0, 5
syscall
move $t0, $v0

li $v0, 4
la $a0, msg2
syscall

li $v0, 5
syscall
move $t1, $v0

move $t3, $t0

li $t2, 0

loop:

bgt $t3, $t1, end

add $t2, $t2, $t3

addi $t3, $t3, 1

j loop

end:
li $v0, 4
la $a0, answer
syscall
li $v0, 1
move $a0, $t2
syscall
li $v0, 10
syscall
