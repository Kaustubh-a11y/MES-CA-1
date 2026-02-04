ORG 0000H

MOV A, 24H      ; A = 40H
INC A           ; A = 41H
MOV 30H, A      ; Store direct result

MOV R0, #24H    ; R0 = 24H
MOV A, @R0      ; A = 40H
MOV R0, A       ; R0 = 40H
MOV A, @R0      ; A = 77H
INC A           ; A = 78H
MOV 31H, A      ; Store indirect result

HERE: SJMP HERE
END
