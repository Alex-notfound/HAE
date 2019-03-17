char x=0;

void interrupt(){
  x=PORTB; // para poder borrar el bit RBIF (define x global)
  INTCON.RBIF=0; // se borra el bit RBIF después de llamar a la función
  if(PORTC.B0=1) PORTC.B0=0;
  else{ 
        PORTC.B0=0;
  }
}
void main() {
  PORTB=0;
  INTCON2.RBPU=0; // se habilitan las resistencias de pullup del puerto B
  x=PORTB; //para poder borrar el RBIF
  INTCON.RBIF=0;
  INTCON.RBIE=1;
  INTCON.GIE = 1;
while(1){

}

}