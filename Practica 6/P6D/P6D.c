// Lcd pinout settings 
sbit LCD_RS at RD2_bit; 
sbit LCD_EN at RD3_bit; 
sbit LCD_D7 at RD7_bit; 
sbit LCD_D6 at RD6_bit; 
sbit LCD_D5 at RD5_bit; 
sbit LCD_D4 at RD4_bit; 
// Pin direction 
sbit LCD_RS_Direction at TRISD2_bit; 
sbit LCD_EN_Direction at TRISD3_bit; 
sbit LCD_D7_Direction at TRISD7_bit; 
sbit LCD_D6_Direction at TRISD6_bit; 
sbit LCD_D5_Direction at TRISD5_bit; 
sbit LCD_D4_Direction at TRISD4_bit;

char x;
unsigned short aux=0;
char num[4];
char primera=1;

void interrupt(){
     x = PORTB;
          INTCON.RBIF = 0;
     if(primera){
                 T0CON = 0x84;
                 primera=0;
     }
     if(x){
       TMR0H = (3036>>8);
       TMR0L = 3036;
       aux=aux+1;
       ByteToStr(aux,num);
       Lcd_out(1,1,num);
     }

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
     INTCON.RBIF = 0;   // se pone el flag a 0
     INTCON.RBIE = 1;    // se habilita la interrupción por cambio de nivel
     INTCON.TMR0IF = 0;
     INTCON.TMR0IE = 1;
     INTCON.GIE = 1;
     Lcd_Init();
     while(1);
}