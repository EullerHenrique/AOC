#O programa le um inteiro, calcula um polinomio e retorna seu valor

.data

.text
MAIN:
          addi $v0, $zero, 5 
	  syscall
	  
          add  $a0, $zero, $v0  
          jal  COMPUTA

          add $a0, $zero, $v0
	  addi $v0, $zero, 1  
	  syscall 	          
 SAI: 
          addi $v0, $zero, 10
          syscall
COMPUTA: 
         sw $ra, 0($sp)   
	 addi $sp, $sp, -4 # pop               #nega o acesso ao conteudo do $ra da main
        
         add   $a1, $zero, $a0	 #segundo multiplicando, como é ao quadrado, o segundo multiplicando é o proprio numero
                              		       
         jal   SOMSUS                          # registre a prox�ma linha no registrador $ra e v� para FUNC2
        
         add   $t7, $zero, $v0 #y = x^2
         add   $t7, $t7, $a0   #y = x^2 + x 
         addi  $t7, $t7, 42    #y = X^2 + x + 42
         add   $v0, $t7, $zero #return 
         
         addi $sp, $sp, +4 # push               #permite o acesso ao conteudo do $ra da main			
	 lw $ra, 0($sp)	  
         
         jr    $ra                             
SOMSUS:  
	 add   $s7, $zero, $zero  #soma
         add   $s5, $zero, $zero  #i = 0
FOR:    
	 slt   $t1, $s5, $a1    
         beq   $t1, $zero, RETURNSOMSUS   
        
         add   $s7, $s7, $a0   #$s7 += $s7    
   
         addi $s5, $s5, 1  #i++
     
         j   FOR	      
         
RETURNSOMSUS:    
	add   $v0, $zero, $s7 
        jr    $ra             
