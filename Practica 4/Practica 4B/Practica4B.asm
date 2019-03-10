
_interrupt:

;Practica4B.c,7 :: 		void interrupt(){
;Practica4B.c,8 :: 		INTCON.INT0IF=0;
	BCF         INTCON+0, 1 
;Practica4B.c,9 :: 		if(girar==0){
	MOVF        _girar+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt0
;Practica4B.c,10 :: 		for(i=5;i<10;i++){
	MOVLW       5
	MOVWF       _i+0 
L_interrupt1:
	MOVLW       10
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_interrupt2
;Practica4B.c,11 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_interrupt4:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt4
	DECFSZ      R12, 1, 1
	BRA         L_interrupt4
	DECFSZ      R11, 1, 1
	BRA         L_interrupt4
;Practica4B.c,12 :: 		PORTC=bobinas[i];
	MOVLW       _bobinas+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_bobinas+0)
	MOVWF       FSR0H 
	MOVF        _i+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTC+0 
;Practica4B.c,10 :: 		for(i=5;i<10;i++){
	INCF        _i+0, 1 
;Practica4B.c,14 :: 		}
	GOTO        L_interrupt1
L_interrupt2:
;Practica4B.c,15 :: 		girar = 1;
	MOVLW       1
	MOVWF       _girar+0 
;Practica4B.c,16 :: 		}
	GOTO        L_interrupt5
L_interrupt0:
;Practica4B.c,18 :: 		for(i=0;i<10;i++){
	CLRF        _i+0 
L_interrupt6:
	MOVLW       10
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_interrupt7
;Practica4B.c,19 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_interrupt9:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt9
	DECFSZ      R12, 1, 1
	BRA         L_interrupt9
	DECFSZ      R11, 1, 1
	BRA         L_interrupt9
;Practica4B.c,20 :: 		PORTC=bobinas2[i];
	MOVLW       _bobinas2+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_bobinas2+0)
	MOVWF       FSR0H 
	MOVF        _i+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTC+0 
;Practica4B.c,18 :: 		for(i=0;i<10;i++){
	INCF        _i+0, 1 
;Practica4B.c,21 :: 		}
	GOTO        L_interrupt6
L_interrupt7:
;Practica4B.c,23 :: 		}
L_interrupt5:
;Practica4B.c,24 :: 		}
L_end_interrupt:
L__interrupt14:
	RETFIE      1
; end of _interrupt

_main:

;Practica4B.c,26 :: 		void main() {
;Practica4B.c,27 :: 		ADCON1=0x07;
	MOVLW       7
	MOVWF       ADCON1+0 
;Practica4B.c,28 :: 		TRISB.B0=1;
	BSF         TRISB+0, 0 
;Practica4B.c,29 :: 		TRISC=0;
	CLRF        TRISC+0 
;Practica4B.c,30 :: 		INTCON2.INTEDG0=0;
	BCF         INTCON2+0, 6 
;Practica4B.c,31 :: 		INTCON.INT0IF=0;
	BCF         INTCON+0, 1 
;Practica4B.c,32 :: 		INTCON.INT0IE=1;
	BSF         INTCON+0, 4 
;Practica4B.c,33 :: 		INTCON.GIE=1;
	BSF         INTCON+0, 7 
;Practica4B.c,34 :: 		INTCON2.RBPU=0;
	BCF         INTCON2+0, 7 
;Practica4B.c,35 :: 		PORTB=0;
	CLRF        PORTB+0 
;Practica4B.c,36 :: 		PORTC=0;
	CLRF        PORTC+0 
;Practica4B.c,37 :: 		PORTC.B1=1;
	BSF         PORTC+0, 1 
;Practica4B.c,38 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main10:
	DECFSZ      R13, 1, 1
	BRA         L_main10
	DECFSZ      R12, 1, 1
	BRA         L_main10
	DECFSZ      R11, 1, 1
	BRA         L_main10
;Practica4B.c,39 :: 		PORTC.B2=1;
	BSF         PORTC+0, 2 
;Practica4B.c,41 :: 		while(1){
L_main11:
;Practica4B.c,42 :: 		}
	GOTO        L_main11
;Practica4B.c,43 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
