#This program takes user's input, compares it to conditions, and prints out appropriate message/output
.data
	emptyInput: .ascizz "Input is empty." #message for empty string
	longInput: .ascizz "Input it is too long." #messgae for string that has more than 4 characters
	invalidInput: .ascizz "Invalid base-35 number." #message for string that includes one or more characters not in set
.text
	main:
		li $v0, 8 #syscall to read string
		la $a0, userInput #stores address of string
		li $a1, 500 #create ample space for string input
