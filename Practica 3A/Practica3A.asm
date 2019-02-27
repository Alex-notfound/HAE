
_main:

;Practica3A.c,3 :: 		void main() {
;Practica3A.c,4 :: 		ADCON1=0x07;
	MOVLW       7
	MOVWF       ADCON1+0 
;Practica3A.c,5 :: 		TRISB.B0=1;
	BSF         TRISB+0, 0 
;Practica3A.c,6 :: 		TRISB.B1=0;
	BCF         TRISB+0, 1 
;Practica3A.c,7 :: 		PORTB=0;
	CLRF        PORTB+0 
;Practica3A.c,8 :: 		INTCON2.B7=0;
	BCF         INTCON2+0, 7 
;Practica3A.c,10 :: 		while(1){
L_main0:
;Practica3A.c,11 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	DECFSZ      R11, 1, 1
	BRA         L_main2
	NOP
;Practica3A.c,12 :: 		if((pulsado==1)&& (PORTB.B0 == 0)){
	MOVF        _pulsado+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main5
	BTFSC       PORTB+0, 0 
	GOTO        L_main5
L__main6:
;Practica3A.c,13 :: 		PORTB.B1 = !PORTB.B1;
	BTG         PORTB+0, 1 
;Practica3A.c,14 :: 		}
L_main5:
;Practica3A.c,15 :: 		pulsado=PORTB.B0;
	MOVLW       0
	BTFSC       PORTB+0, 0 
	MOVLW       1
	MOVWF       _pulsado+0 
;Practica3A.c,16 :: 		}
	GOTO        L_main0
;Practica3A.c,17 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
