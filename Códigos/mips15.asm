#if (c < 42){
#}

.data


.text	
	addi $s0, $zero, 41 #c
	addi $s1, $zero, 42
	
	slt $t0, $s0, $s1     
	beq $t0, $zero, SAI  
	
	addi, $t2, $zero, 10000
SAI: 
	addi $v0, $zero, 10
	syscall

