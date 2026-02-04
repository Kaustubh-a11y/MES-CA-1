ORG 0000H

; Example values (change for testing)
MOV 50H, #13H
MOV 51H, #02H

MOV R0, 50H     ; R0 = A
MOV R1, 51H     ; R1 = B

; ---------- Initial Zero Checks ----------
MOV A, R0
JNZ CHECK_B
MOV A, R1
JNZ A_LESS
MOV 52H, #00H   ; A=0, B=0 ? Equal
SJMP END_PROG

CHECK_B:
MOV A, R1
JNZ LOOP
MOV 52H, #01H   ; B=0, A?0 ? A>B
SJMP END_PROG

A_LESS:
MOV 52H, #0FFH  ; A=0, B?0 ? A<B
SJMP END_PROG

; ---------- Main Compare Loop ----------
LOOP:
DEC R0
DEC R1

MOV A, R0
JZ R0_ZERO

MOV A, R1
JZ R1_ZERO

SJMP LOOP

; ---------- Decision Blocks ----------
R0_ZERO:
MOV A, R1
JZ EQUAL_CASE
MOV 52H, #0FFH   ; A < B
SJMP END_PROG

R1_ZERO:
MOV 52H, #01H    ; A > B
SJMP END_PROG

EQUAL_CASE:
MOV 52H, #00H    ; A = B

END_PROG:
SJMP END_PROG

END
