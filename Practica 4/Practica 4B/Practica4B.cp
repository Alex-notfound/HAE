#line 1 "D:/Escritorio/Prácticas HAE 18-19/HAE_6 jueves 10-30 a 12-30/alexP4b/Practica4B.c"


 char i,girar = 0;
 char bobinas[]={0x03,0x02,0x04,0x09,0x03,0x04,0x08,0x09,0x01,0x03};
 char bobinas2[]={0x03,0x01,0x09,0x08,0x04,0x03,0x09,0x04,0x02,0x03};

void interrupt(){
 INTCON.INT0IF=0;
 if(girar==0){
 for(i=5;i<10;i++){
 delay_ms(200);
 PORTC=bobinas[i];

 }
 girar = 1;
 }
 else{
 for(i=0;i<10;i++){
 delay_ms(200);
 PORTC=bobinas2[i];
 }

 }
}

void main() {
 ADCON1=0x07;
 TRISB.B0=1;
 TRISC=0;
 INTCON2.INTEDG0=0;
 INTCON.INT0IF=0;
 INTCON.INT0IE=1;
 INTCON.GIE=1;
 INTCON2.RBPU=0;
 PORTB=0;
 PORTC=0;
 PORTC.B1=1;
 delay_ms(200);
 PORTC.B2=1;

 while(1){
 }
}
