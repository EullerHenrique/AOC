#long c = 0;
#while (c < 42)
#{
# c++;
#}

.data

.text
MAIN:
	add $s0, $zero, $zero #c
WHILE: 
	slti $t1, $s0, 42 
	beq $t1, $zero, SAI

	addi $s1,$s1,100
	addi $s0, $s0, 1

	j WHILE  
SAI:
	addi $v0, $zero, 10 
	syscall
