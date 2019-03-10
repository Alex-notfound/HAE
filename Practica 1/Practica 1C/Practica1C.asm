
_main:

;Practica1C.c,1 :: 		void main() {
;Practica1C.c,3 :: 		char leds[] = {0x81,0x42,0x24,0x18,0x24,0x42};
	MOVLW       129
	MOVWF       main_leds_L0+0 
	MOVLW       66
	MOVWF       main_leds_L0+1 
	MOVLW       36
	MOVWF       main_leds_L0+2 
	MOVLW       24
	MOVWF       main_leds_L0+3 
	MOVLW       36
	MOVWF       main_leds_L0+4 
	MOVLW       66
	MOVWF       main_leds_L0+5 
;Practica1C.c,4 :: 		ADCON1 = 0x07;
	MOVLW       7
	MOVWF       ADCON1+0 
;Practica1C.c,5 :: 		PORTC = 0;
	CLRF        PORTC+0 
;Practica1C.c,6 :: 		TRISC = 0;
	CLRF        TRISC+0 
;Practica1C.c,7 :: 		while(1){
L_main0:
;Practica1C.c,8 :: 		for(i=0; i<6; i++){
	CLRF        R1 
L_main2:
	MOVLW       6
	SUBWF       R1, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main3
;Practica1C.c,9 :: 		PORTC = leds[i];
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
;Practica1C.c,10 :: 		delay_ms(400);
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
;Practica1C.c,11 :: 		PORTC = 0;
	CLRF        PORTC+0 
;Practica1C.c,12 :: 		delay_ms(200);
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
;Practica1C.c,8 :: 		for(i=0; i<6; i++){
	INCF        R1, 1 
;Practica1C.c,13 :: 		}
	GOTO        L_main2
L_main3:
;Practica1C.c,15 :: 		}
	GOTO        L_main0
;Practica1C.c,16 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
