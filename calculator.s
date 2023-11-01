	.file	"calculator.c"
	.text
	.globl	add
	.type	add, @function
add:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %edx
	movl	-8(%rbp), %eax
	addl	%edx, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	add, .-add
	.globl	subtract
	.type	subtract, @function
subtract:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %eax
	subl	-8(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	subtract, .-subtract
	.globl	multiply
	.type	multiply, @function
multiply:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %eax
	imull	-8(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	multiply, .-multiply
	.section	.rodata
.LC0:
	.string	"Error: Cannot divide by 0."
	.text
	.globl	divide
	.type	divide, @function
divide:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	cmpl	$0, -8(%rbp)
	jne	.L8
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$-1, %eax
	jmp	.L9
.L8:
	movl	-4(%rbp), %eax
	cltd
	idivl	-8(%rbp)
.L9:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	divide, .-divide
	.globl	clearInput
	.type	clearInput, @function
clearInput:
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	nop
.L12:
	call	getchar@PLT
	movl	%eax, -4(%rbp)
	cmpl	$10, -4(%rbp)
	je	.L13
	cmpl	$-1, -4(%rbp)
	jne	.L12
.L13:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	clearInput, .-clearInput
	.section	.rodata
.LC1:
	.string	"Enter a number (0 - 9999)"
.LC2:
	.string	"%d"
	.align 8
.LC3:
	.string	"Invalid number.\nEnter a number (0 - 9999)."
	.align 8
.LC4:
	.string	"Enter another number (0 - 9999)"
	.align 8
.LC5:
	.string	"Invalid number.\nEnter another number (0 - 9999)."
	.text
	.globl	getNum
	.type	getNum, @function
getNum:
.LFB11:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	%eax, -8(%rbp)
	movl	$0, %eax
	call	clearInput
	jmp	.L15
.L16:
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	%eax, -8(%rbp)
	movl	$0, %eax
	call	clearInput
.L15:
	cmpl	$1, -8(%rbp)
	jne	.L16
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edx
	negl	%edx
	cmovns	%edx, %eax
	cmpl	$9999, %eax
	jg	.L16
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	%eax, -4(%rbp)
	movl	$0, %eax
	call	clearInput
	jmp	.L17
.L18:
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	%eax, -4(%rbp)
	movl	$0, %eax
	call	clearInput
.L17:
	cmpl	$1, -4(%rbp)
	jne	.L18
	movq	-32(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edx
	negl	%edx
	cmovns	%edx, %eax
	cmpl	$9999, %eax
	jg	.L18
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	getNum, .-getNum
	.section	.rodata
	.align 8
.LC6:
	.string	"\n\n ******************\n Welcome to Calculy\n ******************\n"
	.align 8
.LC7:
	.string	"Select an operation:\n[1] ADD\n[2] SUBTRACT\n[3] MULTIPLY\n[4] DIVIDE\n[5] EXIT"
.LC8:
	.string	"Invalid option selected.\n"
.LC9:
	.string	"The sum of %d + %d = %d\n\n"
	.align 8
.LC10:
	.string	"The difference of %d - %d = %d\n\n"
.LC11:
	.string	"The product of %d * %d = %d\n\n"
	.align 8
.LC12:
	.string	"The quotient of %d / %d = %d\n\n"
.LC13:
	.string	"Thank you for calculating."
	.text
	.globl	main
	.type	main, @function
main:
.LFB12:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L20
.L30:
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	-20(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	%eax, -16(%rbp)
	cmpl	$1, -16(%rbp)
	je	.L21
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	call	clearInput
	jmp	.L20
.L21:
	movl	-20(%rbp), %eax
	cmpl	$5, %eax
	ja	.L22
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L24(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L24(%rip), %rdx
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L24:
	.long	.L22-.L24
	.long	.L28-.L24
	.long	.L27-.L24
	.long	.L26-.L24
	.long	.L25-.L24
	.long	.L23-.L24
	.text
.L28:
	leaq	-24(%rbp), %rdx
	leaq	-28(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	getNum
	movl	-24(%rbp), %edx
	movl	-28(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	add
	movl	%eax, -12(%rbp)
	movl	-24(%rbp), %edx
	movl	-28(%rbp), %eax
	movl	-12(%rbp), %ecx
	movl	%eax, %esi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L20
.L27:
	leaq	-24(%rbp), %rdx
	leaq	-28(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	getNum
	movl	-24(%rbp), %edx
	movl	-28(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	subtract
	movl	%eax, -12(%rbp)
	movl	-24(%rbp), %edx
	movl	-28(%rbp), %eax
	movl	-12(%rbp), %ecx
	movl	%eax, %esi
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L20
.L26:
	leaq	-24(%rbp), %rdx
	leaq	-28(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	getNum
	movl	-24(%rbp), %edx
	movl	-28(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	multiply
	movl	%eax, -12(%rbp)
	movl	-24(%rbp), %edx
	movl	-28(%rbp), %eax
	movl	-12(%rbp), %ecx
	movl	%eax, %esi
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L20
.L25:
	leaq	-24(%rbp), %rdx
	leaq	-28(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	getNum
	movl	-24(%rbp), %edx
	movl	-28(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	divide
	movl	%eax, -12(%rbp)
	movl	-24(%rbp), %eax
	testl	%eax, %eax
	je	.L20
	movl	-24(%rbp), %edx
	movl	-28(%rbp), %eax
	movl	-12(%rbp), %ecx
	movl	%eax, %esi
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L20
.L23:
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L20
.L22:
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	call	clearInput
.L20:
	movl	-20(%rbp), %eax
	cmpl	$5, %eax
	jne	.L30
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L32
	call	__stack_chk_fail@PLT
.L32:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
