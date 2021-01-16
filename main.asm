.model small
.data   ; variables
    prompt1 db "Enter 1st number: $"
    prompt2 db "Enter 2nd number: $"   
    num1 db ?
    num2 db ?
    sum db ?
    result db ? 13, 10, 'Sum is ', '$'
    
.code
main proc     
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    mov dx, offset prompt1
    int 21h
    
    mov ah, 1       ; input 1st number
    int 21h
    mov bl, al
    mov num1, al
    
    mov dl, 10      ; print newline
    mov ah, 2h
    int 21h
    mov dl, 13
    mov ah, 2h
    int 21h
    
    mov ah, 9
    mov dx, offset prompt2
    int 21h
    
    mov ah, 1       ; input 2nd number
    int 21h
    mov bl, al
    mov num2, al
    
    mov al, num1    ; move num1 to al
    add al, num2    ; add num2 to al
    mov sum, al
    sub sum, 48     ; subtract 48 to get decimal
    
    mov ah, 9   ; print the sum
        lea dx, result
    int 21h
    
    mov ah, 2
    mov dl, sum
    int 21h
    
    mov ah, 4ch     ; end program
    int 21h
             
endp

end main