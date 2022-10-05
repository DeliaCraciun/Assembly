
section .text
	global par


;; int par(int str_length, char* str)
;
; check for balanced brackets in an expression
par:
	push ebp
	push esp
	pop ebp				;;punem varful stivei in ebp

	push ebx
	push esi 
	push edi

	push dword[ebp + 8]
	push dword[ebp + 12]

	pop edi				;;sirul de paranteze str
	pop eax				;; str_lenght

	push 0
	pop ebx				;;contor sir initializare



FOR:	

	cmp ebx,eax			;;merg prin fiecare caracter din sir
	jl BUCLA
	jmp GATA

BUCLA:

	push dword[edi + ebx]
	pop edx				;;aflu paranteza in edx 

	cmp dl,40			;;verific daca e paranteza deschisa
	je PARANTEZA_DESCHISA
	jmp PARANTEZA_INCHISA

PARANTEZA_DESCHISA:
	
	push dword[edi + ebx]		;;pun paranteza deschisa pe stiva

	jmp INCREMENT				;;continui parcurgerea

PARANTEZA_INCHISA:
		
	pop edx						;;scot paranteza deschisa de pe stiva 

	cmp dl,40					;;verific sa nu fi scos adresa de retur
	jne NOT_GOOD
	jmp INCREMENT	

NOT_GOOD:

	push edx					;;daca am scos adresa de retur, o pun inapoi
								;;si termin functia,avand paranteze neechilibrate
	jmp NEECHILIBRAT

INCREMENT:

	add ebx,1
	jmp FOR

GATA:

	pop edx						

	cmp dl,40					;;verific daca mai am paranteze pee stiva
	je NEECHILIBRAT
	jne ECHILIBRAT

NEECHILIBRAT:

	push 0					
	pop eax						;;setez eax pe 0 ptc avem paranteze neechilibrate

VERIFY_STACK:

	pop edx						;;cat timp mai am paranteze pe stiva,eu le voi tot scoate
								;;pana intalnesc altceva
	cmp dl,40
	je POP_STACK
	jmp FINISH_2

POP_STACK:

	pop edx						;;scot paranteza de pe stiva
	jmp VERIFY_STACK			;;verific daca mai exista si alte paranteze ramase
	

ECHILIBRAT:

	push edx
	push 1
	pop eax						;;setez eax pe 1 ptc avem paranteze echilibrate
	jmp FINISH

FINISH_2:

	push edx					;;pun adresa de return inapoi in cazul in care am scos-o

FINISH:

	pop edi
	pop esi
	pop ebx

	push ebp
	pop esp
	pop ebp
	ret
