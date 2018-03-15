extern printf	;write to standard output
extern scanf	;read from standard input
global radius	;make radius callable from oustide this file
segment .data	;place initialize data here

;declare messages
radius.initialmessage db "welcome to the circle program. this program will compute the area and circumference of a circle.",10,0
radius.promptmessage db "please enter the radius of the circle: ",0
radius.outputmessage db "the circle with radius %1.18lf times %1.18lf has area %1.18lf and circumference %1.18lf.",10,0
goodbye db "the main assembly program will now return the area to the driver. enjoy your spheres.",10,0

stringformat db "%s",0	;string format
eightbyteformat db "%lf",0	;8 byte float format
segment .bss	;declare pointers to not initialied space in this segment
align 64	;make sure that next data starts on 64 byte boundary

;begin application
segment .text	;place executable instruction
radius:	;execution begins here
push rbp
mov rbp, rsp

;show initial message
mov qword rax,0
mov rdi, stringformat
mov rsi, .initialmessage
call printf

;prompt for radius 
mov qword rax,0
mov rdi, stringformat
mov rsi, .promptmessage
call printf

;obtain the radius
push qword 0
mov qword rax, 0
mov rdi, eightbyteformat
mov rsi, rsp
call scanf
movsd xmm0, [rsp]
pop rax

;compute the area
movsd xmm2, xmm0
mov rbx, 0x40091EB851EB851F
push rbx
mulsd xmm2, xmm2
mulsd xmm2, [rsp]
movsd xmm1, [rsp]
pop rax

;compute the circumference 
movsd xmm3, xmm0
mov rbx, 0x40191EB851EB851F
push rbx
mulsd xmm3, [rsp]
pop rax

;save a copy of qoutient before calling printf
push qword 0
movsd [rsp], xmm2

;show outcome

push qword -1
mov rax, 4
mov rdi, .outputmessage
call printf
pop rax

;goodbye message
mov qword rax, 0
mov rdi, stringformat
mov rsi, goodbye
call printf

;
movsd xmm0, [rsp]
pop rax

;restore pointer to the top of the stack
pop rbp
ret

