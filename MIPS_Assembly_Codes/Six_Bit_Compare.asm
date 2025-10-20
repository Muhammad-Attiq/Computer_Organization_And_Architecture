.data
prompt: .asciiz " Enter a 6 bit number \n "
yes_msg: .asciiz "equal"
no_msg: .asciiz "not equal"
.text
main:
li $v0, 4
la $a0, prompt
syscall

li $v0, 5
syscall
move $s0, $v0 

andi $t0, $s0, 1

srl $t1, $s0, 1
andi $t1, $t1, 1  
 
srl $t2, $s0, 2
andi $t2, $t2, 1

srl $t3, $s0, 3
andi $t3, $t3, 1

srl $t4, $s0, 4
andi $t4, $t4, 1

srl $t5, $s0, 5
andi $t5, $t5, 1

and $t6, $t0, $t3
and $t7, $t1, $t4
and $s1, $t2, $t5

or $t8, $t6, $t7
or $t8, $t8, $s1

bnez $t8, yes
j no

yes:
li $v0, 4
la $a0, yes_msg
syscall
j end

no:
li $v0, 4
la $a0, no_msg
syscall

end:
li $v0, 10
syscall
