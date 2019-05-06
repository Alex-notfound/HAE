
_interrupt:

;P7A.c,19 :: 		void interrupt(){
;P7A.c,21 :: 		aux = ADRESL + (ADRESH << 8);
	MOVF        ADRESH+0, 0 
	MOVWF       R1 
	CLRF        R0 
	MOVF        ADRESL+0, 0 
	ADDWF       R0, 1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVF        R0, 0 
	MOVWF       _aux+0 
	MOVF        R1, 0 
	MOVWF       _aux+1 
;P7A.c,22 :: 		tension= 0.0048828*aux;
	CALL        _word2double+0, 0
	MOVLW       229
	MOVWF       R4 
	MOVLW       255
	MOVWF       R5 
	MOVLW       31
	MOVWF       R6 
	MOVLW       119
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _tension+0 
	MOVF        R1, 0 
	MOVWF       _tension+1 
	MOVF        R2, 0 
	MOVWF       _tension+2 
	MOVF        R3, 0 
	MOVWF       _tension+3 
;P7A.c,23 :: 		PIR1.ADIF = 0;
	BCF         PIR1+0, 6 
;P7A.c,24 :: 		FloatToStr(tension, txt);
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
;P7A.c,25 :: 		Lcd_out(1,1,txt);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;P7A.c,27 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_interrupt0:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt0
	DECFSZ      R12, 1, 1
	BRA         L_interrupt0
	DECFSZ      R11, 1, 1
	BRA         L_interrupt0
	NOP
	NOP
;P7A.c,28 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;P7A.c,29 :: 		ADCON0=0x45;
	MOVLW       69
	MOVWF       ADCON0+0 
;P7A.c,31 :: 		}
L_end_interrupt:
L__interrupt4:
	RETFIE      1
; end of _interrupt

_main:

;P7A.c,33 :: 		void main() {
;P7A.c,34 :: 		TRISA=1;
	MOVLW       1
	MOVWF       TRISA+0 
;P7A.c,35 :: 		PORTA=0;
	CLRF        PORTA+0 
;P7A.c,37 :: 		ADCON0= 0x41;
	MOVLW       65
	MOVWF       ADCON0+0 
;P7A.c,38 :: 		ADCON1= 0xC0;
	MOVLW       192
	MOVWF       ADCON1+0 
;P7A.c,40 :: 		PIR1.ADIF = 0;
	BCF         PIR1+0, 6 
;P7A.c,41 :: 		PIE1.ADIE = 1;
	BSF         PIE1+0, 6 
;P7A.c,42 :: 		INTCON.PEIE = 1;
	BSF         INTCON+0, 6 
;P7A.c,43 :: 		INTCON.GIE = 1;
	BSF         INTCON+0, 7 
;P7A.c,45 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;P7A.c,46 :: 		ADCON0= 0x45;
	MOVLW       69
	MOVWF       ADCON0+0 
;P7A.c,48 :: 		while(1);
L_main1:
	GOTO        L_main1
;P7A.c,49 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
