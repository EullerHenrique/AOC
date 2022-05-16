#if(a < 0){
#
#}
#else if(a < 42){
#
#}
#else{
#
#}

.data

.text

MAIN:	addi $s7, $zero, 41 

IF:	
	slt $t0, $s7, $zero    
	beq $t0, $zero, ELSEIF  
	
	addi $t2, $zero, 10000
	
	j EXIT 
ELSEIF:
	slti $t0, $s7, 42     
	beq $t0, $zero, ELSE 
	
	addi, $t2, $zero, 5000

	j EXIT 
ELSE:
	addi $v0, $zero, 1    
	addi $a0, $zero, 100 
	syscall 
	j EXIT 
EXIT:
	addi $v0, $zero, 10 
	syscall



	


	 
	   
