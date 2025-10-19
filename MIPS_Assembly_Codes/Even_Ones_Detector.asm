.data
prompt:     .asciiz "Enter a bit (0 or 1): "
even_msg:   .asciiz "Output: 1 (even number of 1's)\n"
odd_msg:    .asciiz "Output: 0 (odd number of 1's)\n"

.text
.globl main
main:
    li $t0, 0          

loop:
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall
    move $t1, $v0     

    xor $t0, $t0, $t1   
    
    beqz $t0, even
    j odd

even:
    li $v0, 4
    la $a0, even_msg
    syscall
    j loop

odd:
    li $v0, 4
    la $a0, odd_msg
    syscall
    j loop
