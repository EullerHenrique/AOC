.data
	x: .space 400
	y: .space 400
	c: 42
	c2: 100
.text
	addi $s2, $s2

	la $s0, x
	la $s1, y
	la $s2, c
	la $s3, 0($s3)
	
LOOP:
	lw $t0, 0($s1)
	mul $t0, $t0, $s2
	sw $t0, 0($s0)
	
	addi $s0, $s0, 4
	addi $s1, $s1, 4
	
	addi $s3,$s3, -4
	bge $s3, $zero, LOOP

