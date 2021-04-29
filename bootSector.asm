[org 0x7c00]

; memory organization
; basic TTY
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

;STACK implementation
call nl

mov bp, 0x9000
mov sp, bp

push 'A'
push 'B'
push 'C'

pop bx
mov al, bl ; print C
int 0x10
call spa
pop bx
mov al, bl ; print B
int 0x10
call spa
pop bx
mov al, bl ; print A
int 0x10
call nl
;Note: A full word is popped during pop operation
;but the stack pointer moves by a BYTE

	mov bx, 0
	mov cx, 11 ;length of string
loop1:	mov al, [myname + bx]
	; Note: Only register bx can be used for indexing
	int 0x10
	inc bx
	cmp cx, bx
	jnz loop1

;	mov bx, OFFSET myname
;loop1:	mov al, BYTE PTR [bx]
;	inc bx
;	cmp al, 0
;	jnz loop1


loop:
    jmp loop 

secret:
	db 'M'

myname:
	db "Ayush Basak", 0

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
