#line 1 "C:/Documents and Settings/Electrónica/Escritorio/P7B/P7B.c"

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

unsigned int x = 0;
float aux;
char txt[15];

void interrupt(){
 if(INTCON.TMR0IF && INTCON.TMR0IE){
 INTCON.TMR0IF = 0;
 TMR0H = (18661>>8);
 TMR0L = 18661;
 ADCON0.GO = 1;

 }
 if(PIR1.ADIF && PIE1.ADIE){
 PIR1.ADIF = 0;
 x = ADRESL;
 x = x+(ADRESH<<8);
 aux = x*(500.0/1023.0);
 FloatToStr(aux,txt);
 Lcd_Cmd(_LCD_CLEAR);
 LCD_OUT(1,1,txt);
 }
}

void main() {
 TRISE.B1=1;
 PORTC=0;
 T0CON=0x95;
 ADCON0=0x71;
 ADCON1=0xC0;

 INTCON.TMR0IF = 0;
 INTCON.TMR0IE = 1;
 INTCON.GIE = 1;
 TMR0H = (18661 >> 8);
 TMR0L = 18661;

 PIR1.ADIF = 0;
 PIE1.ADIE = 1;
 INTCON.PEIE = 1;

 Lcd_Init ();
 while(1);
}
