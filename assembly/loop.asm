	LDX #0
MOVECH	LDCH	STR1, X
	STCH	STR2, X
OUTCHECK	TD	STDOUT
		JEQ	OUTCHECK
		WD	STDOUT
	TIX	#11
	JLT	MOVECH
	JEQ	STOP
STOP	J	STOP

STR1	BYTE	C'HELLO WORLD'
STR2	RESB	11
STDOUT	BYTE	1