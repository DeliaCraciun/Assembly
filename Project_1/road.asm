%include "../include/io.mac"

struc point
    .x: resw 1
    .y: resw 1
endstruc

section .text
    global road
    extern printf

road:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]      ; points
    mov ecx, [ebp + 12]     ; len
    mov ebx, [ebp + 16]     ; distances
    ;; DO NOT MODIFY
   
    ;; Your code starts here

    ;edx contor for

    mov edx,0
    sub ecx,1   ;ca sa am len-1

FOR:   
        cmp edx,ecx
        jl BUCLA
        jge FINISH

BUCLA:  
        ;;points_distance

        add edx,1
        movzx ecx,word[eax + edx*4]
        sub edx,1
        sub cx,word[eax + edx*4]
        

IF:     cmp ecx,0
        jne X_not_ZERO

Y_not_ZERO:

        add edx,1
        movzx ecx,word[eax + edx*4 + 2]
        sub edx,1
        sub cx,word[eax + edx*4 + 2]  
        cmp cx,0
        jl Y_NEG
        jge GATA
        

Y_NEG:
       movzx ecx,word[eax + edx*4 + 2] 
       add edx,1
       sub cx,word[eax + edx*4 + 2]
       sub edx,1 
       jmp GATA
        

X_not_ZERO:
        cmp cx,0
        jl X_NEG
        jmp GATA

X_NEG:
       movzx ecx,word[eax + edx*4] 
       add edx,1
       sub cx,word[eax + edx*4]
       sub edx,1 

 
GATA:   
        mov dword[ebx + 4*edx],ecx
        ;PRINTF32 `%d\n\x0`,ecx
        mov ecx,[ebp + 12]
        sub ecx,1
        ;;points_distance
        add edx,1
        jmp FOR

FINISH:





    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY