# Equipo: Luisa María Ortiz Carstensen, Iñaki Sebastián Orozco García
#Para mover una torre de N discos de A a C:
#o = [7,6,5,4,3,2,1]
#a = []
#d = []
#def Hanoi(n, o, d, a):
#    print(n, o, a, d)
#    if n == 1:
#        d.append(o.pop())
#    else:
#        Hanoi(n-1, o, a, d)
#        d.append(o.pop())
#        Hanoi(n-1, a, d, o)
#Hanoi(len(o), o, d, a)
#print(o, a, d)

#MIPS: add, addi, sub, or, ori, and, lui, ori, andi, nor, srl, sll, lw, sw, beq, bne, j, jal y jr.

.data
.text
main:
	addi $s0, $zero, 3 #Cantidad de discos (n) 
	addi $s1, $zero, 480 #Para poder guardar los discos hasta la última fila tenemos que sumarle 480
	add $s2, $zero, $s0 #Copiamos la cantidad para manipularla
	addi $s3, $zero, 1 #Este uno se usa para la comprobación de n==1
	lui $t0, 0x1001 #inicializamos los apuntadores 
	lui $t1, 0x1001 
	lui $t2, 0x1001 
	add $t0, $t0, $s1 #para poder llegar a la última fila de memoria
	add $t1, $t1, $s1
	addi $t2, $t2, 4 #le sumo 4 a t2 para tener la torre auxiliar al lado
	add $t2, $t2, $s1
	addi $t1, $t1, 8 #le sumo 8 a t1 para tener la torre destino al lado de la auxiliar
	
	for: #Llenamos la primera torre con los n discos de mayor a menor.
		sw $s0, 0($t0) #guardamos el disco
		addi $s0, $s0, -1 #le restamos uno al número del disco
		addi $s1, $s1, -32 #restamos lo necesario para movernos una fila en la misma posición
		lui $t0, 0x1001 
		add $t0, $t0, $s1 #nos movemos una posición vertical arriba
		bne $s0, $zero, for #mientras el disco no sea 0 volvemos a repetir
	
	jal Hanoi #(n = s2, o = $t0 d = $t1, a = $t2)
	j Exit

Hanoi:	addi $sp, $sp, -4 #movemos el stack una posición 
	sw $ra, 0($sp) #guardamos return address en la primera posición del stack
#    if n == 1:
#    d.append(o.pop())
	beq $s2, $s3, n1
#    else:
	addi $s2, $s2, -1 #n-1
	add $t3, $zero, $t1 #Cambiamos el orden de nuestros apuntadores
	add $t1, $zero, $t2 #$t0 = origen, $t1 = auxiliar, $t2 = destino
	add $t2, $zero, $t3 #(n = s2, o = $t0 a = $t1, d = $t2)
#    Hanoi(n-1, o, a, d)
	jal Hanoi

	add $t3, $zero, $t1 #Cambiamos el orden de nuestros apuntadores de las torres
	add $t1, $zero, $t2 
	add $t2, $zero, $t3 
	addi $t0, $t0, 32 #dejamos $t0 en el último disco

#        d.append(o.pop())
	lw $t3, 0($t0) #cargamos el valor en una variable temporal
	sw $zero, 0($t0) #borramos ese valor en el tope de la torre
	sw $t3, 0($t1) #agregamos el nuevo valor a la torre
	addi $t1, $t1, -32 #aumentamos una posición para la torre
	
	addi $s2, $s2, -1 #n-1
	add $t3, $zero, $t0 #Cambiamos el orden de nuestros apuntadores de las torres
	add $t0, $zero, $t2
	add $t2, $zero, $t3
#    Hanoi(n-1, a, d, o)
	jal Hanoi
	
	add $t3, $zero, $t0 #Cambiamos el orden de nuestros apuntadores de las torres
	add $t0, $zero, $t2
	add $t2, $zero, $t3
	addi $s2, $s2, 1 #n+1
	lw $ra, 0($sp) #cargamos el return address del stack
	addi $sp, $sp, 4 #decrementamos una posición del stack
	jr $ra #regresamos al return adress que cargamos

n1:	addi $t0, $t0, 32 #en el caso base bajamos una posición en la torre 
	lw $t3, 0($t0) #guardamos el valor en una variable temporal
	sw $zero, 0($t0) #borramos el valor en el tope de la torre
	sw $t3, 0($t1) #agregamos el nuevo valor a la torre
	addi $t1, $t1, -32 #nos movemos una posición hacia arriba de la torre donde se agregó el valor
	addi $s2, $s2, 1 #n+1
	lw $ra, 0($sp) #cargamos el return address en el stack
	addi $sp, $sp, 4 #decrementamos una posición del stack
	jr $ra #regresamos al return adress que cargamos

Exit: nop
