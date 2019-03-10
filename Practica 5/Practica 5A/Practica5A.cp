#line 1 "D:/Escritorio/Prácticas HAE 18-19/HAE_6 jueves 10-30 a 12-30/Practica 5/Practica5A.c"
#line 1 "d:/escritorio/prácticas hae 18-19/hae_6 jueves 10-30 a 12-30/practica 5/tecla12int.h"
#line 25 "d:/escritorio/prácticas hae 18-19/hae_6 jueves 10-30 a 12-30/practica 5/tecla12int.h"
unsigned char tecla()
{

unsigned char columna=0, fila, aux1=0x10, aux2;

unsigned char teclado[4][3]={{49, 50, 51},{52, 53, 54},{55, 56, 57}, {42, 48, 35}};

delay_ms( 10 );

 for(fila=0; fila< 4 ; fila++)
 {
 if((PORTB&aux1)==0x00) break;
 aux1=(aux1<<1);
 }

 PORTB=0x01;

 while((PORTB& 0xF0 )!= 0xF0 )
 {
 PORTB=(PORTB<<1);
 columna++;
 }


 PORTB=0x00;

 do
 {delay_ms(2);
 }while((PORTB&0xF0)!=0xF0);



 aux2=teclado[fila][columna];
 return aux2;
}
#line 3 "D:/Escritorio/Prácticas HAE 18-19/HAE_6 jueves 10-30 a 12-30/Practica 5/Practica5A.c"
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
