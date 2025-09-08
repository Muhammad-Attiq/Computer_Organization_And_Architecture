.data
qmsg: .asciiz "Enter quiz mark (out of 10): "
amsg: .asciiz "Enter assignment mark (out of 10): "
resmsg: .asciiz "\nTotal marks (out of 25) = "

.text
.globl main
main:
    li $t0, 0   # quiz sum
    li $t1, 0   # assignment sum
    li $t2, 0   # counter

# ---- quizzes ----
quiz_loop:
    li $v0, 4
    la $a0, qmsg
    syscall

    li $v0, 5
    syscall
    add $t0, $t0, $v0

    addi $t2, $t2, 1
    blt $t2, 4, quiz_loop

# ---- assignments ----
li $t2, 0
assgn_loop:
    li $v0, 4
    la $a0, amsg
    syscall

    li $v0, 5
    syscall
    add $t1, $t1, $v0

    addi $t2, $t2, 1
    blt $t2, 4, assgn_loop

# ---- scale marks ----
# quizzes: 40 -> 15
# assignments: 40 -> 10

# quiz_scaled = quiz * 15 / 40
li $t3, 15
mul $t4, $t0, $t3
li $t5, 40
div $t4, $t5
mflo $t6   # quiz_scaled

# assignment_scaled = assign * 10 / 40
li $t3, 10
mul $t4, $t1, $t3
li $t5, 40
div $t4, $t5
mflo $t7   # assignment_scaled

# total = quiz_scaled + assignment_scaled
add $t8, $t6, $t7

# ---- print result ----
li $v0, 4
la $a0, resmsg
syscall

li $v0, 1
move $a0, $t8
syscall

li $v0, 10
syscall
