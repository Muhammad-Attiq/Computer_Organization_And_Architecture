.data
prompt: .asciiz " Enter a 3 bit number \n "
yes_msg: .asciiz "palindrome"
no_msg: .asciiz "not palindrome"
.text
main:
li $v0, 4
la $a0, prompt
syscall
li $v0, 5
syscall
move $t0, $v0
andi $t0, $t0, 0x07

and $t1, $t0, 1
srl $t0, $t0, 2
and $t2, $t0, 1

beq $t1, $t2, yes
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
