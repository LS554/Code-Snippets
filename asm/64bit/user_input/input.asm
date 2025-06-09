global _start

section .data
  welcome_message: db "Please enter a message: ", 10 ; define welcome message
  wmLen: equ $-welcome_message ; length of welcome
  goodbye_message: db "You entered: ", 10 ; define goodbye message
  gmLen: equ $-goodbye_message ; length of welcome

section .bss
  buffer resb 256

section .text
  _start:
  ;start welcome 
  mov rax, 1 ; syswrite
  mov rdi, 1 ; stdout
  mov rsi, welcome_message; write message 
  mov rdx, wmLen ; length of message
  syscall
  ;end welcome 

  ;start read
  mov rax, 0 ; sysread
  mov rdi, 0 ; stdin
  mov rsi, buffer ; save to buffer
  mov rdx, 256
  syscall
  ;end read 

  ;start goodbye 
  mov rax, 1
  mov rdi, 1
  mov rsi, goodbye_message
  mov rdx, gmLen
  syscall
  ;end read

  ;start print input
  mov rax, 1 ; rax must be reinitialized after every syscall
  mov rsi, buffer
  mov rdx, 256
  syscall
  ;end print input 

  ;start exit
  mov rax, 60 ; sysexit
  mov rdi, 0 ; exit code 0
  syscall
  ;end exit








