void interrupt(){
     
     INTCON.TMR0IF=0; //pone flag Timer0 a 0
     
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
     
     TRISC.B0=0; //indica que los puertos RC son de salida
     PORTC=0; //borra los valores almacenados en los puertos RC
     T0CON=0xC1;
     INTCON.TMR0IF=0; //pone flag Timer0 a 0
     INTCON.TMR0IE=1; //habilita interrupcion Timer0
     INTCON.GIE=1; //habilita interrupciones (general)
     TMR0L=106;
     
     while(1);
}