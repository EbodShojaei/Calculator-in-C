section .data
    welcome db 10, "Welcome to Calculy", 10
    welcome_len equ $-welcome

    prompt db "Enter a number (0-9999): ", 10  ; Adjusted prompt
    prompt_len equ $-prompt

    choices db "Please choose an option:", 10, "1. Add", 10, "2. Subtract", 10, "3. Multiply", 10, "4. Divide", 10, "5. Exit", 10
    choices_len equ $-choices

    err_msg db "Error: Invalid input or operation.", 10
    err_msg_len equ $-err_msg

    err_div_zero_msg db "Error: Division by zero.", 10
    err_div_zero_msg_len equ $-err_div_zero_msg

    result_str db "Result of "
    result_str_len equ $-result_str

    plus_str db " + "
    plus_str_len equ $-plus_str

    sub_str db " - "
    sub_str_len equ $-sub_str

    mul_str db " * "
    mul_str_len equ $-mul_str

    div_str db " / "
    div_str_len equ $-div_str

    equal_str db " = "
    equal_str_len equ $-equal_str

section .bss
    output_buffer resb 20 ; 8 digits (0-99999999), null-terminator, and new-line
    input_buffer resb 5 ; 4 digits (0-9999) and null-terminator

section .text
    global _start

_start:
    ; Display welcome message
    mov rsi, welcome
    mov rdx, welcome_len
    call display_message

    ; Display choices and read choice
    mov rsi, choices     ; rsi used to store the string of chars
    mov rdx, choices_len ; rdx used to store number of chars
    call display_message
    call read_number
    mov r8, rax ; Save choice to r8

    ; Check if exit is chosen
    cmp r8, 5
    je .exit_program

    ; Read first number
    mov rsi, prompt
    mov rdx, prompt_len
    call display_message
    call read_number
    mov rcx, rax ; Save first number to rcx

    ; cmp rcx, 9999
    ; jae error  ; Jump to error if rcx >= 9999
    ; test rcx, rcx
    ; js error   ; Jump to error if rcx < 0

    ; Read second number
    mov rsi, prompt
    mov rdx, prompt_len
    call display_message
    call read_number
    mov rdx, rax ; Save second number to rdx
    
    ; cmp rdx, 9999
    ; jae error  ; Jump to error if rdx >= 9999
    ; test rdx, rdx
    ; js error   ; Jump to error if rdx < 0

    ; Perform operations based on choice
    call perform_operations
    jmp .exit_program

    ; Exit the program
    .exit_program:
        mov rax, 60
        xor rdi, rdi
        syscall

    ; Read a single digit number
    read_number:
        mov rax, 0 ; rax set to read
        mov rdi, 0 ; 0 = stdin
        mov rsi, input_buffer ; Use the input_buffer
        mov rdx, 5 ; Allow for up to 5 bytes including null-terminator
        syscall
        mov byte [rsi + rax - 1], 0 ; Null-terminate the string
        mov rdi, rsi
        call string_to_int ; convert string to int
        ret

    ; Perform operations and display them
    perform_operations:
        cmp r8, 1
        je .add
        
        cmp r8, 2
        je .subtract
        
        cmp r8, 3
        je .multiply
        
        cmp r8, 4
        je .divide
        
        cmp r8, 5
        je _start.exit_program

        ;jmp error  ; Jump to the global error function

    .add:
        mov r9, rcx
        add r9, rdx
        mov rsi, plus_str
        mov rdx, plus_str_len
        call display_operation
        jmp .done_result

    .subtract:
        mov r9, rcx
        sub r9, rdx
        mov rsi, sub_str
        mov rdx, sub_str_len
        call display_operation
        jmp .done_result
    .multiply:
        mov r9, rcx
        imul r9, rdx
        mov rsi, mul_str
        mov rdx, mul_str_len
        call display_operation
        jmp .done_result
    .divide:
        test rdx, rdx
        jz error_div_zero
        xor rdx, rdx  ; Clear rdx
        mov rax, rcx  ; Load rcx into rax
        idiv r9       ; Signed division
        mov r9, rax   ; Save quotient to r9
        mov rsi, div_str
        mov rdx, div_str_len
        call display_operation
        jmp .done_result
    .done_result:
        ; Convert and display the result
        mov rdi, output_buffer
        mov rsi, r9
        call int_to_string
        mov rsi, output_buffer
        mov rdx, rax
        call display_message

        ret

        
    ; Function to handle I/O error
    error:
        mov rsi, err_msg
        mov rdx, err_msg_len
        call display_message
        jmp _start.exit_program

    ; Function to handle divide by 0 error
    error_div_zero:
        mov rsi, err_div_zero_msg
        mov rdx, err_div_zero_msg_len
        call display_message
        jmp _start.exit_program
    
    ; Function to display a message
    display_message:
        mov rax, 1  ; rax set to write
        mov rdi, 1  ; rdi set to stdout
        syscall
        ret

    ; Converts ASCII string to integer
    ; rdi: pointer to the string
    ; returns rax: integer
    string_to_int:
        xor rax, rax
        xor rcx, rcx  ; use rcx to keep track of the position
    .loop:
        mov al, byte [rdi + rcx]
        test al, al
        jz .end
        sub al, '0'
        imul rax, rax, 10
        movzx r8, al  ; zero-extend al into r8 (a 64-bit register)
        add rax, r8   ; add r8 to rax
        inc rcx
        jmp .loop
    .end:
        ret

    ; Converts integer to ASCII string
    ; rdi: pointer to destination buffer
    ; rsi: integer to convert
    ; returns rax: length of the string
    int_to_string:
        push rbx
        push rdi
        xor rax, rax
        mov rcx, 100 ; Max buffer size
    .loop:
        xor rdx, rdx
        mov rbx, 10
        div rbx
        add dl, '0'
        dec rcx
        test rcx, rcx
        jz .end ; Break if buffer is full
        dec rdi
        mov [rdi], dl
        inc rax
        test rsi, rsi
        jnz .loop
    .end:
        pop rdi
        pop rbx
        ret

    ; Display operation (e.g., "Result of 5 + 3 = ")
    display_operation:
        ; Display "Result of "
        mov rsi, result_str
        mov rdx, result_str_len
        call display_message

        ; Display first operand
        mov rdi, output_buffer
        mov r11, rcx ; preserve rcx
        call int_to_string
        mov rsi, output_buffer
        mov rdx, rax
        call display_message

        ; Display operator symbol
        call display_message  ; rsi and rdx are already set up

        ; Display second operand
        mov rdi, input_buffer ; using different buffer
        mov rsi, rdx ; preserve rdx
        call int_to_string
        mov r10, rax ; save the length of the string
        mov rsi, input_buffer
        mov rdx, r10
        call display_message

        ; Display " = "
        mov rsi, equal_str
        mov rdx, equal_str_len
        call display_message

        ret

