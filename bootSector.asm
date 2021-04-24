loop:
	jmp loop

times 51 - ($ - $$) db 0
dw 0xaa55
