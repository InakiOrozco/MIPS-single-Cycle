.text
add:
addi $s1, $s1, 1 
beq $s0, $s1 Exit
addi $s0, $zero, 3
addi $s1, $s1, 1
bne $s0, $s1, add
Exit: nop