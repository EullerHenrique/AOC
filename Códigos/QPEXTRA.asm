# for(i=0; i < 1000; i++){
#     x[i] = x[i] * y[i];
# }
.data
	x: .space 4000
	y: .space 4000
	cx: 1 
	cy: 2
	cc: 999
		str: .asciiz "i: "
		str2: .asciiz "\n"
		str3: .asciiz " - "
		
.text
#1
	la $s0, x
#2
	la $s1, y
#3	
	la $s2, cx
#4
	lw $s2, 0($s2)
#5	
	sw $s2, 0($s0)
#6
	la $s3, cy
#7
	lw $s3, 0($s3)
#8	
	sw $s3, 0($s1)
#9	
	la $s4, cc
#10
	lw $s4, 0($s4)
LOOP:
#11
	lw $t0, 0($s0)
#12
	lw $t1, 0($s1)
#13
	mul $t0, $t0, $t1
	
	addi $v0, $zero, 4
	la   $a0, str
	syscall		
	
	add $a0, $zero, $s4
	li $v0, 1
	syscall
					
	addi $v0, $zero, 4
	la   $a0, str3
	syscall	
	
	add $a0, $zero, $t0
	li $v0, 1
	syscall
	
						
	addi $v0, $zero, 4
	la   $a0, str2
	syscall													
	
#14	
	sw $t0, 0($s0)
#15
	addi $s0, $s0, 4
#16
	addi $s1, $s1, 4
#17	
	addi $s2, $s2, 1
#18	
	addi $s3, $s3, 2
#19	
	addi $s4, $s4, -1
#20	
	sw $s2, 0($s0)
#21	
	sw $s3, 0($s1)
#22
	bge $s4, $zero, LOOP
