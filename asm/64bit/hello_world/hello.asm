global _start

section .data
  message: db "Hello, World!", 10 ; string to print - 10 is ASCII newline
  messageLen: equ $-message ; length of message

section .text

_start:
  ;start programme
  mov rax, 1 ; syscall to write
  mov rdi, 1 ;  stdout
  mov rsi, message ; message being written
  mov rdx, messageLen ; length of message
  syscall
  ;end programme
  
  ;start exit
  mov rax, 60 ; syscall to exit
  mov rdi, 0 ; exit code 0
  syscall
  ;end exit
