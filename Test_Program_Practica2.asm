.text
lui $s0, 0x0101
ori $s1, $s0, 0x24
addi $s2, $zero, 1
addi $s3, $zero, 32
sll $t0, $s2, 4
srl $t1, $s3, 4
sub $t2, $t0, $t1
andi $t5, $s2, 3
or $t6, $s2, $s3
nor  $t7, $s2, $s3
j Next

Back:
add $t3, $t0, $t2
j Exit

Next:
and $t4, $s2, $t2
j Back

Exit: 
nop