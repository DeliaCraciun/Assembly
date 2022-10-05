%include "../include/io.mac"



section .text
    global simple
    extern printf

simple:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     ecx, [ebp + 8]  ; len
    mov     esi, [ebp + 12] ; plain
    mov     edi, [ebp + 16] ; enc_string
    mov     edx, [ebp + 20] ; step

    ;; DO NOT MODIFY
   
    ;; Your code starts here

    mov DWORD[ebp - 4],0

;PRINTF32 `%c\n\x0`,byte[esi]
FOR:    cmp  DWORD[ebp - 4],ecx
        jl BUCLA

BUCLA:      mov ecx, DWORD[ebp - 4]         ;fac ecx contor
            mov eax,0
            add al,byte[esi + ecx]          ;pun in eax un caracter din enc_string
            mov ecx, [ebp + 8]              ;fac ecx inapoi lungimea sirului
            add eax,edx                     ;adaug step-ul la eax

IF:         cmp eax,90
            jg TRUE
            jmp FALSE

TRUE:       
            mov ecx,DWORD[ebp - 4]
            movzx eax, byte[esi + ecx]
            add eax,65
            add eax,edx
            sub eax,91
            mov byte[esi + ecx],al
            ;PRINTF32 `%c\n\x0`,byte[esi+ecx]
            
            
            
            mov ecx,[ebp+8]
            jmp FINISH

FALSE:      
            mov ecx,DWORD[ebp - 4]
            add byte[esi + ecx],dl
            mov ecx,[ebp+8]
 
FINISH:     mov ecx,DWORD[ebp - 4]
            ;PRINTF32 `%c\n\x0`,byte[esi + ecx]
            movzx eax,byte[esi + ecx]
            mov byte[edi + ecx],al
            mov ecx,[ebp+8]
            add DWORD[ebp - 4],1            ;cresc contorul
            cmp  DWORD[ebp - 4],ecx
            jl FOR





;PRINTF32 `%u\n\x0`, DWORD[ebp - 4]
    ;; Your code ends here
    
    ;; DO NOT MODIFY

    popa
    leave
    ret
    
    ;; DO NOT MODIFY
