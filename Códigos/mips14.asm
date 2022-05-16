.data
	a: .space 8
	b: .space 8
	c: .space 8
	d: .space 8
	e: .space 8
	f: .space 8
	g: .space 8
	h: .space 8
	
.text
	
	#a) a = 0
	addi $s0, $zero, 0#a
	la   $t0, a       #$t0 = &a
        sw   $s0, 0($t0)  #*$t0= $s0
	
	#b) b= 42
	addi $s1, $zero, 42#b
	la   $t0, b        #$t0 = &b
        sw   $s1, 0($t0)   #*$t0 = $s1
	
	addi $s2, $zero, 200#c
	la   $t0, c         #$t0 = &c
        sw   $s2, 0($t0)    #*$t0 = $s2 
	
	addi $s3, $zero, 10000#d
	la   $t0, d           #$t0 = &d
        sw   $s3, 0($t0)      #*$t0 = $s3 
	
	
	addi $s4, $zero, 100#e
	la   $t0, e         #$t0 = &e
        sw   $s4, 0($t0)    #*$t0 = $s4
	
	addi $s5, $zero, 50#f
	la   $t0, f        #$t0 = &f
        sw   $s5, 0($t0)   #*$t0 = $s5
	
	addi $s6, $zero, 5 #g
	la   $t0, g        #$t0 = &g
        sw   $s6, 0($t0)   #*$t0 = $s6
	
	addi $s7, $zero, 4#h
	la   $t0, h       #*$t0 = &h
        sw   $s7, 0($t0)  #*$t0 = $s7
	
	#c) a = (b+c)/(c-d)
	
	
	add $t1, $s1, $s2 #b+c
	sub $t2, $s2, $s3 #c-d
 	div $t3, $t1, $t2 #(b+c)/(c-d)
 	
 	la $t0, a
        sw $t3, 0($t0)  
 	
	#d) a = (a+B+c+d)/(e-f-g-h)
	add $t1, $s0, $s1
	add $t1, $t1, $s2
	add $t1, $t1, $s3
	
	sub $t2, $s4, $s5
	sub $t2, $t2, $s6
	sub $t2, $t2, $s7
	
	div $t3, $t1, $t2
	
	la $t0, a
	sw  $t3, 0($t0) 
	
	#e) a = a/b + c/d + e*f - g*h;
	div $t1, $s0, $s1 #a/b
	div $t2, $s2, $s3 #c/d
	mul $t3, $s4, $s5 #e*f
	mul $t4, $s6, $s7 #g*h
	
	add $t5, $t1, $t2
	add $t5, $t5, $t3
	sub $t5, $t5, $t4
	
	la $t0, a
	sw  $t5, 0($t0) 
	
	#f) a = 42 + b - (54 * a);
	
	addi $t1, $s1, 42
	mul $t2, $s0, 54
	sub $t3, $t1,$t2
	
	la $t0, a
	sw  $t3, 0($t0) 
	  
	
	
	
	
	
	
	 
	
	
	

	

	
	
	
	
	
	
	
