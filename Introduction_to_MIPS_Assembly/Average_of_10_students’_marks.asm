.data
prompt: .asciiz "Enter Mark: \n"
result: .asciiz "Result: "

.text
main:
li $t0, 0
li $t1, 0

loop:
beq $t0, 10, done

li $v0, 4
la $a0, prompt
syscall

li $v0, 5
syscall

add $t1, $t1, $v0

addi $t0, $t0, 1

j loop

done:

li $t2, 10
div $t1, $t2
mflo $t3

li $v0, 4
la $a0, result
syscall

li $v0, 1
move $a0, $t3
syscall

li $v0, 10
syscall
