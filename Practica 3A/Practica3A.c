     char pulsado = 0;

void main() {
     ADCON1=0x07;
     TRISB.B0=1;
     TRISB.B1=0;
     PORTB=0;
     INTCON2.B7=0;

     while(1){
              delay_ms(100);
              if((pulsado==1)&& (PORTB.B0 == 0)){
                              PORTB.B1 = !PORTB.B1;
              }
              pulsado=PORTB.B0;
     }
}