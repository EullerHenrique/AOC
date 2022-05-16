.data

.text
MAIN:

	#i = 0
	add $t0, $zero, $zero
	#r1 = 0
	add $t1, $zero, $zero
	#r2 = 0
	add $t2, $zero, $zero
	#r3 = 0
	add $t3, $zero, $zero
	#r4 = 0
	add $t4, $zero, $zero

	#a1 = 1
	addi $s0, $zero, 1
	#a2 = 3
	addi $s1, $zero, 3
	#a3 = 5
	addi $s2, $zero, 5
	#a4 = 7
	addi $s3, $zero, 7

	#b1 = 2
	addi $s4, $zero, 2
	#b2 = 4
	addi $s5, $zero, 4
	#b3 = 8
	addi $s6, $zero, 8
	#b4 = 16
	addi $s7, $zero, 16
	
	#i = a1
	add $t0, $zero, $s0
FOR1: 
	beq $t0, $zero, MAIN2
	
	#r1 += b1
	add $t1, $t1, $s4 
	
	#i--
	addi $t0, $t0, -1
	j FOR1
	
MAIN2:
	#i = a2
	add $t0, $zero, $s1

FOR2:
	beq $t0, $zero, MAIN3
	
	#r2 += b2
	add $t2, $t2, $s5
	
	#i--
	addi $t0, $t0, -1
	
	j FOR2
MAIN3: 
	#i = a3
	add $t0, $zero, $s2
FOR3:
	beq $t0, $zero, MAIN4
	
	#r3 += b3
	add $t3, $t3, $s6
	
	#i--
	addi $t0, $t0, -1
	
	j FOR3
MAIN4:
	#i = a4
	add $t0, $zero, $s3
FOR4:
	#i<0
	beq $t0, $zero, RESULTADO
	
	#r3 += b3
	add $t4, $t4, $s7
	
	#i--
	addi $t0, $t0, -1
	
	j FOR4
RESULTADO:
	#r = r1 + r2 + r3 + r4
	add $a1, $t1,$t2
	add $a1, $a1,$t3
	add $a1, $a1,$t4
	
	#imprime o resultado
	addi $v0, $zero, 1
	add $a0, $zero, $a1
	syscall 
	
	
	
	




