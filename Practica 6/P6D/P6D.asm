
_interrupt:

;P6D.c,21 :: 		void interrupt(){
;P6D.c,22 :: 		x = PORTB;
	MOVF        PORTB+0, 0 
	MOVWF       _x+0 
;P6D.c,23 :: 		INTCON.RBIF = 0;
	BCF         INTCON+0, 0 
;P6D.c,24 :: 		if(primera){
	MOVF        _primera+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupt0
;P6D.c,25 :: 		T0CON = 0x84;
	MOVLW       132
	MOVWF       T0CON+0 
;P6D.c,26 :: 		primera=0;
	CLRF        _primera+0 
;P6D.c,27 :: 		}
L_interrupt0:
;P6D.c,28 :: 		if(x){
	MOVF        _x+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupt1
;P6D.c,29 :: 		TMR0H = (3036>>8);
	MOVLW       11
	MOVWF       TMR0H+0 
;P6D.c,30 :: 		TMR0L = 3036;
	MOVLW       220
	MOVWF       TMR0L+0 
;P6D.c,31 :: 		aux=aux+1;
	INCF        _aux+0, 1 
;P6D.c,32 :: 		ByteToStr(aux,num);
	MOVF        _aux+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       _num+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(_num+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;P6D.c,33 :: 		Lcd_out(1,1,num);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _num+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_num+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;P6D.c,34 :: 		}
L_interrupt1:
;P6D.c,36 :: 		INTCON.TMR0IF = 0;
	BCF         INTCON+0, 2 
;P6D.c,37 :: 		}
L_end_interrupt:
L__interrupt5:
	RETFIE      1
; end of _interrupt

_main:

;P6D.c,39 :: 		void main() {
;P6D.c,40 :: 		ADCON1=0x07;
	MOVLW       7
	MOVWF       ADCON1+0 
;P6D.c,41 :: 		PORTB=0;
	CLRF        PORTB+0 
;P6D.c,42 :: 		PORTD=0;
	CLRF        PORTD+0 
;P6D.c,43 :: 		TRISD=0;
	CLRF        TRISD+0 
;P6D.c,44 :: 		TRISB.B4=1;
	BSF         TRISB+0, 4 
;P6D.c,45 :: 		RCON.IPEN = 0;
	BCF         RCON+0, 7 
;P6D.c,46 :: 		x = PORTB;
	MOVF        PORTB+0, 0 
	MOVWF       _x+0 
;P6D.c,47 :: 		INTCON.RBIF = 0;   // se pone el flag a 0
	BCF         INTCON+0, 0 
;P6D.c,48 :: 		INTCON.RBIE = 1;    // se habilita la interrupción por cambio de nivel
	BSF         INTCON+0, 3 
;P6D.c,49 :: 		INTCON.TMR0IF = 0;
	BCF         INTCON+0, 2 
;P6D.c,50 :: 		INTCON.TMR0IE = 1;
	BSF         INTCON+0, 5 
;P6D.c,51 :: 		INTCON.GIE = 1;
	BSF         INTCON+0, 7 
;P6D.c,52 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;P6D.c,53 :: 		while(1);
L_main2:
	GOTO        L_main2
;P6D.c,54 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
