.data 		#Declarations
InputVariable: .space  #Variable for user input 

.globl main
main:
	li $v0, 8				#Allows user to input
	la $a0, InputVariable			#Saves input to  variable
	li $a1,11 				#Limits the input to 10
	syscall 				#Issues a System Call
	

