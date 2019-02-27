
_main:

;Practica2.c,1 :: 		void main() {
;Practica2.c,3 :: 		char valores[] = {0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x67};
	MOVLW       63
	MOVWF       main_valores_L0+0 
	MOVLW       6
	MOVWF       main_valores_L0+1 
	MOVLW       91
	MOVWF       main_valores_L0+2 
	MOVLW       79
	MOVWF       main_valores_L0+3 
	MOVLW       102
	MOVWF       main_valores_L0+4 
	MOVLW       109
	MOVWF       main_valores_L0+5 
	MOVLW       125
	MOVWF       main_valores_L0+6 
	MOVLW       7
	MOVWF       main_valores_L0+7 
	MOVLW       127
	MOVWF       main_valores_L0+8 
	MOVLW       103
	MOVWF       main_valores_L0+9 
;Practica2.c,4 :: 		ADCON1 = 0x07;
	MOVLW       7
	MOVWF       ADCON1+0 
;Practica2.c,5 :: 		TRISA.B0 = 0;
	BCF         TRISA+0, 0 
;Practica2.c,6 :: 		TRISA.B1=0;
	BCF         TRISA+0, 1 
;Practica2.c,7 :: 		TRISD = 0;
	CLRF        TRISD+0 
;Practica2.c,8 :: 		PORTD=0;
	CLRF        PORTD+0 
;Practica2.c,10 :: 		PORTA.B0=0;
	BCF         PORTA+0, 0 
;Practica2.c,11 :: 		PORTA.B1=0;
	BCF         PORTA+0, 1 
;Practica2.c,13 :: 		while(1){
L_main0:
;Practica2.c,14 :: 		for(i=0;i<60;i++){
	CLRF        main_i_L0+0 
L_main2:
	MOVLW       60
	SUBWF       main_i_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main3
;Practica2.c,15 :: 		for(j=0;j<25;j++){
	CLRF        main_j_L0+0 
L_main5:
	MOVLW       25
	SUBWF       main_j_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main6
;Practica2.c,17 :: 		PORTD = valores[i%10];
	MOVLW       10
	MOVWF       R4 
	MOVF        main_i_L0+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       main_valores_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(main_valores_L0+0)
	MOVWF       FSR0H 
	MOVF        R0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTD+0 
;Practica2.c,18 :: 		PORTA.B0=1;
	BSF         PORTA+0, 0 
;Practica2.c,19 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main8:
	DECFSZ      R13, 1, 1
	BRA         L_main8
	DECFSZ      R12, 1, 1
	BRA         L_main8
	NOP
	NOP
;Practica2.c,20 :: 		PORTA.B0=0;
	BCF         PORTA+0, 0 
;Practica2.c,22 :: 		PORTD = valores[i/10];
	MOVLW       10
	MOVWF       R4 
	MOVF        main_i_L0+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVLW       main_valores_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(main_valores_L0+0)
	MOVWF       FSR0H 
	MOVF        R0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTD+0 
;Practica2.c,23 :: 		PORTA.B1=1;
	BSF         PORTA+0, 1 
;Practica2.c,24 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main9:
	DECFSZ      R13, 1, 1
	BRA         L_main9
	DECFSZ      R12, 1, 1
	BRA         L_main9
	NOP
	NOP
;Practica2.c,25 :: 		PORTA.B1=0;
	BCF         PORTA+0, 1 
;Practica2.c,15 :: 		for(j=0;j<25;j++){
	INCF        main_j_L0+0, 1 
;Practica2.c,26 :: 		}
	GOTO        L_main5
L_main6:
;Practica2.c,14 :: 		for(i=0;i<60;i++){
	INCF        main_i_L0+0, 1 
;Practica2.c,27 :: 		}
	GOTO        L_main2
L_main3:
;Practica2.c,28 :: 		}
	GOTO        L_main0
;Practica2.c,29 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
