org 0x7C00
bits 16

%define ENDL 0x0D, 0x0A

start:
    jmp main

; Print a string to the screen
; SI = pointer to string
puts:
    push si
    push ax

.loop:
    lodsb
    or al, al
    jz .done
    mov ah, 0x0E
    mov bh, 0x00
    int 0x10
    jmp .loop

.done:
    pop ax
    pop si
    ret

main:
    mov ax, 0
    mov ds, ax
    mov es, ax

    mov ss, ax
    mov sp, 0x7C00

    mov si, msg
    call puts

    hlt

.hlt:
    jmp .hlt

msg:
    db "Hello, World!", ENDL, 0


times 510-($-$$) db 0
db 0x55, 0xAA
