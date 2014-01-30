TITLE MYPROGRAM
DEDOMENA SEGMENT

msg0 db "Please enter the preferred number of rounds:",10,13,"$"
msg1 db 10,13, "Accepted round range between 02 - 40",10,13,"$"
msg2 db 10,13,"[ q | w | e | r ]",10,13,"$"
msg3 db 10,13,"[ q |   |   |   ]",10,13,"$"
msg4 db 10,13,"[   | w |   |   ]",10,13,"$"
msg5 db 10,13,"[   |   | e |   ]",10,13,"$"
msg6 db 10,13,"[   |   |   | r ]",10,13,"$"
msg7 db 10,13,"Press spacebar to play",10,13,"$"
command db 0
number dw 0
value dw 0
monada db 0
dekada db 0
buffer0 db 0,1,2,3
buffer1 40 dup(0)
buffer2 40 dup(0)
winner db 10,13,"Congratulations! You are the winner! ",10,13,"$"

ok db 10,13,"Ok,entering round   ","$"
fail db 10,13,"Failed at round   ","$"
DEDOMENA ENDS

KODIKAS SEGMENT
    ARXH:MOV AX,DEDOMENA
    MOV DS,AX
    
    call eisagwgi
    call clear_screen
    
             
    
    mov di,0 
    
    lea dx,msg2
    mov ah,09h
    int 21h 
    
    entrance: ;here's the loop starting
     
    
    call random_command
    
    call print_rand
  
    call space
    
    mov si,0  ;si = current round value
    call input_char 
    inc di
    
    cmp number,di  ; if di.equals(number of rounds) => stop!
    je termatismos
    jmp entrance ;else goto start

    
    termatismos:
    
    MOV AH,4CH                         
    INT 21H
    

KODIKAS ENDS


;==================FUNCTIONS==================
      

      
eisagwgi proc
    pusha
    
   start1:
    
lea dx,msg0
mov ah,09h
int 21h
    
mov ah,01h ;first digit
int 21h
sub al,30h ;ascii to normal convertion   
mov cl,10
mul cl        ;input decade
mov bh,al
    
mov ah,01h ;second digit
int 21h
sub al,30h
mov bl,al ;decade to ax, monad to bl
          
add bl,bh
mov bh,0
     
mov number,bx ; 
    
cmp bl,02h
jb start0
    
cmp bl,28h
ja start0
jmp next


start0:
lea dx,msg1
mov ah,09h
int 21h
jmp start1
    
next: 
popa
ret
eisagwgi endp  

;============================================================
                ;
clear_screen proc;
    push ax       ;
                   ;
    mov ax,3        ;   clear
    int 10h          ;
                      ;     screen
    pop ax             ;
    ret                 ;
clear_screen endp        ;
                          ;
;============================================================;
                                                             ;
random_command proc                                          ;
;? random number is placed on memory possition command       ;
;Random number of 2 bits and discarding 2 numbers.           ;
                                                             ;
  PUSH AX                                                    ;
  PUSH DX                                                    ;
  PUSH CX                                                    ;
again_random:                                                ;
  mov AH,0              ;Read ticks.                         ;
  int 1Ah               ;Time of day interrupt.              ;
                        ;To DX low word                      ;
                        ;To CX high word                     ;
  and DX,11b  		;mask the bits, We want only 00,01,10,11 ;
  cmp DL,0          ;discard 0,fetch a new number            ;
  JE again_random                                            ;
  cmp DL,1          ;discard 1,fetch a new number            ;
  JE again_random                                            ;
  mov command,dl                                             ;
  POP CX                                                     ;
  POP DX                                                     ;
  POP AX                                                     ;
  RET                                                        ;
random_command endp                                          ;
                   ;PARAGWGH TYXAIOU ARI8MOU                 ;
;=================================================;;;;;;;;;;;;

print_rand proc                   ;
                                  ;
pusha                             ;
                                  ;
cmp command,0                     ;
je tria                           ;
                                  ;
cmp command,1                     ;transference
je tessera                        ;
                                  ;of random
cmp command,2                     ;
je pente                          ;number
                                  ;
cmp command,3                     ;to the according
je e3i                            ;
                                  ;
tria:                             ;
lea dx,msg3                       ;
mov ah,09h                        ;position 
int 21h                           ;
mov buffer1[si],71h ;transference q   ;
jmp telos                         ;of the                                   ;
tessera:                          ;
lea dx,msg4                       ;array
mov ah,09h                        ;
int 21h                           ;
mov buffer1[si],77h ;transference w   ;
jmp telos                         ;buffer1
                                  ;
pente:                            ;
lea dx,msg5                       ;
mov ah,09h                        ;
int 21h                           ;
mov buffer1[si],65h ;transference e   ;
jmp telos                         ;
                                  ;
