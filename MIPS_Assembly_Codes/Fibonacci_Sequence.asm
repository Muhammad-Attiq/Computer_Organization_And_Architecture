.data
msg:    .asciiz "Enter a positive integer n: "
result: .asciiz "The nth Fibonacci number is: "

.text
main:
    li $v0, 4
    la $a0, msg
    syscall

    li $v0, 5          
    syscall
    move $t0, $v0      

    li $t1, 0
    li $t2, 1
    
    beqz $t0, fib_0
    
    li $t3, 1
    beq $t0, 1, fib_1
    
    li $t4, 2
    
    fib_loop:
    bgt $t4, $t0, end
    
    move $t5, $t1
    move $t1, $t2
    add $t2, $t5, $t2
    
    addi $t4, $t4, 1
    j fib_loop
    
    fib_0:
    
    li $t2, 0
    j end
    
    fib_1:
    
    li $t2, 1
    
    end:
    
    li $v0, 4
    la $a0, result
    syscall
    
    li $v0, 1
    move $a0, $t2
    syscall
    
    li $v0, 10
    syscall
    
