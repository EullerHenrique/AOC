.data
str1: .asciiz "Entre com um inteiro: "
str2: .asciiz "O resultado é: "

.text
MAIN:
	  addi $v0, $zero, 4
	  la $a0, str1
	  syscall
	 
          addi $v0, $zero, 5 
	  syscall
	   
          add  $a0, $zero, $v0  #argumento da função = valor lido
          
          jal  COMPUTA
          
          add $s0, $zero, $v0
         
          addi $v0, $zero, 4
          la $a0, str2
          syscall
          
	  addi $v0, $zero, 1   
	  add $a0, $zero, $s0  
	  syscall		            
SAI:
          addi $v0, $zero, 10
          syscall
COMPUTA: 
	#i = 0
	add $t0, $zero, $zero
	
	#resultado = 0
	add $t1, $zero, $zero

FOR:
	slt $t2, $t0, $a0 
	beqz $t2, RETURNCOMPUTA  
	
	add $t1, $t1, $a0 # soma+= x
	
	addi $t0, $t0, 1  #i++
	
	j FOR 
RETURNCOMPUTA:	
	add $t1, $t1, $a0 # x^2 + x
	
	addi $v0, $t1, 42 # x^2 + x + 42
	
	jr $ra #vá para $ra ( ou seja, vá para a proxima linha de jal COMPUTA)


