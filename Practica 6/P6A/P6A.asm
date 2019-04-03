
_interrupt:

;P6A.c,1 :: 		void interrupt(){
;P6A.c,3 :: 		INTCON.TMR0IF=0; //pone flag Timer0 a 0
	BCF         INTCON+0, 2 
;P6A.c,5 :: 		if(PORTC.B0==0){
	BTFSC       PORTC+0, 0 
	GOTO        L_interrupt0
;P6A.c,6 :: 		TMR0L=106;
	MOVLW       106
	MOVWF       TMR0L+0 
;P6A.c,7 :: 		T0CON=0xC1;
	MOVLW       193
	MOVWF       T0CON+0 
;P6A.c,8 :: 		}else{
	GOTO        L_interrupt1
L_interrupt0:
;P6A.c,9 :: 		TMR0L=81;
	MOVLW       81
	MOVWF       TMR0L+0 
;P6A.c,10 :: 		T0CON=0xC2;
	MOVLW       194
	MOVWF       T0CON+0 
;P6A.c,11 :: 		}
L_interrupt1:
;P6A.c,12 :: 		PORTC.B0=~PORTC.B0;
	BTG         PORTC+0, 0 
;P6A.c,13 :: 		}
L_end_interrupt:
L__interrupt5:
	RETFIE      1
; end of _interrupt

_main:

;P6A.c,15 :: 		void main(){
;P6A.c,17 :: 		TRISC.B0=0; //indica que los puertos RC son de salida
	BCF         TRISC+0, 0 
;P6A.c,18 :: 		PORTC=0; //borra los valores almacenados en los puertos RC
	CLRF        PORTC+0 
;P6A.c,19 :: 		T0CON=0xC1;
	MOVLW       193
	MOVWF       T0CON+0 
;P6A.c,20 :: 		INTCON.TMR0IF=0; //pone flag Timer0 a 0
	BCF         INTCON+0, 2 
;P6A.c,21 :: 		INTCON.TMR0IE=1; //habilita interrupcion Timer0
	BSF         INTCON+0, 5 
;P6A.c,22 :: 		INTCON.GIE=1; //habilita interrupciones (general)
	BSF         INTCON+0, 7 
;P6A.c,23 :: 		TMR0L=106;
	MOVLW       106
	MOVWF       TMR0L+0 
;P6A.c,25 :: 		while(1);
L_main2:
	GOTO        L_main2
;P6A.c,26 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
