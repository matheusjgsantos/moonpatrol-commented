The system boots at the addres $0, where $73FF is loaded to SP:
```AS
LD SP,$73FF
```
Then jumps to $70:
```AS
JR $0070 
```

The routine at address &70 will check for the hex AA 55 at the adddress $8000, otherwise will jump to address $81 where there is a [RST](http://z80-heaven.wikidot.com/instructions-set:rst) command:

```
0070	2A0080        	LD HL,($8000)     ; Load content from $8000 in HL            
0073	7D            	LD A,L            ; Load L into A
0074	FE55          	CP $55            ; Is A equal to 55?
0076	2009          	JR NZ,$0081       ; If not, jump to $81            
0078	7C            	LD A,H            ; Load H into A            
0079	FEAA          	CP $AA            ; Is A equal to AA?            
007B	2004          	JR NZ,$0081       ; If not, jump to $81
007D	2A0A80        	LD HL,($800A)     ; Load the value in $800A 
                                          ;  into HL (42 80)
0080	E9            	JP (HL)           ; Jump to $8042
0081	C7            	RST 00H           ; Restart command
```