# do_while

#x = 1;
#a = 2;
#b = 3;
	
#do{
#   x += a^2 + b;
#}while(x < 4200);

.data

.text

MAIN: 
	li $s0, 1    #s0 = x 
	li $s1, 2    #s1 = a 
	li $s2, 3    #s2 = b 
	li $t0, 4200         
DW:	

	mul $t1, $s1, $s1 #a^2        
	add $t2 , $t1, $s2 #a^2 + b    
	add $s0 , $s0, $t2 #x += a^2 + b 
	
	slt $t3, $s0, $t0 
	bne $t3, $zero, DW

SAI:  
	addi $v0, $zero, 10  
        syscall
	
