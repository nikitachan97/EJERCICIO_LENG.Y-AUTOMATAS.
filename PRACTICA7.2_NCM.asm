;INSTITUTO TECNOLOGICO DE VALLADOLID
;LENGUAJE Y AUTOMATAS 2 6B
;ELABORADO POR:NIKITA CHAN
;FECHA: 11/MAYO/2019 
;EJERCICIOS
 
.MODEL SMALL  


.DATA     
     CADENA1 DB 'MENU DE OPERACIONES$'
     CADENA2 DB '[1] OPERACIONES ARITMETICAS$'
     CADENA3 DB '[2] COMPARACION DE NUMEROS$'
     CADENA6 DB 'SELECIONE UNA OPCION:$'
     CADENA7 DB 'PARA REGRESAR PRESIONE [1]$'
     CADENA8 DB 'PARA REGRESAR PRESIONE [1]$'

    
   
   ;declarando variables globales
numero1 db 0
numero2 db 0

suma db 0
resta db 0
multiplicacion db 0
division db 0
modulo db 0

msjn db 10,13, "CALCULAR LAS OPERACIONES$"         
msjn0 db 10,13, "INGRESA LOS NUMEROS DE 9 A 0","$"          
msjn1 db 10,13, "El primer numero es= ",'$'    ;ingrese n1
msjn2 db 10,13, "El segundo numero es= ",'$'   ;ingrese n2
msjn3 db 10,13, "$"



;mensaje para mostrar los resultados
 
msjnS db 10,13, "Estos sumados son = ",'$'
msjnR db 10,13, "Estos restados son = ",'$'
msjnM db 10,13, "Estos Multiplicados son = ",'$'
msjnD db 10,13, "Y  dividos  son = ",'$' 

;-------------------------------------


msj1 db 0ah,0dh, 'Ingrese Tres digito del 0 al 9 : ', '$'
msj2 db 0ah,0dh, 'Primer num.: ', '$'
msj3 db 0ah,0dh, 'Segundo num.: ', '$'
msj4 db 0ah,0dh, 'Tercer num.: ', '$'
Mayor db 0ah,0dh, 'El numero mayor Es: ', '$'

num1 db 100 dup('$')
num2 db 100 dup('$')
num3 db 100 dup('$')

salto db 13,10,'',13,10,'$' ;salto de linea  


    
.CODE   
     PROGRAMA:
     MOV AX,@DATA
     MOV DS,AX 
           
           
     MENU:
     
     MOV AH,06H        
     MOV AL,0        
     MOV BH,0FH    
     MOV CX,0000H                                     
     MOV DX,184FH
     INT 10H 
     
   ;///////////////////////////////////////// 
              ;MENU DE OP
     
     
     
     MOV AH,06H         
     MOV AL,0         
     MOV BH,6FH    
     MOV CX,0507H ;ILA, COLUM INIC             
     MOV DX,0348H    ;        LUMNA FINALES
     INT 10H  
                                                      
    ;/////////////////////////////////////////
     
     
     MOV AH,06H        
     MOV AL,0         
     MOV BH,4FH    
     MOV CX,0507H                                    
     MOV DX,1448H
     INT 10H        
     
         
     
    ;/////////////////////////////////////////

    MOV AH,02H
    MOV BH,0      
    MOV DH,03H  
    MOV DL,23H   
    INT 10H 
                ;MOV PARA IMPRIMIR EL MENSAJE
    MOV AH,09H
    MOV DX,OFFSET CADENA1
    INT 21H  
   
    
    ;/////////////////////////////////////////
                 
    MOV AH,02H
    MOV BH,0     
    MOV DH,06H   
    MOV DL,09H  
    INT 10H  
                 ;MOV PARA IMPRIMIR EL MENSAJE
    MOV AH,09H
    MOV DX,OFFSET CADENA2
    INT 21H                
                 
    ;/////////////////////////////////////////
    
    
    MOV AH,02H
    MOV BH,0      
    MOV DH,08H   
    MOV DL,09H   
    INT 10H  
                 ;MOV PARA IMPRIMIR EL MENSAJE
    MOV AH,09H
    MOV DX,OFFSET CADENA3
    INT 21H 
    
    ;/////////////////////////////////////////
    
                  MOV AH,02H
    MOV BH,0     
    MOV DH,16H        ;80 Y 25 FILAS 
    MOV DL,34H      ;ABAJO
    INT 10H  
                 ;MOV PARA IMPRIMIR EL MENSAJE
    MOV AH,09H
    MOV DX,OFFSET CADENA6
    INT 21H 
                    
       
                     ;---FUNCION SALTO PANTALLA----INICIO------- 
    ;LEER DATOS
        
    MOV AH,0H
    INT 16H  
    
    
    
    CMP AL,"1" 
    JE OPERACIONES
    
    CMP AL,"2"
    JE NMAYOR
    
      
      
    
    ;TERMINA EL PROGRAMA
     
    MOV AH,4CH 
    INT 21H
    JMP   
        
        
   
    
    OPERACIONES:    
    MOV AH,06H 
    MOV AL,0  
    MOV BH,3FH ;color de fondo y texto
    MOV CX,0000H   
    MOV DX,187FH 
    INT 10H
           
         
         
    MOV AH,02H
    MOV BH,0      
    MOV DH,05H   
    MOV DL,05H   
    INT 10H
    
      
    begin proc far
    
    ;direccionamiento del procedimiento
    mov ax, @data
    mov ds,ax
    
    
     ;solicitar del numeros
      
      
     mov ah, 09
    lea dx, msjn
    int 21h
       
     mov ah, 09
    lea dx, msjn3
    int 21h
   
    
    mov ah, 09
    lea dx, msjn0
    int 21h


     mov ah, 09
    lea dx, msjn3
    int 21h
    
    
    
    ;solicitar del teclado numero 1
    
    mov ah, 09
    lea dx, msjn1
    int 21h
    mov ah, 01
    int 21h
    sub al, 30h
    mov numero1,al
    
    ;solicitar del teclado numero 2
    
    mov ah, 09
    lea dx, msjn2
    int 21h
    mov ah, 01
    int 21h
    sub al, 30h
    mov numero2,al
    
    ;operaciones aritmeticas
                  
    ;SUMA             
    mov al,numero1
    add al,numero2
    mov suma,al  
    
    ;RESTA
    mov al,numero1
    sub al,numero2
    mov resta,al
    
    ;MULTIPLICACION 

    mov al,numero1
    mul numero2
    mov multiplicacion,al
    
    ;DIVISION
    mov al,numero1
    div numero2
    mov division,al
    
       
    ;Mostrar los mensajes de los resultados 
    
    ;mostrando la suma
    mov ah,09
    lea dx,msjnS
    int 21h
    mov dl,suma
    add dl,30h 
    mov ah,02
    int 21h  
    
    ;mostrando la resta
    mov ah,09
    lea dx,msjnR
    int 21h
    mov dl,resta
    add dl,30h 
    mov ah,02
    int 21h
    
    ;mostrando la multiplicacion
    mov ah,09
    lea dx,msjnM
    int 21h
    mov dl,multiplicacion
    add dl,30h 
    mov ah,02
    int 21h
    
    ;mostrando la division
    mov ah,09
    lea dx,msjnD
    int 21h
    mov dl,division
    add dl,30h 
    mov ah,02
    int 21h
    
               
     
               
     MOV AH,02H
    MOV BH,0
    MOV DH,18
    MOV DL,20H
    INT 10H
            ;IMPRIMIR MENSAJE 
            
    MOV AH,09H
    MOV DX,OFFSET CADENA7
    INT 21H
        
    ;RETORNO A LA PANTALLA
    MOV AH,0H 
    INT 16H
    
    CMP AL,"1"
    JE  MENU
    
    JMP
    
                
    ;cierre del programa
    mov ah,4ch
    int 21h
    
    begin endp


 ;....................................................................     
   
   
           
    ;MOV AX,4C00H
    ;INT 21
            
            
    ;COORDENADAS
            
     
    
    NMAYOR:
    MOV AH,6H 
    MOV AL,0  
    MOV BH,5FH ;color de fondo y texto
    MOV CX,0000H 
    MOV DX,187FH
    INT 10H   
            
    MOV AH,02H
    MOV BH,0      
    MOV DH,05H   
    MOV DL,05H   
    INT 10H
    
           
    mov si,0
