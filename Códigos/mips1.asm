#Programa que n�o faz nada mas exemplifica um conjunto de constru��es programacionais usuais

#addi = soma a constante ?? com o conteudo de $zero, e coloca seu conteudo no registrado $??
#la = l� o endereco do label ? e coloca no registrador $??
#lw = l� o conteudo do endere�o do registrador $?? + e coloca no registrador $??
#sw = armazena o conteudo do registrador $?? no endere�o presente no registrador $?? + 0  
#mul = multiplica o conteudo presente no registrador $?? pelo conteudo presente no registrador $??, e armazena no registrador $??
#slt = se $?? for menor que ??, seta 1, se nao seta 0
#bne = se $?? =/= $zero, v� para a etiqueta ??; caso contrario saia do la�o
#beq = se ?? == ??, v� para a etiqueta ??; caso contrario continue
# jal =  # registre a prox�ma linha no registrador $ra e v� para a etiqueta ??
# jr $ra = v� para $ra ( ou seja, v� para a proxima linha de jal)
#$sp =  base da pilha
#$gp =  topo da pilha

.data
	a: .space 4 # declara��o  de  um label  a com 4 bytes (inteiro)
	b: .space 4 # declara��o  de  um label  b com 4 bytes (inteiro)
	c: .space 4 # declara��o  de  um label  c com 4 bytes (inteiro)

	v: .space 40 #  declara��o de um vetor de inteiros com 10 posi��es (4 bytes * 10 = 40 bytes)
	pa: .space 4 #  declara��o de um ponteiro para a (4 bytes)

.text
	addi $t0, $zero, 42 # soma a constante 42 com o conteudo de $zero, e coloca seu conteudo no registrado $t0

	la $t1, a # l� o endere�o do label a e coloca no registrador $t1
	sw $t0, 0($t1) # armazena o conteudo do registrador $t0 no endere�o presente no registrador $t1 + 0  
 
	la $t1, b # l� o endere�o do label b e coloca no registrador $t1
	sw $t0, 0($t1) # armazena o conteudo do registrador $t0 no endere�o presente no registrador $t1 + 0  

	la $t1, c #  l� o endereco do label c e coloca no registrador $t1
	sw $t0, 0($t1) #  armazena o conteudo do registrador $$t0 no endere�o presente no registrador $t0 + 0  

	la $t1,a   # l� o endereco do label a e coloca no registrador $t1  
	la $t7, pa # l� o endereco do label pa e coloca no registrador $t7 

	sw $t1, 0($t7) #  armazena o conteudo do registrador $t1(no caso, o endere�o de a) no endere�o presente no registrador $t7 + 0 
		       # => *pa = &a
	lw $s6, 0($t1) # l� o conteudo do endere�o do registrador $t1 + 0(no caso, o conteudo de a) e coloca no registrador $s6
		       # => s6 = *a
		       
	la $t0, b  # l� o endereco do label b e coloca no registrador $t0
	la $s0, v  # l� o endereco do label v e coloca no registrador $s0

	lw $s7, 0($t0) # l� o conteudo do endere�o do registrador $t0 + 0(no caso, o conteudo de b) e coloca no registrador $s7
		       # => s7 = *b[0]
