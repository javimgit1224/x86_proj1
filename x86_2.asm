extern printf	;write to standard output device
extern scanf	;read from standard input device
extern malloc
extern free
extern realloc
extern showquads

global array	;makes the functions callable from outside of this file 

segment .data	;initialize data

;create messages
initial db "welcome to the array program. this program will save your 64-bit data in an array",10,0
prompt db "please enter the floating point number and press enter after each number. the limit is 10 numbers",10,0
thanks db "thank you for your inputs. your array is as follows: ",10,0
swapping db "the software is now swapping the largest and smallest numbers in the array. finished",10 "your array is now the following. ",10,0
goodbye db "this assembly function will now return to the caller function.",10,0



