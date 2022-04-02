

.orig x3000
;this stack lab computes the polish notation of a set of calls
LD R1, pointertostack

;push_val(4) pushes the value 4 onto the stack [4]
ADD R2,R2,#4
LD R3, pushval
jsrr R3

;push_val(3) pushes the value 3 onto the stack [4,3]
ADD R2,R2,#3
LD R3, pushval
jsrr R3


;push_val(2) pushes the value 2 onto the stack [4,3,2]
ADD R2,R2,#2
LD R3, pushval
jsrr R3

;add_val() pop 3,2 and push the result of 3+2 onto the stack [4,5]
LD R3, add_val
jsrr R3

;add_val() pop 4,5 and push the result of 4+5 onto the stack[9]
LD R3, add_val
jsrr R3

;move the top value of the stack into r4
AND R4,R4,x0
ADD R1,R1,#1
LDR R4,R1,#0;grab data from pointer into R2 

HALT 

pointertostack .FILL x4200
pushval .fill x3400
add_val .fill x3800

.end


.orig x3400 ;;push_val(int val)implement your push function that will push a value onto the stack
;R1 contains the pointer to the stack, 
;R2 contains the value to be added 

STR R2,R1,#0
ADD R1,R1,#-1

AND R2,R2,#0 

RET
.end

.orig x3800 ;; add_val() pops two values from the top of the stack and pushes the result of adding the poppped value into the stack

ADD R1,R1,#1;pointer is pointing at empty 

LDR R2,R1,#0;grab data from pointer into R2 
ADD R1,R1,#1;pointer go back one
LDR R3,R1,#0;grab data from pointer into R3
ADD R2,R2,R3;add r2 and r3 and store into r2 
STR R2,R1,#0;write r2 to top of stack 
ADD R1,R1,#-1;stack increment 

AND R2,R2,#0 


RET
.END

.orig x4200 ;;data you might need









.end