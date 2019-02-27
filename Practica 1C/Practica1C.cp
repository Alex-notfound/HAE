#line 1 "C:/Users/Alex/Desktop/HAE/Practica 1C/Practica1C.c"
void main() {
 char i;
 char leds[] = {0x81,0x42,0x24,0x18,0x24,0x42};
 ADCON1 = 0x07;
 PORTC = 0;
 TRISC = 0;
 while(1){
 for(i=0; i<6; i++){
 PORTC = leds[i];
 delay_ms(400);
 PORTC = 0;
 delay_ms(200);
 }

 }
}
