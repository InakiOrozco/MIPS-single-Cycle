.text 
#agregar 3 instrucciones nop
add $zero, $zero, $zero
add $zero, $zero, $zero
add $zero, $zero, $zero
lui $s0, 0x00000101
add $zero, $zero, $zero
add $zero, $zero, $zero
ori $s1, $s0, 0x24
addi $s2, $zero, 1
addi $s3, $zero, 32
add $zero, $zero, $zero
add $zero, $zero, $zero
sll $t0, $s2, 4
srl $t1, $s3, 4
add $zero, $zero, $zero
add $zero, $zero, $zero
sub $t2, $t0, $t1
