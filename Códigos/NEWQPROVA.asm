 .data
	v: .space 40
	str: .asciiz "\n"
.text
MAIN:
		la $s0, v #$s0 = &v
		sw $s0, 0($sp) #salva o endereço do vetor na pilha
		
		addi $s1, $zero, 10 #$s1 = 10
		sw $s1, 4($sp) #salva o tamanho do vetor na pilha
		
FORI:	#for que zera o vetor
		beq $s1, $zero, EXITFORI

		sw $zero, 0($s0)

		add $s0, $s0, 4
		addi $s1, $s1, -1
		
		j FORI
EXITFORI: #reinicia as declarações
		lw $s0, 0($sp)
		lw $s1, 4($sp)
FORII: #le 10 numeros naturais
		beq $s1, $zero, EXITFORII
		
		addi $v0, $zero, 5 #le um numero inteiro
		syscall 
		
		slt $s3, $v0,$zero # se x < 0, seta 1; se nao, seta 0
		bne $s3, $zero, CONVERTE 
SALVA:
		sw $v0,0($s0)
		addi $s0, $s0, 4
		addi $s1, $s1, -1
		j FORII
		
CONVERTE:
		mul $v0, $v0, -1
		j SALVA
EXITFORII: #reinicia as variaveis, chama a função e depois reinicia as variaveis
		lw $s0, 0($sp)
		lw $s1, 4($sp)
		
		add $a0,$zero, $s0 #argumento da função
		add $a1, $zero, $s1 #argumento da função
		
		jal CUBO
		
		lw $s0, 0($sp)		
		
FORIII: #for que imprime o cubo de todos os números
		beq $s1, $zero, SAI
		
		lw $s3, 0($s0)
		
		add $a0, $zero, $s3
		addi $v0, $zero, 1
		syscall
		
		addi $v0, $zero, 4
		la $a0, str
		syscall
		
		addi $s0, $s0, 4
		addi $s1, $s1, -1
		
		j FORIII
SAI:
	 	addi $v0, $zero, 10
	 	syscall
	 	
CUBO:
	 
FORIV:
	 	beq $a1, $zero, RETURNCUBO
	 	
	 	lw $t0, 0($a0)
	 	
	 	mul $t1, $t0, $t0
	 	mul $t2, $t1, $t0
	 	
	 	sw $t2, 0($a0)
	 	
	 	addi $a0, $a0, 4
	 	addi $a1, $a1, -1
	 	
	 	j FORIV
RETURNCUBO:
		jr $ra
