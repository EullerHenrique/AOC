#demonstracao basica
  
.data
	n: .space 4 			
	str1: .asciiz "digite um num: " 

.text	
	addi $v0, $zero, 4  		  
	la $a0, str1 
	syscall      
	
	addi $v0, $zero, 5 
	syscall
	
	la $t0, n     
	sw $v0, 0($t0)
		
	beq $v0, $zero, SAI 
	
	add $a1, $zero, $v0
	
	li $v0, 1           
	add $a0, $zero, $a1  	
	syscall 
		 		 		 	
SAI: 
	addi $v0, $zero, 10  
	syscall

	
	
	