e3i:                              ;
lea dx,msg6                       ;
mov ah,09h                        ;
int 21h                           ;
mov buffer1[si],72h ; transference r  ;
                                  ;
telos:                            ;
                                  ;
popa                              ;
ret                               ;
print_rand endp                   ;
                                  ;
;=====================================================
           ;                                         =
space proc  ;                                        =
    push ax  ; by the end                            =
    push dx   ;     of each round                    =
               ;       and the display of            =
                ;        next round's                =
    lea dx,msg7  ;      strings,                     =
    mov ah,09h    ;       in order to                =
    int 21h        ;      let the user               =
                    ;      play (which means         =
    ksana:           ;      to start  giving         =
    mov ah,08h        ;     colors),                 =
    int 21h            ;     he has to press         =
    cmp al,20h          ;       spacebar,            =
    jne ksana            ;;   in order to get        =
                           ;   the new round         =
    call clear_screen     ;  started (this is imple- =
    pop dx               ;  mented by initially      =
    pop ax              ;  clearing the screen       =
    ret                ;   and then displaying the   =
space endp            ;    new color strings)        =
                     ;                               =
;=====================================================

input_char proc
   pusha
   call sigkrisi 
   popa
   
   paok:
   
   mov dl,buffer1[si]
   cmp dl,71h
   je q
   jmp cmp2
   
   q:
   lea dx,msg3
   mov ah,09h
   int 21h
   jmp go
   
   cmp2:
   cmp dl,77h
   je w
   jmp cmp3
   
   w:
   lea dx,msg4
   mov ah,09h  
   int 21h
   jmp go
   
   cmp3:
   cmp dl,65h
   je e
   jmp cmp4
   
   e:
   lea dx,msg5
   mov ah,09h
   int 21h
   jmp go
   
   cmp4:
   cmp dl,72h
   je r
   jmp go
   r:
   lea dx,msg6
   mov ah,09h
   int 21h
   
   go:
   cmp bx,9
   jae clear
   jmp go2
  
   clear:
   call clear_screen
      
   go2:
   inc si
   cmp si,di
   jbe paok
      
   
   ret
input_char endp   

;==============================================================
                            ;
next_round proc            ;
   push si                ;
   push ax               ;
   inc si               ;
   mov ah,0             ;
   mov ax,si           ;
                      ;
   cmp al,9           ;digit 
   ja dipsifio        ;display
   jmp monopsifio     ;that corresponds 
                      ;to the next
                      ;round
   monopsifio:        ;
                       ;
   mov dl,al
   add dl,30h           ;
   mov ah,02h            ;
   int 21h                ;
   jmp telos3              ;;
   
   dipsifio:                 ;;
   mov bl,10                   ;
   div bl                       ;
                                 ;
   mov dekada,al                  ;
   mov monada,ah
                                  ;
   mov dl,dekada                  ;;
   add dl,30h                     ;
   mov ah,02                      ;
   int 21h                         ;
                                   ;
   mov dl,monada                   ;;
   add dl,30h                       ;;
   mov ah,02                       ;
   int 21h                          ;
                                   ;;
   telos3:                        ;
   pop ax                        ;
   pop si                       ;
   ret                         ;          =
next_round endp               ;           =
                              ;           =
;==========================================

sigkrisi proc

here:
   
   mov ah,01h
   int 21h
   mov buffer2[si],al      ;move the user's input to buffer2
   inc si
   cmp si,di               ;comparing SI to DI; DI is the current counter and SI should reach DI's iterations
   jbe here
   
   call clear_screen
  
   
   mov si,0
here2:
   mov dl,buffer2[si]
   cmp dl,buffer1[si]   ;comparing user's input with buffer1
   
   jne loser            ;if an element is different, the flow goes to loser's label 
   cmp si,di            ;end of required iterations 
   je found1
   
   inc si
      
   jbe here2
   
   loser:
   mov si,di   ;displaying the exact round, where the error occured
   lea dx,fail
   mov ah,09h    ;msg display
   int 21h
   
     
   
   call next_round  ;displaying next round


   
   call clear_screen
   jmp termatismos
   
   found1:
   
   
   inc si
   cmp si,number ;if SI = rounds => WIN!!!
   je winer
    
      
   lea dx,ok
   mov ah,09h
   int 21h
   
   
   call next_round  ;entering round (+1)
   
   call clear_screen  
   
  
   jmp tellos
   
   
   winer:
   lea dx,winner
   mov ah,09h        ;msg display
   int 21h
   jmp termatismos   ;program ends
   
   tellos:
   mov bx,si 
   
   lea dx,msg2
   mov ah,09h
   int 21h
   
   
   ret
       
sigkrisi endp
;===============================================

SOROS SEGMENT STACK
    db 256 dup (0)
SOROS ENDS


END ARXH
