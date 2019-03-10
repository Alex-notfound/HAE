#include  "Tecla12INT.h"

char x,key;

void interrupt(){
     key=tecla();
     x=PORTB;
     INTCON.RBIF=0;
     PORTD=key;
}

void main() {
           ADCON1=0x07;
           TRISB=0xF0;
           TRISD=0;
           PORTD=0;
           PORTB=0;
           INTCON2.RBPU=0;
           INTCON.RBIF=0;
           INTCON.RBIE=1;
           while(1){
                      x=PORTB;
                      PORTD=0x3D;
           }
}
