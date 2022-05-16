#for (long c = 42; c >=0; --c) {...}
.data
	c: .space 8
.text
MAIN:
	addi $s0, $zero, 42 #c
FOR:
 	slt $t1, $s0, $zero 
 	bne $t1, $zero, SAI 
 	
 	addi $s1,$s1,100
 	addi $s0, $s0, -1
 	j FOR
 
 SAI:
      addi $v0, $zero, 10 
      syscall
	

