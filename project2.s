#This program takes user's input, compares it to condtions, and prints out approriate message/output
.data
	emptyInput: .ascizz "Input is empty." #message for empty string
	longInput: .ascizz "Input it is too long." #messgae for string that has more than 4 characters
	invalidInput: .ascizz "Invalid base-35 number." #message for string that includes one or more characters not in set


