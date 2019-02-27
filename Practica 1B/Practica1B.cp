#line 1 "C:/Users/Alex/Desktop/HAE/Practica 1B/Fijo/Practica1B.c"
void main() {
 char i;
 char leds[] = {0x01,0x02,0x04,0x08,0x10,0x20,0x40,0x80};
 ADCON1 = 0x07;
 PORTC = 0;
 TRISC = 0;
 while(1){
 for(i=0; i<8; i++){
 PORTC = leds[i];
 delay_ms(400);
 PORTC = 0;
 delay_ms(200);
 }
 }
}
