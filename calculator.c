# include <stdio.h>
# include <stdlib.h>

int add(int operand_a, int operand_b) {
	return operand_a + operand_b;
}

int main() {
	int operand_a;
	int operand_b;
	int operator;
	int result;

	// Enable looping for repeated computations.	
	while (operator != 5) {
		printf("\n ******************\n Welcome to Calculy\n ******************\n\n");

		// Prompt user to enter two operands.
		printf("Enter a number (0 - 9999)\n");
		scanf("%d", &operand_a);
		printf("Enter another number (0 - 9999)\n");
		scanf("%d", &operand_b);
		printf("You entered: %d, %d\n", operand_a, operand_b);
	
		// Prompt user to select an operation.
		printf("Select an operation:\n[1] ADD\n[2] SUBTRACT\n[3] MULTIPLY\n[4] DIVIDE\n[5] EXIT\n");
		scanf("%d", &operator);

		result = 0; // Zero-out result for next operation.
		switch (operator) {
			case 1:
				int result = add(operand_a, operand_b);
				printf("The sum of %d + %d = %d\n", operand_a, operand_b, result);
				break;
			case 5:
				printf("Thank you for calculating.\n");
				return 0;		
		}
	}





	return 0;
}
