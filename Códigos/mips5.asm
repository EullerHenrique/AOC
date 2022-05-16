#while

#x = 1;
#a = 2;
#b = 3;

#while(x < 4200){
# x += a^2 + b;
#}

.data

.text

MAIN: 
	
	li $s0, 1    #s0 = x 
	li $s1, 2    #s1 = a
	li $s2, 3    #s2 = b 
	li $t0, 4200         
WHILE:
	slt $t1, $s0, $t0     
	beq $t1, $zero, EXIT 

	mul $t2, $s1, $s1 #a^2         
	add $t3, $t2, $s2 #a^2 + b      
	add $s0, $s0, $t3 #x += a^2 + b 
	j WHILE 
EXIT: 
	addi $v0, $zero, 10
	syscall