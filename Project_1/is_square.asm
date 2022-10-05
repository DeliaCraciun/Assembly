%include "../include/io.mac"

section .text
    global is_square
    extern printf

is_square:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov ebx, [ebp + 8]      ; dist
    mov eax, [ebp + 12]     ; nr
    mov ecx, [ebp + 16]     ; sq
    ;; DO NOT MODIFY
   
    ;; Your code starts here

    ;;contor dword[ebp - 8] si dword[ebp - 4]

    mov dword[ebp - 4],0

FOR1:   
    cmp dword[ebp - 4],eax
    jl BUCLA
    jmp FINISH

BUCLA:
    mov eax,dword[ebp - 4]
    mov ecx,dword[ebx + 4*eax]      ;;ecx are valoarea din vector
    mov edx,1               ;;CONTORUL PENTRU AL 2-LEA FOR
    mov dword[ebp - 8],0    ;;aici imi tin sqrt
    mov dword[ebp - 12],ecx ;;aici imi tin valoarea de la poz i din vector

FOR2:

    sub ecx,edx
    add edx,2           ;;cresc pe impare CONTORUL
    add dword[ebp - 8],1
    cmp ecx,0
    jl FINISH_FOR2
    jg FOR2
  
FINISH_FOR2:
   
    mov ecx,[ebp + 16]      ;;pun inapoi ce era in ecx

    xor eax,eax
    mov eax,dword[ebp - 8]
    mul eax

IF: 

    cmp eax,dword[ebp - 12]
    je E_PATRAT_PERFECT
    jne NU_E_PATRAT_PERFECT

E_PATRAT_PERFECT:

    mov eax,dword[ebp - 4]
    mov dword[ecx +4*eax],1
    jmp GATA

NU_E_PATRAT_PERFECT:  

;;testam cazul in care ecx este 0

    cmp dword[ebp - 12],0
    je E_PATRAT_PERFECT
    mov eax,dword[ebp - 4]
    mov dword[ecx +4*eax],0 

GATA:
     
    mov eax,[ebp + 12]      ;;pun inapoi ce era in eax
    add dword[ebp - 4],1
    jmp FOR1

FINISH:


    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY