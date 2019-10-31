.data 						#Declarations
InputVariable: .space 10			#Variable for user input 

.text						#Instructions stored in text segment at next available address
.globl main					#Allows main to be refrenced anywhere

main:
	li $v0, 8				#Allows user to input
	la $a0, InputVariable			#Saves input to  variable
	li $a1,11 				#Limits the input to 10
	syscall 				#Issues a System Call
	
	la $t1,InputVariable			#Load the variable to the register $t1
	li $t2,0				#Initialize $t2 to calculate sum
	li $t3,32				#Stored a space in $t3 to check for spaces
	li $t6,0				#Initialized a register to 0
	li $t4,0x0A				#Created a new line here 
	li $s1, 65				#Beginning of Capital Letters for ASCII
	li $s2, 89				#Ending of Capital Letters for ASCII
	
loop: 						#Loops through all letters in string
	lb $t5,0($t1)				#Puts each character into $t5
	beq $t5,$t4, loop_ending		#End Loop when all characters are used
	beq $t5,$t3, ignore_char		#If a character is a space it will skip
	beq $t5,$t6, ignore_char		#If a character is 0 it will skip
	addi $t1,$t1, 1				#Increment to check next character in the loop
	j loop					#Restart the loop





loop_ending:					#After all summations this function prints the final result
	li $v0,1				#Prints the Summation of all characters
	move $a0, $t2				#Set contents of $t2 to $a1
	syscall					#Issues a System Call
	
	
ignore_char:					#Function checks if the char should be ignored
	addi $t1,$t1, 1				#Increment the user input to skip the current character	
	j loop					#Jump back to loop to check next value 	
		 	