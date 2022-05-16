#if(c >= 0) && (c <= 42){

#}

MAIN:
	addi $t7, $zero, 42 
	addi $s7, $zero, 20	#c 
IF:
	beq $s7, $t7, CORPOIF   
	beq $s7, $zero, CORPOIF 

	slt $t0, $zero, $s7 
	slt $t1, $s7, $t7   
	
	and $t2, $t0, $t1
	beq $t2, $zero, SAI1 
CORPOIF:
	li $t1, 1000
SAI1:
	addi $v0, $zero, 10 
	syscall




