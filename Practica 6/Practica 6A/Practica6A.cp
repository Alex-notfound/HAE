#line 1 "D:/Escritorio/Practica 6A/Practica6A.c"
char x=0;

void interrupt(){
 x=PORTB;
 INTCON.RBIF=0;
 if(PORTC.B0=1) PORTC.B0=0;
 else{
 PORTC.B0=0;
 }
}
void main() {
 PORTB=0;
 INTCON2.RBPU=0;
 x=PORTB;
 INTCON.RBIF=0;
 INTCON.RBIE=1;
 INTCON.GIE = 1;
 T0CON=0x80;
 T0CS=0;
while(1){

}

}
