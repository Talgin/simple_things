#include <Servo.h>

Servo myservo;

int pos = 0;

void setup() {
  myservo.attach(11);
  Serial.begin(9600);
  myservo.write(0);
}

void loop() {
  while(Serial.available()){
    char inputData = (char)Serial.read();
    //digitalWrite(12, LOW);
    //digitalWrite(13, LOW);
    if(inputData == '1'){
      //digitalWrite(12, HIGH);
      //digitalWrite(13, HIGH);
      for (pos = 0; pos <= 90; pos += 1){
        myservo.write(pos);
        Serial.println(pos);        
      }
      Serial.end();
      delay(10000);
      Serial.begin(9600);      
      for (pos = 90; pos >= 0; pos -= 1){
        myservo.write(pos);
        Serial.println(pos);
      }      
    }
  }
}
