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

unsigned aux;
float tension;
char txt[14];
void interrupt(){

  aux = ADRESL + (ADRESH << 8);
  tension= 0.0048828*aux;
  PIR1.ADIF = 0;
  FloatToStr(tension, txt);
  Lcd_Cmd(_LCD_CLEAR);
  Lcd_out(1,1,txt);
  
  delay_ms(1000);
  ADCON0=0x45;

}

void main() {
  TRISA=1;
  PORTA=0;

  ADCON0= 0x41;
  ADCON1= 0xC0;

  PIR1.ADIF = 0;
  PIE1.ADIE = 1;
  INTCON.PEIE = 1;
  INTCON.GIE = 1;
  
  Lcd_Init();
  ADCON0= 0x45;

  while(1);
}