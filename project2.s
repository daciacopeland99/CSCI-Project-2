#This program takes user's input, compares it to conditions, and prints out appropriate message/output
.data
	emptyInput: .ascizz "Input is empty." #message for empty string
	longInput: .ascizz "Input it is too long." #messgae for string that has more than 4 characters
	invalidInput: .ascizz "Invalid base-35 number." #message for string that includes one or more characters not in set
	userInput: .space 1000
.text
	main:
		li $v0, 8 #syscall to read string
		la $a0, userInput #stores address of string
		li $a1, 500 #create ample space for string input
        syscall
        add $t0, $0, 0 #initialize $t0 register
        add $t1, $0, 0 #initialize $t1 register

        la $t2, userInput #load string into $t2 register
        lb $t0, 0($t2)
        beq $t0, 10, isEmpty #check for an empty string
        beq $t0, 0 isEmpty

        addi $s0, $0, 35 #store Base-N number
        addi $t3, $0, 1 #initialize new registers
        addi $t4, $0, 0
        addi $t5, $0, 0

         ignoreSpaces:
            lb $t0, 0($t2) #load address in $t2 to $t0
            addi $t2, $t2, 1 #increment pointer
            addi $t1, $t1, 1 #increment counter
            beq $t0, 32, ignoreSpaces #jump to ignoreSpaces branch if equal
	    beq $t0, 10, isEmpty #jump to isEmpty branch if equal
            beq $t0, $0, isEmpty #jump to isEmpty branch if equal

        viewChars:
            lb $t0, 0($t2)
            addi $t2, $t2, 1
	    addi $t1, $t1, 1
            beq $t0, 10, restart
            beq $t0, 0, restart
            bne $t0, 32, viewChars
	    
	 viewRemaining:
            lb $t0, 0($t2)
            addi $t2, $t2, 1
            addi $t1, $t1, 1
            beq $t0, 10, restart
	    beq $t0, 0, restart
            bne $t0, 32, isInvalid #jump to isInvalid branch if not equal
            j viewRemaining
	    
	restart:
	    sub $t2, $t2, $t1 #restart the pointer
            la $t1, 0 #restart the counter

        continue:
            lb $t0, 0($t2)
            addi $t2, $t2, 1
	    beq $t0, 32, continue
        addi $t2, $t2, -1

        stringLength:
            lb $t0, ($t2)
            addi $t2, $t2, 1
	    addi $t1, $t1, 1
            beq $t0, 10, doLoop
            beq $t0, 0, doLoop
            beq $t0, 32, doLoop
            beq $t1, 5, isTooLong
