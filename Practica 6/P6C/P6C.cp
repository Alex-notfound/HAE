#line 1 "D:/Escritorio/Prácticas HAE 18-19/HAE_6 jueves 10-30 a 12-30/P6C/P6C.c"
int contador = 0;
void interrupt(){
 if(INTCON3.INT1IF){
 PORTC.B0 = 1;
 contador = 0;
 T0CON = 0x84;
 TMR0H = (3036>>8);
 TMR0L = 3036;
 }
 if(INTCON.TMR0IF){
 TMR0H = (3036>>8);
 TMR0L = 3036;
 contador++;
 if(contador == 3){
 PORTC.B0 = 0;
 }
 }
 INTCON3.INT1IF = 0;
 INTCON.TMR0IF = 0;
}
void main() {
 ADCON1=0x07;
 TRISB.B1=1;
 TRISC=0;
 PORTC.B0=0;
 INTCON2.INTEDG1= 1;
 INTCON3.INT1IF = 0;
 INTCON3.INT1IE = 1;
 INTCON.TMR0IF = 0;
 INTCON.TMR0IE = 1;
 INTCON.GIE = 1;

 while(1);
}
