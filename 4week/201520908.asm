	LDS	#0
	LDT	#1
CLAC	LDA	#0
	TD	STDIN
	JEQ	CLAC
	RD	STDIN
	COMP	ZERO
	JLT	NOTNUM
	COMPR	S, T
	JEQ	TWODIGIT
	SUB 	ZERO
	STA	ARR, X
	LDT	#3
	LDS	#3
	J	CLAC

TWODIGIT	ADDR	S, X
		SUB	ZERO
		STA	ARR, X
		SUBR	S, X
		LDA	ARR, X
		MUL	#10
		ADDR	S, X
		ADD	ARR, X
		SUBR	S, X
		STA	ARR, X
		LDT	#0
		J	CLAC

NOTNUM	COMP	SPACE
	JEQ	ISSPACE
	COMP	PLUS
	JEQ	PLUSLOU
	COMP	MINUS
	JEQ	MINUSLOU
	COMP	MUL
	JEQ	MULLOU
	COMP	DIV
	JEQ	DIVLOU
	COMP	ENTER
	JEQ	PRINT
	J	CLAC

ISSPACE	LDA	#3
	ADDR	A, X
	LDS	#1
	J	CLAC

PLUSLOU	LDA	#3	
	SUBR	A, X
	LDS	ARR, X
	STS	TMP
	SUBR	A, X
	LDA	ARR, X
	ADD	TMP
	STA	ARR, X
	J	CLAC

MINUSLOU	LDA	#3
		SUBR	A, X
		LDS	ARR, X
		STS	TMP
		SUBR	A, X
		LDA	ARR, X
		SUB	TMP
		STA	ARR, X
		J	CLAC

MULLOU	LDA	#3
	SUBR	A, X
	LDS	ARR, X
	STS	TMP
	SUBR	A, X
	LDA	ARR, X
	MUL	TMP
	STA	ARR, X
	J	CLAC

DIVLOU	LDA	#3
	SUBR	A, X
	LDS	ARR, X
	STS	TMP
	SUBR	A, X
	LDA	ARR, X
	DIV	TMP
	STA	ARR, X
	J	CLAC

PRINT	TD	STDOUT
	JEQ	PRINT
	LDX	#0
	LDA	ARR, X
	ADD	ZERO
	COMP	NINE
	JGT	TWOPRINT
	WD	STDOUT
	J	STOP

TWOPRINT	TD	STDOUT
		JEQ	TWOPRINT
		LDA	ARR, X
		DIV	#10
		STA	VALUE
		ADD	ZERO
		WD	STDOUT
		LDA	VALUE
		MUL	#10
		LDS	ARR, X
		SUBR	A, S
		RMO	S, A
		ADD	ZERO
		WD	STDOUT
		J	STOP

STOP	J	STOP

SPACE	 WORD	0x20
ENTER	WORD	10
ARR	RESW	20
STDIN	BYTE	0
STDOUT	BYTE	1
ZERO	WORD	0x30
PLUS	WORD	0x2B
MINUS	WORD	0x2D
MUL	WORD	0x2A
DIV	WORD	0x2F
NINE	WORD	0x39
VALUE	RESW	1
TMP	RESW	1