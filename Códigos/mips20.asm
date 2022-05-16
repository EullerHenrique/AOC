
.text
	#$a0 = n
	addi $a0, $zero, 5
FAT:	
	################PILHA###################################################################################
	addi $sp, $sp, -8   #nega o acesso ao conteudo do $ra anterior e do $a0 anterior
			    #pop  
	
	sw $a0, 0($sp)      #armazena o conteudo do registrador $a0 atual no endere�o presente no registrador $sp + 0  
			    #Ou seja, armazena o conteudo de $a0 atual na pilha(na memoria)
	sw $ra, 4($sp)      #armazena o conteudo do registrador $r0 atual no endere�o presente no registrador $sp + 4  
			    #Ou seja, armazena o conteudo de $ra atual na pilha(na memoria)
			    
	#########################################################################################################
	
	######################################
	slti $t0, $a0, 1    #n � menor que 1?
	beq $t0, $zero, L1  #v� para L1
	######################################

	
	addi $v0, $zero, 1  #retorna 1
	
	
	##########################################################################################################
	addi $sp, $sp, 8    #permite o acesso ao conteudo do $ra anterior e do $a0 anterior	
			    #push
	##########################################################################################################
	
	##########################################################################################################
	jr $ra #v� para linha seguinte do jal FAT da L1
	#########################################################################################################
	
L1:
	#N-1
	addi $a0, $a0, -1
	jal FAT
	
	###recurs�o####################################################################################
	
        lw $a0,0($sp)  #l� o conteudo do endere�o do registrador $sp + 0, e coloca no registrador $a0
		       #Ou seja, acessa o $a0 atual
	lw $ra, 4($sp) #l� o conteudo do endere�o do registrador $sp + 4, e coloca no registrador $ra
		       #Ou seja, acesas o $ra atual
	################################################
	addi $sp, $sp, 8  #permite o acesso ao conteudo do $ra anterior e do $a0 anterior	
			  #push
	mul $v0, $v0, $a0
	jr $ra         #v� para a linha seguinte da jalFAT da L1
		       #quando $ra == 0, o programa acaba
		       #quando $ra == 0 significa que a pilha voltou para o topo
	##fimRecursao################################################	
