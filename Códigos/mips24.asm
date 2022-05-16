# int e(int b, int exp){
# 	int i, r = b;
# 	for(i=exp; i>1; i--){
# 	r = m(r,b);
# 	}
# return r;
# }

.data

.text
	addi $a0, $zero, 10 #b
	addi $a1, $zero, 10 #exp
	
	jal e
	
	add $a0, $zero, $v0
	addi $v0, $zero, 1  
	syscall 	          
SAI: 
        addi $v0, $zero, 10
        syscall
e:
	sw $ra,0($sp)
	addi $sp,$sp,-4 #pop
	
	add $t0, $zero, $a0 #r=b
	add $t1, $zero, $a1 #i=exp
	
FOR:
	addi $t3, $zero, 1
	beq $t1, $t3, RETURNE
	
	add $a0, $zero, $t0 #r
	add $a1, $zero, $a0 #b
	
	jal m
	
	add $t0,$t0, $v0
	
	addi $t1, $t1, -1
	j FOR

m:
	addi $v0, $zero, 100
	jr $ra
	
RETURNE:
	add $v0, $zero, $t0
	
	addi $sp,$sp,4
	lw $ra,0($sp)
	
	jr $ra
	
	
