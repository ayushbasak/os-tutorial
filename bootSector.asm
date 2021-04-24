[org 0x7c00]
mov ah, 0x0e ; enter TTY mode
mov al, [secret]
int 0x10
call nl
mov al, 'A'
int 0x10
call spa
mov al, 'Y'
int 0x10
call spa
mov al, 'U'
int 0x10
call spa
mov al, 'S'
int 0x10
call spa
mov al, 'H'
int 0x10
call nl

	mov cx, 26
	mov bl, 'A'
loop0:	mov al, bl
	int 0x10
	add bl, 1
	call spa
	sub cx, 1
	jnz loop0


loop1:
    jmp loop1 

secret:
	db 'M'

;subroutines
nl:
	mov al, 0x0a
	int 0x10
	mov al, 0x0d
	int 0x10
	ret

spa:
	mov al, 0x20
	int 0x10
	ret

times 510-($-$$) db 0
dw 0xaa55 
