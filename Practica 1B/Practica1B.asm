
_main:

;Practica1B.c,1 :: 		void main() {
;Practica1B.c,3 :: 		char leds[] = {0x01,0x02,0x04,0x08,0x10,0x20,0x40,0x80};
	MOVLW       1
	MOVWF       main_leds_L0+0 
	MOVLW       2
	MOVWF       main_leds_L0+1 
	MOVLW       4
	MOVWF       main_leds_L0+2 
	MOVLW       8
	MOVWF       main_leds_L0+3 
	MOVLW       16
	MOVWF       main_leds_L0+4 
	MOVLW       32
	MOVWF       main_leds_L0+5 
	MOVLW       64
	MOVWF       main_leds_L0+6 
	MOVLW       128
	MOVWF       main_leds_L0+7 
;Practica1B.c,4 :: 		ADCON1 = 0x07;
	MOVLW       7
	MOVWF       ADCON1+0 
;Practica1B.c,5 :: 		PORTC = 0;
	CLRF        PORTC+0 
;Practica1B.c,6 :: 		TRISC = 0;
	CLRF        TRISC+0 
;Practica1B.c,7 :: 		while(1){
L_main0:
;Practica1B.c,8 :: 		for(i=0; i<8; i++){
	CLRF        R1 
L_main2:
	MOVLW       8
	SUBWF       R1, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main3
;Practica1B.c,9 :: 		PORTC = leds[i];
	MOVLW       main_leds_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(main_leds_L0+0)
	MOVWF       FSR0H 
	MOVF        R1, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTC+0 
;Practica1B.c,10 :: 		delay_ms(400);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	DECFSZ      R11, 1, 1
	BRA         L_main5
;Practica1B.c,11 :: 		PORTC = 0;
	CLRF        PORTC+0 
;Practica1B.c,12 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
	DECFSZ      R11, 1, 1
	BRA         L_main6
;Practica1B.c,8 :: 		for(i=0; i<8; i++){
	INCF        R1, 1 
;Practica1B.c,13 :: 		}
	GOTO        L_main2
L_main3:
;Practica1B.c,14 :: 		}
	GOTO        L_main0
;Practica1B.c,15 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
