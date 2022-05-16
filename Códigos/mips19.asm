#longm(long a, long b){
#     long i, r = 0;
#     for(i=a; i>0; i--){
#     r += b;
#     }
#return r;
#} 

.data

.text
MAIN: 
	addi $a0, $zero, 10  #argumento da função
	addi $a1, $zero, 200 #argumento da funcão

	jal LONGGM           
       
        add  $a0, $zero, $v0 
	addi $v0, $zero, 1 
	syscall 	     
	
        addi $v0, $zero, 10 #return 0
        syscall
LONGGM:
	add $t0, $zero, $zero #i =0
	
	add $t1, $zero, $zero #r= 0
	
	add $t0, $zero, $a0   #i = a
	
FOR:	
	beq $t0, $zero, RETURNFOR

	add $t1, $t1, $a1  #r += b
	
	addi $t0, $t0, -1 #i--
	j FOR

RETURNFOR:
	add $v0, $zero, $t1
	jr $ra

	
	

