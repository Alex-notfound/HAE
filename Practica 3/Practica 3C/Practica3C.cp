#line 1 "C:/Users/Alex/Desktop/HAE/Practica 3C/Practica3C.c"
char numeros[] = {0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x67};
char unidades=0x3F,decenas=0x3F,i=0;

void interrupt(){
 INTCON.INT0IF=0;
 if(i<100){

 i++;
 }else{
 i=0;
 }
 unidades=numeros[i%10];
 decenas=numeros[i/10];

}

void main() {
 ADCON1=0x07;
 TRISB.B0=1;
 TRISA.B0=0;
 TRISA.B1=0;
 PORTB=0;
 PORTA.B0=0;
 PORTA.B1=0;
 TRISD=0;
 PORTD=0;
 INTCON2.INTEDG0=0;
 INTCON.INT0IF=0;
 INTCON.INT0IE=1;
 INTCON.GIE=1;
 INTCON2.B7=0;


 while(1){
 PORTD=unidades;
 PORTA.B0=0;
 delay_ms(20);
 PORTA.B0=1;

 PORTD=decenas;
 PORTA.B1=0;
 delay_ms(20);
 PORTA.B1=1;
 }
}
