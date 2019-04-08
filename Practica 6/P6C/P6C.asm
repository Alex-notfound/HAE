
_interrupt:

;P6C.c,2 :: 		void interrupt(){
;P6C.c,3 :: 		if(INTCON3.INT1IF){
	BTFSS       INTCON3+0, 0 
	GOTO        L_interrupt0
;P6C.c,4 :: 		PORTC.B0 = 1;
	BSF         PORTC+0, 0 
;P6C.c,5 :: 		contador = 0;
	CLRF        _contador+0 
	CLRF        _contador+1 
;P6C.c,6 :: 		T0CON = 0x84;
	MOVLW       132
	MOVWF       T0CON+0 
;P6C.c,7 :: 		TMR0H = (3036>>8);
	MOVLW       11
	MOVWF       TMR0H+0 
;P6C.c,8 :: 		TMR0L = 3036;
	MOVLW       220
	MOVWF       TMR0L+0 
;P6C.c,9 :: 		}
L_interrupt0:
;P6C.c,10 :: 		if(INTCON.TMR0IF){
	BTFSS       INTCON+0, 2 
	GOTO        L_interrupt1
;P6C.c,11 :: 		TMR0H = (3036>>8);
	MOVLW       11
	MOVWF       TMR0H+0 
;P6C.c,12 :: 		TMR0L = 3036;
	MOVLW       220
	MOVWF       TMR0L+0 
;P6C.c,13 :: 		contador++;
	INFSNZ      _contador+0, 1 
	INCF        _contador+1, 1 
;P6C.c,14 :: 		if(contador == 3){
	MOVLW       0
	XORWF       _contador+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt7
	MOVLW       3
	XORWF       _contador+0, 0 
L__interrupt7:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt2
;P6C.c,15 :: 		PORTC.B0 = 0;
	BCF         PORTC+0, 0 
;P6C.c,16 :: 		}
L_interrupt2:
;P6C.c,17 :: 		}
L_interrupt1:
;P6C.c,18 :: 		INTCON3.INT1IF = 0;
	BCF         INTCON3+0, 0 
;P6C.c,19 :: 		INTCON.TMR0IF = 0;
	BCF         INTCON+0, 2 
;P6C.c,20 :: 		}
L_end_interrupt:
L__interrupt6:
	RETFIE      1
; end of _interrupt

_main:

;P6C.c,21 :: 		void main() {
;P6C.c,22 :: 		ADCON1=0x07;
	MOVLW       7
	MOVWF       ADCON1+0 
;P6C.c,23 :: 		TRISB.B1=1;
	BSF         TRISB+0, 1 
;P6C.c,24 :: 		TRISC=0;
	CLRF        TRISC+0 
;P6C.c,25 :: 		PORTC.B0=0;
	BCF         PORTC+0, 0 
;P6C.c,26 :: 		INTCON2.INTEDG1= 1;
	BSF         INTCON2+0, 5 
;P6C.c,27 :: 		INTCON3.INT1IF = 0;  // se pone el flagde la interrupción INT1 a 0
	BCF         INTCON3+0, 0 
;P6C.c,28 :: 		INTCON3.INT1IE = 1; // se habilita la interrupción INT1
	BSF         INTCON3+0, 3 
;P6C.c,29 :: 		INTCON.TMR0IF = 0;
	BCF         INTCON+0, 2 
;P6C.c,30 :: 		INTCON.TMR0IE = 1;
	BSF         INTCON+0, 5 
;P6C.c,31 :: 		INTCON.GIE = 1;
	BSF         INTCON+0, 7 
;P6C.c,33 :: 		while(1);
L_main3:
	GOTO        L_main3
;P6C.c,34 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
