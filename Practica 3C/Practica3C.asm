
_interrupt:

;Practica3C.c,4 :: 		void interrupt(){
;Practica3C.c,5 :: 		INTCON.INT0IF=0;
	BCF         INTCON+0, 1 
;Practica3C.c,6 :: 		if(i<100){
	MOVLW       100
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_interrupt0
;Practica3C.c,8 :: 		i++;
	INCF        _i+0, 1 
;Practica3C.c,9 :: 		}else{
	GOTO        L_interrupt1
L_interrupt0:
;Practica3C.c,10 :: 		i=0;
	CLRF        _i+0 
;Practica3C.c,11 :: 		}
L_interrupt1:
;Practica3C.c,12 :: 		unidades=numeros[i%10];
	MOVLW       10
	MOVWF       R4 
	MOVF        _i+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       _numeros+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_numeros+0)
	MOVWF       FSR0H 
	MOVF        R0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       _unidades+0 
;Practica3C.c,13 :: 		decenas=numeros[i/10];
	MOVLW       10
	MOVWF       R4 
	MOVF        _i+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVLW       _numeros+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_numeros+0)
	MOVWF       FSR0H 
	MOVF        R0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       _decenas+0 
;Practica3C.c,15 :: 		}
L_end_interrupt:
L__interrupt7:
	RETFIE      1
; end of _interrupt

_main:

;Practica3C.c,17 :: 		void main() {
;Practica3C.c,18 :: 		ADCON1=0x07;
	MOVLW       7
	MOVWF       ADCON1+0 
;Practica3C.c,19 :: 		TRISB.B0=1;
	BSF         TRISB+0, 0 
;Practica3C.c,20 :: 		TRISA.B0=0;
	BCF         TRISA+0, 0 
;Practica3C.c,21 :: 		TRISA.B1=0;
	BCF         TRISA+0, 1 
;Practica3C.c,22 :: 		PORTB=0;
	CLRF        PORTB+0 
;Practica3C.c,23 :: 		PORTA.B0=0;
	BCF         PORTA+0, 0 
;Practica3C.c,24 :: 		PORTA.B1=0;
	BCF         PORTA+0, 1 
;Practica3C.c,25 :: 		TRISD=0;
	CLRF        TRISD+0 
;Practica3C.c,26 :: 		PORTD=0;
	CLRF        PORTD+0 
;Practica3C.c,27 :: 		INTCON2.INTEDG0=0;
	BCF         INTCON2+0, 6 
;Practica3C.c,28 :: 		INTCON.INT0IF=0;
	BCF         INTCON+0, 1 
;Practica3C.c,29 :: 		INTCON.INT0IE=1;
	BSF         INTCON+0, 4 
;Practica3C.c,30 :: 		INTCON.GIE=1;
	BSF         INTCON+0, 7 
;Practica3C.c,31 :: 		INTCON2.B7=0;
	BCF         INTCON2+0, 7 
;Practica3C.c,34 :: 		while(1){
L_main2:
;Practica3C.c,35 :: 		PORTD=unidades;
	MOVF        _unidades+0, 0 
	MOVWF       PORTD+0 
;Practica3C.c,36 :: 		PORTA.B0=0;
	BCF         PORTA+0, 0 
;Practica3C.c,37 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
	NOP
	NOP
;Practica3C.c,38 :: 		PORTA.B0=1;
	BSF         PORTA+0, 0 
;Practica3C.c,40 :: 		PORTD=decenas;
	MOVF        _decenas+0, 0 
	MOVWF       PORTD+0 
;Practica3C.c,41 :: 		PORTA.B1=0;
	BCF         PORTA+0, 1 
;Practica3C.c,42 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	NOP
	NOP
;Practica3C.c,43 :: 		PORTA.B1=1;
	BSF         PORTA+0, 1 
;Practica3C.c,44 :: 		}
	GOTO        L_main2
;Practica3C.c,45 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
