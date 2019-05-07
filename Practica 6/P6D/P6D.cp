#line 1 "C:/Users/curra/Documents/GitHub/Practicas-de-Hardware-de-aplicacion-especifica/Practica 6/P6D/P6D.c"

sbit LCD_RS at RD2_bit;
sbit LCD_EN at RD3_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;

sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD4_bit;

char x;
unsigned short contador=0;
char num[4];

void interrupt(){
 x = PORTB;
 if(INTCON.RBIF){
 T0CON.TMR0ON=1;

 TMR0L=6;
 }
 if(INTCON.TMR0IF){
 PORTC.B0=!PORTC.B0;
 contador++;
 }
 if(!x){

 ByteToStr(contador,num);
 Lcd_out(1,1,num);
 T0CON.TMR0ON=0;
 }
 INTCON.RBIF = 0;
 INTCON.TMR0IF = 0;
}

void main() {
 ADCON1=0x07;
 PORTB=0;
 PORTD=0;
 TRISD=0;
 TRISB.B4=1;

 RCON.IPEN = 0;
 x = PORTB;
 INTCON.RBIF = 0;
 INTCON.RBIE = 1;
 T0CON=0x41;
 INTCON.TMR0IF = 0;
 INTCON.TMR0IE = 1;
 INTCON.GIE = 1;
 Lcd_Init();
 while(1) asm nop;
}
