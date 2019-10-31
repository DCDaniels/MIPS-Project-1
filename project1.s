.data 						#Declarations
InputVariable: .space 10			#Variable for user input 

.text
.globl main

main:
	li $v0, 8				#Allows user to input
	la $a0, InputVariable			#Saves input to  variable
	li $a1,11 				#Limits the input to 10
	syscall 				#Issues a System Call
	
	la $t1, InputVariable			#Load the variable to the register $t1
	li $t2,0				#Initialize $t2 for sum
	li $t3,32				#Stored a space in $t3 to check for spaces
	li $t4, 0x0A				#Created a new line here 
	
loop: 
	lb $t5,0($t1)				#Put the values into $t5
	 			
	

