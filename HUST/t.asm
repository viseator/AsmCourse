public _test_fun
public _var_from_asm
extrn _global:byte, _global_init:byte

_DATA	segment use16 word public 'DATA'
    _var_from_asm label word
        db 10
        db 0
_DATA ends

_TEXT segment use16 byte public 'CODE'
    assume CS:_TEXT, DS:_DATA

_test_fun proc near
    push bp
    mov bp, sp
    push di
    mov ax, 6[bp]
    mov word ptr _global_init, ax
    mov word ptr _global, 100
    pop di
    pop bp
    ret
_test_fun endp
_TEXT ends
end