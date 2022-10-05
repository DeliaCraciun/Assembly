%include "../include/io.mac"

section .data
    i dd 0
    j dd 0
    N dd 0
    N_div_2 dd 0
    ls dd 0     ;limita pt latura  sus
    ldr dd 0    ;limita pt latura dreapta
    lj dd 0     ;limita pt latura jos
    lstg dd 0   ;limita pt latura stanga
    cont_plain dd 0     ;;contor plain


section .text
    global spiral
    extern printf

; void spiral(int N, char *plain, int key[N][N], char *enc_string);
spiral:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]  ; N (size of key line)
    mov ebx, [ebp + 12] ; plain (address of first element in string)
    mov ecx, [ebp + 16] ; key (address of first element in matrix)
    mov edx, [ebp + 20] ; enc_string (address of first element in string)
    ;; DO NOT MODIFY
    ;; TODO: Implement spiral encryption
    ;; FREESTYLE STARTS HERE

    mov dword[cont_plain],0

    mov dword[N],eax

    mov esi,0
    shr eax,1               ;N/2
    mov dword[N_div_2],eax
    mov esi,eax
    mov dword[ebp - 4],esi
    mov eax,[ebp + 8]


;;pornesc de la i=1 pana la N/2
    mov dword[i],1
    mov dword[j],0

CADRAN_LOOP:

    mov esi,dword[ebp - 4]
       
    cmp dword[i],esi
    jle LATURA_SUS
    jmp END

LATURA_SUS:
    
    ;;Initializare variabile

    mov dword[ls],eax
    mov edi,dword[i]
    sub edi,1
    mov dword[i],edi
    sub dword[ls],edi
    sub dword[ls],1     ;; n - i -1

    mov edi,dword[j]    ;;edi = j
    inc dword[j]

    mov eax,0
    mov eax, dword[i]
    mul dword[N]       ;;EDX=i*N 
    add eax,edi         ;;EDX = i*N + j
    
    mov ecx,[ebp + 16]
    mov edx,dword[ecx + 4*eax]      ;;edx = val.matrice

    mov eax,0
    mov eax,dword[cont_plain]       ;;eax->contor plain

    mov ebx,[ebp + 12]
    add dl,byte[ebx + eax]         ;;elem. matrice + elem. plain

    mov ecx,edx
    mov edx,[ebp + 20]              ;;edx devine enc_string

    mov byte[edx + eax],cl          ;;bag valoarea in enc_string

    add dword[cont_plain],1         ;;cresc contor plain
 

    mov eax,[ebp + 8]
    mov ebx,[ebp + 12]
    mov ecx,[ebp + 16]
    mov edx,[ebp + 20]

    add dword[i],1
    mov edi,dword[j]

    cmp edi,dword[ls]   ;; j < n - i -1
    jl LATURA_SUS
    jmp LATURA_DREAPTA



LATURA_DREAPTA:

    mov eax,0
    mov eax,dword[j]
    mov dword[ldr],eax      ;;limita dreapta = j

    sub dword[i],1
    mov edi,dword[i]        ;;EDI = i

    mov eax,0
    mov eax, edi
    mul dword[N]       ;;EAX = i*N

    add eax,dword[j]    ;;EDX = i*N + j 

    mov edx,dword[ecx + 4*eax]

    mov eax,0
    mov eax,dword[cont_plain]       ;;eax->contor plain

    mov ebx,[ebp + 12]
    add dl,byte[ebx + eax]         ;;elem. matrice + elem. plain

    mov ecx,edx
    mov edx,[ebp + 20]              ;;edx devine enc_string

    mov byte[edx + eax],cl          ;;bag valoarea in enc_string

    add dword[cont_plain],1         ;;cresc contor plain

    mov eax,[ebp + 8]
    mov ebx,[ebp + 12]
    mov ecx,[ebp + 16]
    mov edx,[ebp + 20]

    add dword[i],1
    add dword[i],1
    add edi,1

    cmp edi,dword[ldr]
    jl LATURA_DREAPTA
    jmp LATURA_JOS

LATURA_JOS:

    sub dword[i],1

    mov eax,0
    mov eax,dword[N]
    sub eax,1
    sub eax,dword[i]        
    mov dword[lj],eax       ;;n - 1 - i

    mov eax,0
    mov edx,0
    mov eax,dword[i]
    mul dword[N]
  
    add eax,dword[j]        ;;i*N+j

    mov edx,dword[ecx + 4*eax]

    mov eax,0
    mov eax,dword[cont_plain]       ;;eax->contor plain

    mov ebx,[ebp + 12]
    add dl,byte[ebx + eax]         ;;elem. matrice + elem. plain

    mov ecx,edx
    mov edx,[ebp + 20]              ;;edx devine enc_string

    mov byte[edx + eax],cl          ;;bag valoarea in enc_string

    add dword[cont_plain],1         ;;cresc contor plain

    mov eax,[ebp + 8]
    mov ebx,[ebp + 12]
    mov ecx,[ebp + 16]
    mov edx,[ebp + 20]

    add dword[i],1
    sub dword[j],1
    mov edi,dword[j]

    cmp edi,dword[lj]
    jg LATURA_JOS
    jmp LATURA_STANGA

    

LATURA_STANGA:

    sub dword[i],1

    mov edi, dword[i]       ;;i

    mov eax,dword[j]
    mov dword[lstg],eax     ;;j

    mov eax,0
    mov edx,0
    mov eax,dword[i]
    mul dword[N]            ;;i*N
    add eax,dword[j]        ;; i *N + j  

    mov edx,dword[ecx + 4*eax]

    mov eax,0
    mov eax,dword[cont_plain]       ;;eax->contor plain

    mov ebx,[ebp + 12]
    add dl,byte[ebx + eax]         ;;elem. matrice + elem. plain

    mov ecx,edx
    mov edx,[ebp + 20]              ;;edx devine enc_string

    mov byte[edx + eax],cl          ;;bag valoarea in enc_string

    add dword[cont_plain],1         ;;cresc contor plain

    mov eax,[ebp + 8]
    mov ebx,[ebp + 12]
    mov ecx,[ebp + 16]
    mov edx,[ebp + 20]

    sub edi,1

   cmp edi,dword[lstg]
   jg LATURA_STANGA
   jmp LOOP

LOOP:

    add dword[i],1
    inc dword[j]
    jmp CADRAN_LOOP

END:

    mov eax,dword[N]
    shr eax,1
    shl eax,1

    cmp eax,dword[N]
    je N_PAR
    jne N_IMPAR

N_PAR:

    jmp FINAL

N_IMPAR:

    mov eax,dword[N]
    mul dword[N]        ;;eax = N*N

    sub eax,1   

    mov dword[cont_plain],eax

    mov edx,0
    mov dl,byte[ebx + eax]          ;;plain
    
    shr eax,1

    add edx,dword[ecx + 4* eax]

    mov ecx,edx
    mov edx,[ebp + 20]
    mov eax,dword[cont_plain]
    mov byte[edx + eax],cl

    mov eax, [ebp + 8]  ; N (size of key line)
    mov ebx, [ebp + 12] ; plain (address of first element in string)
    mov ecx, [ebp + 16] ; key (address of first element in matrix)
    mov edx, [ebp + 20] ; enc_string
FINAL:   
    
    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
