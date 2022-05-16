.data
	v: .space 40  #int v[10]
.text

	la $t1, v
	
	addi $s0, $zero, 42 #x = 42
	addi $s1, $zero, 21 #y = 21
	add $s2, $s0, $s1   #z = x + y
	
	sw $s2, 12($t1)     #v[3] = y
	
	sub $s4, $s0, $s1   #x-y
	sw $s4, 20($t1)     #v[5] = x - y
	
	add $s1, $zero, $s0 #y = x
	
	lw $s5, 12($t1)    #v[3]
	sub $s5, $s5, $s0  #v[3] - x
	sw $s5, 20($t1)    #v[5] = v[3] - x
	
	
