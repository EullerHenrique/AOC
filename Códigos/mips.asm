.data
	v: .space 40
.text

	la $t1, v
	
	addi $s0, $zero, 42
	addi $s1, $zero, 21
	add $s2, $s0, $s1
	
	sw $s2, 12($t1)
	
	sub $s4, $s0, $s1
	sw $s4, 20($t1)
	
	add $s1, $zero, $s0 
	
	lw $s5, 12($t1)
	sub $s5, $s5, $s0
	sw $s5, 20($t1)
	
	