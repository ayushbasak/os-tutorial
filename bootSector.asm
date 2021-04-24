mov ah, 0x0e ; enter TTY mode
mov al, 'A'
int 0x10
mov al, 'Y'
int 0x10
mov al, 'U'
int 0x10
mov al, 'S'
int 0x10
mov al, 'H'
int 0x10

loop:
    jmp loop 

times 510-($-$$) db 0
dw 0xaa55 
