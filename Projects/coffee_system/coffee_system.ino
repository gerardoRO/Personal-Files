  #include <Servo.h>
#include <DallasTemperature.h>
#include <OneWire.h>

//water sensor level
const int waterSensor = 1;
int liquid_level;

//relay control for temperature
const int heaterRelay = 13;

//water temperature sensor

void setup() {
  Serial.begin(9600);
  pinMode(waterSensor,INPUT); //input of watersensor
  pinMode(heaterRelay,OUTPUT);
  digitalWrite(heaterRelay,LOW);
}


void loop() {
  liquid_level = analogRead(waterSensor);

  Serial.print("Water Value: ");
  Serial.println(liquid_level);

  delay(500);

  if(liquid_level > 200) { //if presence of water, turn on DC motor and Servo motor to 180
    digitalWrite(heaterRelay,HIGH);
  }
  else {
    digitalWrite(heaterRelay,0);
  }

}



	
