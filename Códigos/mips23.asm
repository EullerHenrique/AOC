.data
	v: .space 84
.text
MAIN:	
	#$T0, &v
	la $t0, v
	#i = 21
	addi $t1, $zero, 21
	#j = 1
	addi $t2, $zero, 1
	#x = 42
	addi $t3, $zero, 42

FOR:	
	beq $t1, $zero, SAI
	
	#x *= j
	mul $t4,$t3,$t2
	sw $t4, 0($t0)
	
	#v[i]++
	addi $t0, $t0, 4
	
	#j++
	addi $t2, $t2, 1
	
	#i--
	addi $t1,$t1,-1
	j FOR
 SAI:
 	addi $v0, $zero, 10
 	syscall
 

	
