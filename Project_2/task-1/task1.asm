

section .text
	global sort


section .data
	i dd 0

; struct node {
;     	int val;
;    	struct node* next;
; };

;; struct node* sort(int n, struct node* node);
; 	The function will link the nodes in the array
;	in ascending order and will return the address
;	of the new found head of the list
; @params:
;	n -> the number of nodes in the array
;	node -> a pointer to the beginning in the array
; @returns:
;	the address of the head of the sorted list


sort:
 ;;   push ebp
 ;;   mov ebp, esp

	enter 0, 0

	push ebx
	push esi 
	push edi

    mov ebx, [ebp + 8]      ; nr
    mov esi, [ebp + 12]     ; vector

	mov dword[i],0

	mov ecx,ebx		;;pornesc de la nr

FOR:

	cmp dword[i],ebx		;;caut prin tot sirul numarul cel mai mare n
	jl BUCLA
	jmp WHILE

BUCLA:

	mov edx,dword[i]
	add dword[i],1			;;incrementez contorul

	cmp ebx,dword[esi + 8*edx]		;;verific daca am gasit elementul cautat
	je FOUND_N
	jmp FOR

FOUND_N:

	lea eax,[esi + 8*edx]	;;am salvat adresa lui n

	mov dword[i],0			;;resetez contorul
	dec ecx					;;apoi sortarea o voi porni de la n-1

WHILE:

	cmp ecx,1		;;cat timp n-am ajuns la cel mai mic numar
	jge LOOP
	jmp FINISH

LOOP:

	mov edx,dword[i]		;;verific daca am gasit numarul cautat 
	cmp ecx,dword[esi + 8*edx]
	je FOUND 
	jmp INCREMENT

FOUND:


	lea edi,[esi + 8*edx]		;;adresa de la nodul CURENT o salvez
	mov [edi + 4],eax			;;nod.next pun adresa celui precedent
	lea eax,[esi + 8*edx]		;;adresa precedentul devine adresa curentului

	mov dword[i],0				;;resetez contorul pentru o noua cautare
	dec ecx						;;trec la urmatorul numar (n-1,n-2.n-3,..,1)
	jmp WHILE


INCREMENT:

	add edx,1
	mov dword[i],edx

	jmp LOOP

FINISH:

	pop edi
	pop esi
	pop ebx

	leave
	ret
