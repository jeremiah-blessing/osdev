[org 0x7c00]
	xor ax, ax	; AX -> 0
	mov ds, ax	; DS -> 0
	cld

	mov si, msg
	call bios_print
	
hang:
	jmp hang

bios_print:
	lodsb		; Load DS:SI in AL and increment SI automatically (due to cld)  
	or al, al	; Zero - End of Str
	jz done		; Get out
	mov ah, 0xE
	mov bh, 0
	int 0x10
	jmp bios_print

done:
	ret

msg:
	db "Hello, World!", 13, 10, 0


times 510-($-$$) db 0
db 0x55, 0xAA
