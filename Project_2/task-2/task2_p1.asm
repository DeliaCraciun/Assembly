

section .text
	global cmmmc


section .data
	format: dw "number is %d", 10, 0
	cuvant: dw "aoleu %d", 10,0



;; int cmmmc(int a, int b)
;
;; calculate least common multiple fow 2 numbers, a and b
cmmmc:

	push ebp
	push esp
	pop ebp				;;punem varful stivei in esp

	;;push ebx
	;;push esi 
	;;push edi

	push dword[ebp + 12]	;;pun pe stiva al doilea nr
	push dword[ebp + 8]		;;pun pe stiva primul numar
	
	pop eax		;;primul numar
	pop ebx		;;al doilea numar

	push ebx		
	push eax

	pop ecx		;;primul nr_copie
	pop edx		;; al doilea nr_copie



WHILE_COND:	

	cmp eax,ebx			;;daca inca n-am ajuns la un numar comun
	jne BUCLA			;;continui cautarea cmmmc
	jmp GATA

BUCLA:

IF1:

	cmp eax,ebx			;;daca n < m	<=> eax < ebx
	jl ADD_EAX
	jmp ADD_EBX

ADD_EAX:

	add eax,ecx			;;adun la a primul nr initial <=> n=n+a
	jmp WHILE_COND		

ADD_EBX:

	add ebx,edx			;;adun la b al doilea nr initial <=> m=m+b
	jmp WHILE_COND

GATA:


	;;pop edi
	;;pop esi
	;;pop ebx

	push ebp
	pop esp
	pop ebp
	ret
