[org 0x7c00]
    mov bp, 0x8000 
    mov sp, bp

    mov bx, 0x9000 
    mov dh, 2
    
    call disk_load

    mov dx, [0x9000] 
    call print_hex

    call print_nl

    mov dx, [0x9000 + 512] 
    call print_hex

    jmp $

%include "print_basic.asm"
%include "print_hex.asm"
%include "diskread.asm"


times 510 - ($-$$) db 0
dw 0xaa55

times 256 dw 0xdead
times 256 dw 0xbeef 