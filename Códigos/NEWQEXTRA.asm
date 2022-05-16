.data
	v: .space 40
	str1: .asciiz "\n"
.text
MAIN:
	la $s0, v
	sw $s0, 0($sp)
	
	addi $s1, $zero, 10
	sw $s1, 4($sp)
	
	
FORI: #zera o vetor
	beq $s1, $zero, RETURNFORI
	
	add $s3, $zero, $zero
	sw $s3,0($s0)
	
	addi $s0, $s0, 4
	addi $s1, $s1, -1
	
	j FORI

RETURNFORI: #reinicia as váriaveis
	lw $s0, 0($sp)
	lw $s1, 4($sp)
FORII: #lê 10 elementos
	beq $s1, $zero, RETURNFORII
	
	add $v0, $zero, 5
	syscall

	slt $s3, $v0, $zero
	bne $s3, $zero, CONVERTE	
	
SALVA:	
	sw $v0, 0($s0)
	
	addi $s0, $s0, 4
	addi $s1, $s1, -1
	
	j FORII

CONVERTE:
	mul $v0, $v0, -1
	j SALVA

RETURNFORII: #define os argumentos da função, chama a função e reinicia as váriaveis
	lw $s0, 0($sp)
	lw $s1, 4($sp)
		
	add $a0,$zero, $s0
	add $a1,$zero, $s1
	
	jal CUBO
	
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	
FORIII: #imprime o cubo de cada elemento
	beq $s1, $zero, SAI
	
	lw $s3, 0($s0)

	addi $v0, $zero,1
	add $a0, $zero, $s3
	syscall
	
	la $v0, str1
	addi $a0, $zero, 5
	syscall
	
	addi $s0, $s0, 4
	addi $s1, $s1, -1
	
	j FORIII
	
SAI:
	addi $v0, $zero, 10
	syscall
CUBO:

FORIV: #for que calcula o cubo de cada elemento
	beq $a1, $zero, RETURNCUBO
	lw $s3,0($a0)
	
	##########################
	add $t1, $zero, $s3 #i = $s3
FORV: #Soma sucessiva para determinar o segundo multiplicando
	beq $t1, $zero, FORVI
	add $t2, $t2, $s3
	addi $t1, $t1, -1
	
	j FORV
FORVI: #Soma sucessiva para calcular o cubo de cada elemento
       #soma equivalente à s3 *(s3+s3+s3...)
       #	           s3+s3+s3+s3+s3+s3...
	beq $t2, $zero, CONTINUEFORIV
	add $t3, $t3, $s3
	addi $t2, $t2, -1
	j FORVI
CONTINUEFORIV:
	sw $t3, 0($a0)
	add $t2, $zero,$zero
	add $t3, $zero, $zero
	
	addi $a0, $a0, 4
	addi $a1, $a1, -1
	
	j FORIV

RETURNCUBO:
	jr $ra

	
	

	

