# int main(){
#   int x = func1(42);
#   printf("%d",x)
#   return 0
# }

# int func1(int a){
#    return func2(a);
# }

# int func2(int a){
#    return a*a;
# }

#$sp =  base da pilha
#$gp =  topo da pilha

.data

.text

MAIN:
	addi $a0, $zero, 42 
	
	jal FUNC1 #registre a proxíma linha no registrador $ra e vá para FUNC1

	add $a0, $zero, $v0 
	add $v0, $zero, 1   
	syscall 	    
	
SAI:	li $v0, 10 
	syscall

FUNC1:
	sw $ra, 0($sp)     
	addi $sp, $sp, -4 # pop                #nega o acesso ao conteudo do $ra da main
	jal FUNC2 	  #     	       # registre a proxíma linha no registrador $ra e vá para FUNC2
	
	addi $sp, $sp, +4 # push               #permite o acesso ao conteudo do $ra da main			
	lw $ra, 0($sp)	  
					       
	jr $ra	 	  
FUNC2: 
	mul $v0, $a0, $a0
	jr $ra 