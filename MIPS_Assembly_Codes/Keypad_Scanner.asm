.data
promptR: .asciiz "Enter Row (R) [1,2,4,8]: "
promptC: .asciiz "Enter Column (C) [1,2,4]: "
msgN:    .asciiz "\nKey value (N): "
msgV:    .asciiz "\nValid (V): "
newline: .asciiz "\n"

.text
.globl main

main:
    li $v0, 4
    la $a0, promptR
    syscall
    
    li $v0, 5
    syscall
    move $t0, $v0
    
    li $v0, 4
    la $a0, promptC
    syscall

    li $v0, 5
    syscall
    move $t1, $v0
    
    li $t2, 0       # N = 0
    li $t3, 0       # V = 0

    li $t4, 1
    bne $t4, $t0, check_row2
    
    beq $t1, 1, key_1
    beq $t1, 2, key_2
    beq $t1, 4, key_3
    
    j end
key_1:
    li $t2, 1
    li $t3, 1
    j end

key_2:
    li $t2, 2
    li $t3, 1
    j end

key_3:
    li $t2, 3
    li $t3, 1
    j end
    
check_row2:

    li $t4, 2
    bne $t4, $t0, check_row3
    
    beq $t1, 1, key_4
    beq $t1, 2, key_5
    beq $t1, 4, key_6
    
    j end
    
key_4:
    li $t2, 4
    li $t3, 1
    j end

key_5:
    li $t2, 5
    li $t3, 1
    j end

key_6:
    li $t2, 6
    li $t3, 1
    j end

check_row3:

    li $t4, 4
    bne $t4, $t0, check_row4
    
    beq $t1, 1, key_7
    beq $t1, 2, key_8
    beq $t1, 4, key_9
    
    j end
    
key_7:
    li $t2, 7
    li $t3, 1
    j end

key_8:
    li $t2, 8
    li $t3, 1
    j end

key_9:
    li $t2, 9
    li $t3, 1
    j end
    
check_row4:

    li $t4, 8
    bne $t4, $t0, end
    
    beq $t1, 1, key_10
    beq $t1, 2, key_0
    beq $t1, 4, key_11
    
    j end 

key_10:
    li $t2, 10
    li $t3, 1
    j end

key_0:
    li $t2, 0
    li $t3, 1
    j end

key_11:
    li $t2, 11
    li $t3, 1
    j end
    
end:
    
    li $v0, 4
    la $a0, msgN
    syscall
    
    li $v0, 1
    move $a0, $t2
    syscall 
    
    li $v0, 4
    la $a0, msgV
    syscall
    
    li $v0, 1
    move $a0, $t3
    syscall
    
    li $v0, 10
    syscall
