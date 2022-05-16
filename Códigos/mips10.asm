# int main(){
#   int x = func1(42);
#   printf("%d",x)
#   return 0
# }
# int func1(int a){
#    return a*a;
# }


.data

.text

MAIN:	
	addi $a0, $zero, 42 #argumento da função
	jal FUNC1          
	
	add $a0, $zero, $v0
	add $v0, $zero, 1   
	syscall 	   

SAI:  
	li $v0, 10 
	syscall
FUNC1:
	mul $v0, $a0, $a0 
	jr $ra 
