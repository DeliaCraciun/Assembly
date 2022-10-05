%include "../include/io.mac"

section .text
    global beaufort
    extern printf

; void beaufort(int len_plain, char *plain, int len_key, char *key, char tabula_recta[26][26], char *enc) ;
beaufort:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]  ; len_plain
    mov ebx, [ebp + 12] ; plain (address of first element in string)
    mov ecx, [ebp + 16] ; len_key
    mov edx, [ebp + 20] ; key (address of first element in matrix)
    mov edi, [ebp + 24] ; tabula_recta
    mov esi, [ebp + 28] ; enc
    ;; DO NOT MODIFY
    ;; TODO: Implement spiral encryption
    ;; FREESTYLE STARTS HERE

    ;;ne completam sirul key
    mov dword[ebp - 4],0 
   
FOR: 
    cmp ecx,dword[ebp + 8]
    jl BUCLA
    jmp END_FOR

BUCLA:
    mov eax,dword[ebp - 4]
    ;PRINTF32 `%d\n\x0`,eax
    movzx eax,byte[edx + eax]
    mov byte[edx + ecx],al
     ;PRINTF32 `%d\n\x0`,eax
    mov eax,[ebp - 4]
   
IF1:
    add eax,1    
    cmp eax,[ebp + 16]
    je RESET
    jmp ADD_CONTOR
RESET:
    mov eax,0
    mov dword[ebp - 4],0
    add ecx,1
    jmp FOR
ADD_CONTOR:
    add dword[ebp - 4],1
    ;add eax,1
    add ecx,1
    jmp FOR

END_FOR:

    ;;ne-am completat sirul key

;mov eax,0
;for:
    ;add eax,1
;    cmp eax,[ebp + 8]
;    jl printare
;    jmp gata
;printare:

    ; PRINTF32 `%c\n\x0`,byte[edx + eax]
;     add eax,1
;     jmp for
;gata:

mov eax,0
mov ebx,[ebp + 12]      ;;plain
mov edx,[ebp + 20]      ;;key
FOR2:   
    cmp eax,[ebp + 8]
    jl BUCLA2
    jmp END_PRGRM

BUCLA2:
    movzx ecx,byte[ebx + eax]
    cmp cl,byte[edx + eax]
    jle FORMULA1
    jg FORMULA2

FORMULA1:
    ;;imi pun key[i]
    movzx ecx,byte[edx + eax]
    add ecx,65
    ;;scad plain[i]
    sub cl,byte[ebx + eax]
    mov byte[esi + eax],cl

    add eax,1
    jmp FOR2
FORMULA2:
    ;;imi pun key[i]
    movzx ecx,byte[edx + eax]
    add ecx,91
    ;;scad plain[i]
    sub cl,byte[ebx + eax]
    mov byte[esi + eax],cl
    
    add eax,1
    jmp FOR2


END_PRGRM:


    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
