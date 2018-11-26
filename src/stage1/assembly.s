	.text
	.globl moveb
	.type moveb, @function
moveb:
	MOVB	(%esi), %al
	MOVB	%al, (%edi)
	RET
	.globl movew
	.type movew, @function
movew:
	MOVW	(%esi), %ax
	MOVW	%ax, (%edi)
	RET
	.globl movel
	.type movel, @function
movel:
	MOVL	(%esi), %eax
	MOVL	%eax, (%edi)
	RET
	.globl zerofillbw
	.type zerofillbw, @function
zerofillbw:
	MOVZBW	(%esi), %ax
	RET
	.globl zerofillwl
	.type zerofillwl, @function
zerofillwl:
	MOVZWL	(%esi), %eax
	RET
	.globl signfillbw
	.type signfillbw, @function
signfillbw:
	MOVSBW	(%esi), %ax
	RET
	.globl signfillwl
	.type signfillwl, @function
signfillwl:
	MOVSWL	(%esi), %eax
	RET
