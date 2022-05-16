.data
	v: .space 40 
	str: .asciiz "\n"
.text
MAIN:
	la $s0, v               #$s0 = &v
	addi $s1, $zero, 10	# i = tam_vet
	add $s2, $zero, $zero   # j = 0, será utilizado para testar se o número é positivo		
FORI:
	beq $s1, $zero, EXITFORI
	
	add $s4, $zero, $zero
	
	sw $s4, 0($s0) 

	addi $s0, $s0, 4 
	
	addi $s1, $s1, -1 
	
	j FORI    

EXITFORI:
	la $s0, v   
	addi $s1, $zero, 10	# i = tam_vet
       
FORII:
	beq $s1, $zero, EXITFORII
	
	addi $v0,$zero, 5         #lê um numero inteiro
	syscall		
	
	
        slt $s3, $v0, $s2         #testa se o número lido é negativo
	bne $s3, $zero, CONVERTE
	
SALVA:
	sw	$v0, 0($s0)       #salva o número lido na memória / *$s0 = $v0
	addi	$s0, $s0, 4       #v[i]++
	
	addi	$s1, $s1, -1      #i--
	j	FORII
	
CONVERTE:
	mul $v0, $v0, -1        #faz o número se tornar positivo
	j SALVA

EXITFORII:
	la $s0, v	
	add $a0, $zero, $s0  #argumento da função = endereço do vetor
	addi $a1, $zero, 10  #argumento da função = tamanho do vetor
	
	jal CUBO
	
	la $s0, v
	addi $s1, $zero, 10	# i = tam_vet
	
FORIII:
	beq $s1, $zero, SAI
	
	lw $s3, 0($s0)
	
	add $a0, $zero, $s3
	li $v0, 1
	syscall
	
	addi $v0, $zero, 4
	la   $a0, str
	syscall							
	
	addi $s1, $s1, -1      #i--
	addi $s0, $s0, 4	
	
	j FORIII
	
SAI: 
        addi $v0, $zero, 10
        syscall
CUBO:
	
FORIV:
	beq $a1, $zero, RETURNCUBO
	
	lw $t0, 0($a0)
	
	mul $t1, $t0, $t0 #$t0 * $t0
	mul $t2, $t0, $t1 #$t0 * $t0 * $t0
        
        sw $t2, 0($a0)
      	
      	addi $a0, $a0, 4   #v[i]++       
        addi $a1, $a1, -1  #i--
      
        j FORIV       
RETURNCUBO:
	jr $ra	