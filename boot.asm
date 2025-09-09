; Date: 09.09.2025
; Author: FauZaPespi
; boot.asm - ça tourne avant que le système démarre vraiment
; Pour assembler : nasm -f bin boot.asm -o boot.bin
; Pour tester : qemu-system-x86_64 boot.bin

bits 16
org 0x7C00        ; Le BIOS balance le boot sector ici, c’est son spot par défaut

start:
    mov si, msg1
    call print_string

    mov si, msg2
    call print_string

    ; Là normalement on démarre le vrai bootloader (genre GRUB ou Windows)
    ; Mais là j’ai la flemme, donc on fait juste boucler pour rester bloqué
    jmp $

print_string:
    lodsb              ; On choppe le prochain caractère du message (SI → AL)
    or al, al          ; Si c’est le caractère nul (fin de string), on arrête
    jz .done
    mov ah, 0x0E       ; On dit au BIOS qu’on veut afficher un caractère
    int 0x10           ; Il affiche le caractère qui est dans AL
    jmp print_string
.done:
    ret

msg1 db "Hi !", 0
msg2 db "FauZa make this project", 0

; Obligé de faire pile 512 octets pour que ce soit un vrai secteur de boot
; Et faut finir avec la signature magique 0xAA55 sinon le BIOS va râler
times 510-($-$$) db 0
dw 0xAA55
