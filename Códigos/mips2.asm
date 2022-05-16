#demonstracao basica 

 
.data
	str1: .asciiz "digite um num: " 

.text

	addi $v0, $zero, 1
	addi $a0, $zero, 42 
	syscall 

	addi $v0, $zero, 1 
	addi $a0, $zero, 46 
	syscall 
	
	addi $v0, $zero, 4 
	la $a0, str1 
	syscall

	addi $v0, $zero, 5
	syscall 

	add $a1, $zero, $v0
	
	addi $v0, $zero, 1  
	add $a0, $zero, $a1  

	syscall 
	
	


