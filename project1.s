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
	li $s1, 64				#Beginning of Capital Letters for ASCII
	li $s2, 89				#Ending of Capital Letters for ASCII
	li $s3, 97				#Beginning of Common Letters for ASCII
	li $s4, 122				#Ending of Common Letters for ASCII
	li $s5, 0				#Placeholder for calculations
	
loop: 						#Loops through all letters in string
	lb $t5,0($t1)				#Puts each character into $t5
	beq $t5,$t4, loop_ending		#End Loop when all characters are used
	beq $t5,$t3, ignore_char		#If a character is a space it will skip
	beq $t5,$t6, ignore_char		#If a character is 0 it will skip
	bgt $t5,$s1, capital_letters		#If character > 65 go to capital_letters
	
	addi $t1,$t1, 1				#Increment to check next character in the loop
	j loop					#Restart the loop





loop_ending:					#After all summations this function prints the final result
	li $v0,1				#Prints the Summation of all characters
	move $a0, $t2				#Set contents of $t2 to $a1
	syscall					#Issues a System Call
	
	
ignore_char:					#Function checks if the char should be ignored
	addi $t1,$t1, 1				#Increment the user input to skip the current character	
	j loop					#Jump back to loop to check next value 	
	
	
capital_letters:				#Function that makes sure to check for capital letters
	bgt $t5,$s2, common_letters		#Branch to common letters function if > 89 
	addi $s5,$t5,-55			#Stores the decimal value of capital letters in $s5
	add $t2,$t2,$s5				#Store the sum into $t2
	
common_letters:					#Function that makes sure to check for common letters
	blt $t5,$s3, ignore_char		#Branch if in between 89-97
	bgt $t5,$s4, ignore_char		#Branch if in greater than 122



		 	