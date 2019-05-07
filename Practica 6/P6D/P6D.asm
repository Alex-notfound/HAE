
_interrupt:

;P6D.c,20 :: 		void interrupt(){
;P6D.c,21 :: 		x = PORTB;
	MOVF        PORTB+0, 0 
	MOVWF       _x+0 
;P6D.c,22 :: 		if(INTCON.RBIF){
	BTFSS       INTCON+0, 0 
	GOTO        L_interrupt0
;P6D.c,23 :: 		T0CON.TMR0ON=1;
	BSF         T0CON+0, 7 
;P6D.c,25 :: 		TMR0L=6;
	MOVLW       6
	MOVWF       TMR0L+0 
;P6D.c,26 :: 		}
L_interrupt0:
;P6D.c,27 :: 		if(INTCON.TMR0IF){
	BTFSS       INTCON+0, 2 
	GOTO        L_interrupt1
;P6D.c,28 :: 		PORTC.B0=!PORTC.B0;     //
	BTG         PORTC+0, 0 
;P6D.c,29 :: 		contador++;
	INCF        _contador+0, 1 
;P6D.c,30 :: 		}
L_interrupt1:
;P6D.c,31 :: 		if(!x){
	MOVF        _x+0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt2
;P6D.c,33 :: 		ByteToStr(contador,num);
	MOVF        _contador+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       _num+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(_num+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;P6D.c,34 :: 		Lcd_out(1,1,num);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _num+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_num+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;P6D.c,35 :: 		T0CON.TMR0ON=0;
	BCF         T0CON+0, 7 
;P6D.c,36 :: 		}
L_interrupt2:
;P6D.c,37 :: 		INTCON.RBIF = 0;
	BCF         INTCON+0, 0 
;P6D.c,38 :: 		INTCON.TMR0IF = 0;
	BCF         INTCON+0, 2 
;P6D.c,39 :: 		}
L_end_interrupt:
L__interrupt6:
	RETFIE      1
; end of _interrupt

_main:

;P6D.c,41 :: 		void main() {
;P6D.c,42 :: 		ADCON1=0x07;
	MOVLW       7
	MOVWF       ADCON1+0 
;P6D.c,43 :: 		PORTB=0;
	CLRF        PORTB+0 
;P6D.c,44 :: 		PORTD=0;
	CLRF        PORTD+0 
;P6D.c,45 :: 		TRISD=0;
	CLRF        TRISD+0 
;P6D.c,46 :: 		TRISB.B4=1;
	BSF         TRISB+0, 4 
;P6D.c,48 :: 		RCON.IPEN = 0;
	BCF         RCON+0, 7 
;P6D.c,49 :: 		x = PORTB;
	MOVF        PORTB+0, 0 
	MOVWF       _x+0 
;P6D.c,50 :: 		INTCON.RBIF = 0;   // se pone el flag a 0
	BCF         INTCON+0, 0 
;P6D.c,51 :: 		INTCON.RBIE = 1;    // se habilita la interrupción por cambio de nivel
	BSF         INTCON+0, 3 
;P6D.c,52 :: 		T0CON=0x41;
	MOVLW       65
	MOVWF       T0CON+0 
;P6D.c,53 :: 		INTCON.TMR0IF = 0;
	BCF         INTCON+0, 2 
;P6D.c,54 :: 		INTCON.TMR0IE = 1;
	BSF         INTCON+0, 5 
;P6D.c,55 :: 		INTCON.GIE = 1;
	BSF         INTCON+0, 7 
;P6D.c,56 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;P6D.c,57 :: 		while(1) asm nop;
L_main3:
	NOP
	GOTO        L_main3
;P6D.c,58 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
