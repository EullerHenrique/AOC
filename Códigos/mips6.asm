#for

#x = 1;
#a = 2;
#b = 3;

#for(int i = 0; i < 10; i++){
#}


.data
	
.text

MAIN: 

	li $s0, 1   
	li $s1, 2    
	li $s2, 3    
	add $s3, $zero, $zero 
FOR: 
	slti $t5, $s3, 10     
	beq $t5, $zero, EXIT 	
	
	mul $t0, $s1, $s1 #a^2           
	add $t1, $t0, $s2 #a^2 + b     
	add $s0, $s0, $t1 #x += a^2 + b 

	addi $s3, $s3, 1 
	j FOR          
	
EXIT: 
	addi $v0, $zero, 10  
	syscall
	
	
