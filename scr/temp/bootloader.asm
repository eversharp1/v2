[org 0x7c00]
[bits 16]

;forzar modo texto 80x25
mov ah, 00h
mov al, 03h
int 10h

;uestra un mensaje simple
mov si, msg
call print_string
jmp $

print_string:
    lodsb
    or al, al
    jz done
    mov ah, 09h
    mov al, 03h
    mov bh, 00h
    mov bl, 04h
    mov cx, 1
    int 10h
    jmp print_string
done:
    ret

msg db "Bootloader Funciona!", 0

; padding to 510 bytes + boot signature
times 510 - ($ - $$) db 0
dw 0xAA55