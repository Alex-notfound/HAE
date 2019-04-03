#line 1 "C:/Users/Alex/Documents/GitHub/Practicas-de-Hardware-de-aplicacion-especifica/Practica 6/P6/P6A.c"
void interrupt(){

 INTCON.TMR0IF=0;

 if(PORTC.B0==0){
 TMR0L=106;
 T0CON=0xC1;
 }else{
 TMR0L=81;
 T0CON=0xC2;
 }
 PORTC.B0=~PORTC.B0;
}

void main(){

 TRISC.B0=0;
 PORTC=0;
 T0CON=0xC1;
 INTCON.TMR0IF=0;
 INTCON.TMR0IE=1;
 INTCON.GIE=1;
 TMR0L=106;

 while(1);
}
