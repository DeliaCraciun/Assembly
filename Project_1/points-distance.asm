%include "../include/io.mac"

struc point
    .x: resw 1
    .y: resw 1
endstruc

section .text
    global points_distance
    extern printf

points_distance:
    ;; DO NOT MODIFY
    
    push ebp
    mov ebp, esp
    pusha

    mov ebx, [ebp + 8]      ; points
    mov eax, [ebp + 12]     ; distance
    ;; DO NOT MODIFY
   
    ;; Your code starts here
 
  
    ;ecx pt x
    ;edx pt y

    movzx ecx,word[ebx + 4 + 0]
    sub cx, word[ebx + 0 + 0]       ;x1 -x0
      
    movzx edx,word[ebx + 4 + 2]
    sub dx,word[ebx + 0 + 2]        ;y1-y0  

    mov ebx,0

IF:     
    cmp ecx,ebx
    jne Y_ZERO

X_ZERO:  
    mov dword[eax],edx ;pun dif de y
    jmp FINISH

Y_ZERO:

    mov dword[eax],ecx ;pun dif de x
   
FINISH:

    
    
     
  

   ; PRINTF32 `%hd\n\x0`,word[eax]


    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret

    ;; DO NOT MODIFY