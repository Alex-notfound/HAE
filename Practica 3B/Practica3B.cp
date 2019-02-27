#line 1 "C:/Users/Alex/Desktop/HAE/Practica 3B/Practica3B.c"
void interrupt(){
 INTCON.INT0IF=0;
 PORTB.B1=!PORTB.B1;
}

void main() {
 ADCON1=0x07;
 TRISB.B0=1;
 TRISB.B1=0;
 PORTB=0;
 INTCON2.INTEDG0=0;
 INTCON.INT0IF=0;
 INTCON.INT0IE=1;
 INTCON.GIE=1;
 INTCON2.B7=0;
 while(1){
 }
}
