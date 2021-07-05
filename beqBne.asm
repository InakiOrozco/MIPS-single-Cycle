addi $t0, $zero, -1
addi $t1, $zero, 2

back:
addi $t0, $t0, 1
beq $t0, $t1, Exit
bne $t0, $t1, back

Exit: nop
