CLAC	LDA	ZERO
	STA	INDEX
	STA	VALUE
LOOP	LDX	INDEX
	LDA	VALUE
	ADD	ONE
	STA	VALUE
	LDA	VALUE
	STA	ALPHA,X
	LDA	INDEX
	ADD	THREE
	STA	INDEX
	COMP	TEN
	JLT	LOOP

INDEX	RESW	1
VALUE	RESW	1
ALPHA	RESW	10
ZERO	WORD	0
TEN	WORD	30
ONE	WORD	1
THREE	WORD	3
