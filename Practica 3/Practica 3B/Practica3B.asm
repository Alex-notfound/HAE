
_interrupt:

;Practica3B.c,1 :: 		void interrupt(){
;Practica3B.c,2 :: 		INTCON.INT0IF=0;
	BCF         INTCON+0, 1 
;Practica3B.c,3 :: 		PORTB.B1=!PORTB.B1;
	BTG         PORTB+0, 1 
;Practica3B.c,4 :: 		}
L_end_interrupt:
L__interrupt3:
	RETFIE      1
; end of _interrupt

_main:

;Practica3B.c,6 :: 		void main() {
;Practica3B.c,7 :: 		ADCON1=0x07;
	MOVLW       7
	MOVWF       ADCON1+0 
;Practica3B.c,8 :: 		TRISB.B0=1;
	BSF         TRISB+0, 0 
;Practica3B.c,9 :: 		TRISB.B1=0;
	BCF         TRISB+0, 1 
;Practica3B.c,10 :: 		PORTB=0;
	CLRF        PORTB+0 
;Practica3B.c,11 :: 		INTCON2.INTEDG0=0;
	BCF         INTCON2+0, 6 
;Practica3B.c,12 :: 		INTCON.INT0IF=0;
	BCF         INTCON+0, 1 
;Practica3B.c,13 :: 		INTCON.INT0IE=1;
	BSF         INTCON+0, 4 
;Practica3B.c,14 :: 		INTCON.GIE=1;
	BSF         INTCON+0, 7 
;Practica3B.c,15 :: 		INTCON2.B7=0;
	BCF         INTCON2+0, 7 
;Practica3B.c,16 :: 		while(1){
L_main0:
;Practica3B.c,17 :: 		}
	GOTO        L_main0
;Practica3B.c,18 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
