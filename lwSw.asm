.text
lui $t0, 0x1001 #inicializamos los apuntadores 
addi $s1, $zero, 480 #Para poder guardar los discos hasta la última fila tenemos que sumarle 480
add $t0, $t0, $s1 #para poder llegar a la última fila de memoria
sw $s1, 0($t0)
lw $t2, 0($t0) #guardamos el valor en una variable temporal