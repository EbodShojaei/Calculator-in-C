# include <stdio.h>
# include <stdlib.h>

/**
 * Function to add two operands.
 */ 
int add(int operand_a, int operand_b) {
	return operand_a + operand_b;
}

/**
 * Function to subtract two operands.
 */ 
int subtract(int operand_a, int operand_b) {
	return operand_a - operand_b;
}

/**
 * Function to multiply two operands.
 */ 
int multiply(int operand_a, int operand_b) {
	return operand_a * operand_b;
}

/**
 * Function to divide two operands.
 */ 
int divide(int operand_a, int operand_b) {
	// Error handle divide by 0.
	if (operand_b == 0) {
		printf("Error: Cannot divide by 0.\n");
		return -1;
	}

	return operand_a / operand_b;
}

/**
 * Clears user inputs.
 * @see https://stackoverflow.com/questions/69997896/clearing-incorrect-scanf-inputs-in-c 
 */
void clearInput() {
	int c;
	while((c = getchar()) != '\n' && c != EOF);
}

/**
 * Function to scan for user input of two operands.
 */ 
void getNum(int *operand_a, int *operand_b) {
	// Prompt user to enter first operand.
	printf("Enter a number (0 - 9999)\n");
	int input_a = scanf("%d", operand_a);

	// Error handle invalid operand.
	while (input_a != 1 || abs(*operand_a) > 9999) {
		printf("Invalid number.\nEnter a number (0 - 9999).\n");
		clearInput();
		input_a = scanf("%d", operand_a);
	}
	
	// Prompt user to enter next operand.
	printf("Enter another number (0 - 9999)\n");
	int input_b = scanf("%d", operand_b);

	// Error handle invalid operand.
	while (input_b != 1 || abs(*operand_b) > 9999) {
		printf("Invalid number.\nEnter another number (0 - 9999).\n");
		clearInput();
		input_b = scanf("%d", operand_b);
	}
}

/**
 * Driver function.
 */
int main() {
	int operand_a;
	int operand_b;
	int operator;
	int result;
	
	// Welcome the user.
	printf("\n\n ******************\n Welcome to Calculy\n ******************\n\n");

	// Enable looping for repeated computations.	
	while (operator != 5) {
		// Prompt user to select an operation.
		printf("Select an operation:\n[1] ADD\n[2] SUBTRACT\n[3] MULTIPLY\n[4] DIVIDE\n[5] EXIT\n");
	
		// Error handle non-int input.	
		int choice = scanf("%d", &operator);
		if (choice != 1) {
			printf("Invalid option selected.\n\n");
			clearInput();
			continue;
		}

		switch (operator) {
			case 1: // Addition
				getNum(&operand_a, &operand_b);
				result = add(operand_a, operand_b);
				printf("The sum of %d + %d = %d\n\n", operand_a, operand_b, result);
				break;
			case 2: // Subtraction
				getNum(&operand_a, &operand_b);
				result = subtract(operand_a, operand_b);
				printf("The difference of %d - %d = %d\n\n", operand_a, operand_b, result);
				break;
			case 3: // Multiplication
				getNum(&operand_a, &operand_b);
				result = multiply(operand_a, operand_b);
				printf("The product of %d * %d = %d\n\n", operand_a, operand_b, result);
				break;
			case 4: // Division
				getNum(&operand_a, &operand_b);
				result = divide(operand_a, operand_b);
				if (operand_b != 0) printf("The quotient of %d / %d = %d\n\n", operand_a, operand_b, result);
				break;
			case 5:
				printf("Thank you for calculating.\n");
				break;
			default:
				// Error handle invalid int input ( > 5 || < 1 ).
				printf("Invalid option selected.\n\n");
				clearInput();
		}
	}

	return 0;
}
