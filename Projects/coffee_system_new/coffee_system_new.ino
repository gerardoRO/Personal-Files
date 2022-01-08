#include <OneWire.h>
#include <DallasTemperature.h>
#include <Servo.h>


//PWM pins:
//2: for the heating relay
//3: for the temperature probe
//4: for stirring relayx
//5: for the servo 

//Analog in pins:
//8: for the water sensor

//Power supply, 5V provided to circuit

bool system_has_run;
bool system_has_not_run;

//Define Temperature object to collect and report data in C
#define temp_probe 3
OneWire oneWire(temp_probe);
DallasTemperature temp_sensor(&oneWire);
double temperature =0.0;
int temp_threshold = 20;

//Define Servo object and define position integer values
Servo myservo; //create servo object
int servo_pin = 5;

//Define DC motor
const int stirrer = 6;

//Define water level sensors and analog input value
int water_probe = 8;
int water_threshold = 200;
int waterLevel = 1;

//Define heater relay (commented out for safety purposes while testing)s
const int heaterRelay = 2; 

void setup() { //On setup, servo will reset to 180' and relay to OFF.
  Serial.begin(9600);
  temp_sensor.begin();
  myservo.attach(servo_pin);
  myservo.write(180);
  pinMode(heaterRelay,OUTPUT);
  pinMode(stirrer, OUTPUT);
  
  digitalWrite(heaterRelay,LOW);
  digitalWrite(stirrer,LOW);

  system_has_run = false;
  system_has_not_run = true;
}

void loop() {

  waterLevel = analogRead(water_probe); // read water level
  
  if ((!system_has_run) && (waterLevel > water_threshold)){ //only run the system once per power cycle
    Serial.println("Water detected, Initializing system...");
    digitalWrite(heaterRelay,HIGH); // turn on heating system
    
    while(temperature < temp_threshold) {
      temp_sensor.requestTemperatures();
      temperature = temp_sensor.getTempCByIndex(0); //obtain temperature
      
      Serial.println("Heating. Current Temp: " + String(temperature));
      delay(1000);
    }
    
    Serial.println("Desired temperature reached, pouring coffee and stirring...");
    digitalWrite(heaterRelay,LOW);
    myservo.write(40);
    delay(2000);
    digitalWrite(stirrer,HIGH);

    system_has_not_run = false;
    myservo.write(180);
    Serial.println("DONE!");
  }

  if (!system_has_not_run){ //once system has run, turn to true that it has run
    system_has_run = true;

  }
  else {
    Serial.println("Water level:  " + String(waterLevel));
    delay(1000);
  }
}