mov ax,@data
mov ds,ax
mov ah,09
mov dx,offset msj1 ;Imprimimos el msj1
int 21h

call saltodelinea;llamamos el metodo saltodelinea.
call pedircaracter ;llamamos al metodo

mov num1,al ;lo guardado en AL a digito1
call saltodelinea
call pedircaracter
mov num2,al
call saltodelinea
call pedircaracter
mov num3,al
call saltodelinea

;*******************************COMPARAR*****************************************

mov ah,num1
mov al,num2
cmp ah,al ;compara primero con el segundo
ja compara-1-3 ;si es mayor el primero, ahora lo compara con el tercero
jmp compara-2-3 ;si el primero no es mayor,ahora compara el 2 y 3 digito
compara-1-3:
mov al,num3 ;ah=primer digito, al=tercer digito
cmp ah,al ;compara primero con tercero
ja mayor1 ;si es mayor que el tercero, entonces el primero es mayor que los 3

compara-2-3:
mov ah,num2
mov al,num3
cmp ah,al ;compara 2 y 3, YA NO es necesario compararlo con el 1,porque ya sabemos que el 1 no es mayor que el 2
ja mayor2 ;Si es mayor el 2,nos vamos al metodo para imprimirlo
jmp mayor3 ;Si el 2 no es mayor, obvio el 3 es el mayor

 
mayor1:

call MensajeMayor ;llama al metodo que dice: El digito mayor es:

mov dx, offset num1 ;Imprir El Digito 1 es mayor
mov ah, 9
int 21h
jmp exit

mayor2:
call MensajeMayor

mov dx, offset num2 ;Salto de linea
mov ah, 9
int 21h
jmp exit

mayor3:
call MensajeMayor

mov dx, offset num3 ;Salto de linea
mov ah, 9
int 21h
jmp exit

;********************************METODOS*****************************************

MensajeMayor:
mov dx, offset Mayor ;El digito Mayor es:
mov ah, 9
int 21h

ret
pedircaracter:
mov ah,01h; pedimos primer digito
int 21h
ret

saltodelinea:
mov dx, offset salto ;Salto de linea
mov ah, 9
int 21h
ret
    
    
exit:
   


  ;CODIGO PARA REGRESAR A LA PANTALLA INICIAL
    
    MOV AH,02H
    MOV BH,0
    MOV DH,18
    MOV DL,20H
    INT 10H
    
    MOV AH,09H
    MOV DX,OFFSET CADENA8
    INT 21H
    
    MOV AH,0H 
    INT 16H
    
    CMP AL,"2"
    JE  MENU
   
    
    JMP 

    CODE ENDS
END PROGRAMA