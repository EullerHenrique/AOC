#Escreva um programa que leia 10 inteiros, salve-os em um array  e então calcule a soma de todos os pares
#i = 10;

#do{
#	scanf("%d",&x);
#	v[i] = x;
#	i--;
#}while(i != 0);

#i = 0
#pares = 0;

#for(i = 0; i < 10; i++){
#	if(v[i] % 2 == 0){
#	  pares += v[i];
#	}
#} 
.data
	vetor: .space 40                  
	str1: .asciiz "Digite 10 inteiros: "

.text

MAIN:
	addi $v0, $zero, 4   		    
	la $a0, str1 
	syscall     
	
	addi $s0, $zero, 10 
	la $s7, vetor
DW:
	addi $v0, $zero, 5
	syscall
	
	sw $v0, 0($s7) 
	
	addi $s7, $s7, 4 
	
	addi $s0, $s0, -1 													
	bne $s0, $zero, DW 
MAIN2:
	add $s6, $zero, $zero 
	add $s0, $zero, $zero 
	
	la $s7, vetor
	addi $s3, $zero, 1  
FOR:	
	slti $t1, $s0, 10
	beq $t1, $zero, EXIT 
	
	lw $s2, 0($s7)
	and $t0, $s2, $s3    #se $t0 = 0, par
			     #se $t0 = 1, impar    
	bne $t0, $zero, NEXT 					 
	
	add $s6, $s6, $s2    #par += par			
NEXT:  
	addi $s7, $s7, 4 
	addi $s0, $s0, 1 
	j FOR         
EXIT:  addi $v0, $zero, 10
       syscall
