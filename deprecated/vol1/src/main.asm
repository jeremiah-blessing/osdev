org 0x7c00
bits 16

%define ENDL 0x0D, 0x0A

start:
	jmp main



puts:
	push si
	push ax
.loop
	lodsb		; Load DS:SI in AL and increment SI automatically (due to cld)  
	or al, al	; Zero - End of Str
	jz .done		; Get out

	mov ah, 0xE
	mov bh, 0
	int 0x10
	jmp .loop
.done:
	pop ax
	pop si
	ret

main:
	; Setup Data Segments
	xor ax, ax	; AX -> 0
	mov ds, ax	; DS -> 0
	mov es, ax 	; ES -> 0
	
	; Setup Stack
	mov ss, ax
	mov sp, 0x7c00

	mov si, msg
	call puts

	jmp .halt
.halt:
	jmp .halt

msg:
	db "Hello, World!", ENDL, 0


times 510-($-$$) db 0
db 0x55, 0xAA
