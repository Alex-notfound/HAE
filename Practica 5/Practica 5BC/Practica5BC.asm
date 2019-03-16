
_interrupt:

;Practica5BC.c,22 :: 		void interrupt(){
;Practica5BC.c,23 :: 		x=PORTB; // para poder borrar el bit RBIF (define x global)
	MOVF        PORTB+0, 0 
	MOVWF       _x+0 
;Practica5BC.c,24 :: 		INTCON.RBIF=0; // se borra el bit RBIF después de llamar a la función
	BCF         INTCON+0, 0 
;Practica5BC.c,26 :: 		if(primeraVez==1){
	MOVF        _primeraVez+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt0
;Practica5BC.c,27 :: 		primeraVez = 0;
	CLRF        _primeraVez+0 
;Practica5BC.c,28 :: 		Lcd_Out(1,1,"Turno: 0");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_Practica5BC+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_Practica5BC+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Practica5BC.c,29 :: 		}
L_interrupt0:
;Practica5BC.c,31 :: 		if(flag == 0){
	MOVF        _flag+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt1
;Practica5BC.c,32 :: 		if(cont ==100) cont = 0;
	MOVF        _cont+0, 0 
	XORLW       100
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt2
	CLRF        _cont+0 
L_interrupt2:
;Practica5BC.c,33 :: 		flag = 1;
	MOVLW       1
	MOVWF       _flag+0 
;Practica5BC.c,34 :: 		ByteToStr(cont,txt);
	MOVF        _cont+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       _txt+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;Practica5BC.c,35 :: 		Lcd_Out(1,6,txt);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Practica5BC.c,36 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Practica5BC.c,37 :: 		cont++;
	INCF        _cont+0, 1 
;Practica5BC.c,38 :: 		} else{
	GOTO        L_interrupt3
L_interrupt1:
;Practica5BC.c,39 :: 		flag = 0;
	CLRF        _flag+0 
;Practica5BC.c,40 :: 		}
L_interrupt3:
;Practica5BC.c,41 :: 		}
L_end_interrupt:
L__interrupt7:
	RETFIE      1
; end of _interrupt

_main:

;Practica5BC.c,43 :: 		void main() {
;Practica5BC.c,44 :: 		PORTB=0;
	CLRF        PORTB+0 
;Practica5BC.c,45 :: 		TRISB.B4 = 1;      //modo lectura
	BSF         TRISB+0, 4 
;Practica5BC.c,46 :: 		INTCON2.RBPU=0; // se habilitan las resistencias de pullup del puerto B
	BCF         INTCON2+0, 7 
;Practica5BC.c,47 :: 		x=PORTB; //para poder borrar el RBIF
	MOVF        PORTB+0, 0 
	MOVWF       _x+0 
;Practica5BC.c,48 :: 		INTCON.RBIF=0;
	BCF         INTCON+0, 0 
;Practica5BC.c,49 :: 		INTCON.RBIE=1;
	BSF         INTCON+0, 3 
;Practica5BC.c,50 :: 		INTCON.GIE = 1;
	BSF         INTCON+0, 7 
;Practica5BC.c,51 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;Practica5BC.c,52 :: 		x=PORTB; //para poder borrar el RBIF
	MOVF        PORTB+0, 0 
	MOVWF       _x+0 
;Practica5BC.c,53 :: 		INTCON.RBIF=1;
	BSF         INTCON+0, 0 
;Practica5BC.c,55 :: 		while(1);
L_main4:
	GOTO        L_main4
;Practica5BC.c,57 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
