
_interrupt:

;P7B.c,20 :: 		void interrupt(){
;P7B.c,21 :: 		if(INTCON.TMR0IF && INTCON.TMR0IE){
	BTFSS       INTCON+0, 2 
	GOTO        L_interrupt2
	BTFSS       INTCON+0, 5 
	GOTO        L_interrupt2
L__interrupt9:
;P7B.c,22 :: 		INTCON.TMR0IF = 0; // Desactivamos la interrupcion
	BCF         INTCON+0, 2 
;P7B.c,23 :: 		TMR0H = (18661>>8);
	MOVLW       72
	MOVWF       TMR0H+0 
;P7B.c,24 :: 		TMR0L = 18661;
	MOVLW       229
	MOVWF       TMR0L+0 
;P7B.c,25 :: 		ADCON0.GO = 1;
	BSF         ADCON0+0, 2 
;P7B.c,27 :: 		}
L_interrupt2:
;P7B.c,28 :: 		if(PIR1.ADIF && PIE1.ADIE){
	BTFSS       PIR1+0, 6 
	GOTO        L_interrupt5
	BTFSS       PIE1+0, 6 
	GOTO        L_interrupt5
L__interrupt8:
;P7B.c,29 :: 		PIR1.ADIF = 0;
	BCF         PIR1+0, 6 
;P7B.c,30 :: 		x = ADRESL;
	MOVF        ADRESL+0, 0 
	MOVWF       _x+0 
	MOVLW       0
	MOVWF       _x+1 
;P7B.c,31 :: 		x = x+(ADRESH<<8);
	MOVF        ADRESH+0, 0 
	MOVWF       R1 
	CLRF        R0 
	MOVF        _x+0, 0 
	ADDWF       R0, 1 
	MOVF        _x+1, 0 
	ADDWFC      R1, 1 
	MOVF        R0, 0 
	MOVWF       _x+0 
	MOVF        R1, 0 
	MOVWF       _x+1 
;P7B.c,32 :: 		aux = x*(500.0/1023.0);
	CALL        _word2double+0, 0
	MOVLW       144
	MOVWF       R4 
	MOVLW       62
	MOVWF       R5 
	MOVLW       122
	MOVWF       R6 
	MOVLW       125
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _aux+0 
	MOVF        R1, 0 
	MOVWF       _aux+1 
	MOVF        R2, 0 
	MOVWF       _aux+2 
	MOVF        R3, 0 
	MOVWF       _aux+3 
;P7B.c,33 :: 		FloatToStr(aux,txt);
	MOVF        R0, 0 
	MOVWF       FARG_FloatToStr_fnum+0 
	MOVF        R1, 0 
	MOVWF       FARG_FloatToStr_fnum+1 
	MOVF        R2, 0 
	MOVWF       FARG_FloatToStr_fnum+2 
	MOVF        R3, 0 
	MOVWF       FARG_FloatToStr_fnum+3 
	MOVLW       _txt+0
	MOVWF       FARG_FloatToStr_str+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_FloatToStr_str+1 
	CALL        _FloatToStr+0, 0
;P7B.c,34 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;P7B.c,35 :: 		LCD_OUT(1,1,txt);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;P7B.c,36 :: 		}
L_interrupt5:
;P7B.c,37 :: 		}
L_end_interrupt:
L__interrupt11:
	RETFIE      1
; end of _interrupt

_main:

;P7B.c,39 :: 		void main() {
;P7B.c,40 :: 		TRISE.B1=1;
	BSF         TRISE+0, 1 
;P7B.c,41 :: 		PORTC=0;
	CLRF        PORTC+0 
;P7B.c,42 :: 		T0CON=0x95;
	MOVLW       149
	MOVWF       T0CON+0 
;P7B.c,43 :: 		ADCON0=0x71;
	MOVLW       113
	MOVWF       ADCON0+0 
;P7B.c,44 :: 		ADCON1=0xC0;
	MOVLW       192
	MOVWF       ADCON1+0 
;P7B.c,46 :: 		INTCON.TMR0IF = 0; // se pone el flag a 0
	BCF         INTCON+0, 2 
;P7B.c,47 :: 		INTCON.TMR0IE = 1; // se habilita la interrupción del Timer 0
	BSF         INTCON+0, 5 
;P7B.c,48 :: 		INTCON.GIE = 1; // se habilitan las interrupciones en general
	BSF         INTCON+0, 7 
;P7B.c,49 :: 		TMR0H = (18661 >> 8);
	MOVLW       72
	MOVWF       TMR0H+0 
;P7B.c,50 :: 		TMR0L = 18661; //se carga el valor inicial (alfa) del ‘contador’
	MOVLW       229
	MOVWF       TMR0L+0 
;P7B.c,52 :: 		PIR1.ADIF = 0;
	BCF         PIR1+0, 6 
;P7B.c,53 :: 		PIE1.ADIE = 1;
	BSF         PIE1+0, 6 
;P7B.c,54 :: 		INTCON.PEIE = 1;
	BSF         INTCON+0, 6 
;P7B.c,56 :: 		Lcd_Init ();
	CALL        _Lcd_Init+0, 0
;P7B.c,57 :: 		while(1);
L_main6:
	GOTO        L_main6
;P7B.c,58 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
