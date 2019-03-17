
_interrupt:

;Practica6A.c,3 :: 		void interrupt(){
;Practica6A.c,4 :: 		x=PORTB; // para poder borrar el bit RBIF (define x global)
	MOVF        PORTB+0, 0 
	MOVWF       _x+0 
;Practica6A.c,5 :: 		INTCON.RBIF=0; // se borra el bit RBIF después de llamar a la función
	BCF         INTCON+0, 0 
;Practica6A.c,6 :: 		if(PORTC.B0=1) PORTC.B0=0;
	BSF         PORTC+0, 0 
	BTFSS       PORTC+0, 0 
	GOTO        L_interrupt0
	BCF         PORTC+0, 0 
	GOTO        L_interrupt1
L_interrupt0:
;Practica6A.c,8 :: 		PORTC.B0=0;
	BCF         PORTC+0, 0 
;Practica6A.c,9 :: 		}
L_interrupt1:
;Practica6A.c,10 :: 		}
L_end_interrupt:
L__interrupt5:
	RETFIE      1
; end of _interrupt

_main:

;Practica6A.c,11 :: 		void main() {
;Practica6A.c,12 :: 		PORTB=0;
	CLRF        PORTB+0 
;Practica6A.c,13 :: 		INTCON2.RBPU=0; // se habilitan las resistencias de pullup del puerto B
	BCF         INTCON2+0, 7 
;Practica6A.c,14 :: 		x=PORTB; //para poder borrar el RBIF
	MOVF        PORTB+0, 0 
	MOVWF       _x+0 
;Practica6A.c,15 :: 		INTCON.RBIF=0;
	BCF         INTCON+0, 0 
;Practica6A.c,16 :: 		INTCON.RBIE=1;
	BSF         INTCON+0, 3 
;Practica6A.c,17 :: 		INTCON.GIE = 1;
	BSF         INTCON+0, 7 
;Practica6A.c,18 :: 		T0CON=0x80;
	MOVLW       128
	MOVWF       T0CON+0 
;Practica6A.c,19 :: 		while(1){
L_main2:
;Practica6A.c,21 :: 		}
	GOTO        L_main2
;Practica6A.c,23 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
