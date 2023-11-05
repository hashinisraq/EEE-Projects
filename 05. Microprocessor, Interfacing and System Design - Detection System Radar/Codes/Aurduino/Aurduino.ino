// Includes the Servo library
#include <Servo.h>
Servo myServo; // Creates a servo object for controlling the servo motor

// Defines Tirg and Echo pins of the Ultrasonic Sensor
const int trigPin = 10;
const int echoPin = 11;

// Variables for the duration and the distance
long duration;
int distance;


void setup() {
  pinMode(trigPin, OUTPUT); // Sets the trigPin as an Output
  pinMode(echoPin, INPUT); // Sets the echoPin as an Input
  Serial.begin(9600);
  myServo.attach(12); // Defines on which pin is the servo motor attached
}

void loop() {
  // rotates the servo motor from 0 to 180 degrees 
  for(int i=0;i<=180;i++){  
  myServo.write(i); // servo motor angle
  delay(20);
  distance = calculateDistance();// Calls a function for calculating the distance measured by the Ultrasonic sensor for each degree
  
  Serial.print(i); // Sends the current degree into the Serial Port
  Serial.print(","); // Sends addition character right next to the previous value needed later in the Processing IDE for indexing
  Serial.print(distance); // Sends the distance value into the Serial Port
  Serial.print("."); // Sends addition character right next to the previous value needed later in the Processing IDE for indexing
  }

  // Repeats the previous rotates from 180 to 0 degrees
  for(int i=180;i>0;i--){  
  myServo.write(i);
  delay(20);
  distance = calculateDistance();
  Serial.print(i);
  Serial.print(",");
  Serial.print(distance);
  Serial.print(".");
  }
}

// Function for calculating the distance measured by the Ultrasonic sensor
int calculateDistance(){ 
  // the trigPin is set to LOW with a delay of 2 microseconds to ensure a clean signal
  digitalWrite(trigPin, LOW); 
  delayMicroseconds(2);

  // The trigPin is set to HIGH for 10 microseconds, which triggers the ultrasonic sensor to emit a sonic pulse
  digitalWrite(trigPin, HIGH); 
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);

  // pulseIn buildin function waits for the sound pulse to be returned to the ultrasonic sensor and it waits until the echoPin change its state to HIGH and then it measures the duration of that pulse
  // The echoPin reads the signal from the sensor, which indicates the time it took for the pulse to bounce back. This time is stored in the duration variable
  duration = pulseIn(echoPin, HIGH);
  
  
  // distance = duration * speed of sound / 2
  // The speed of sound in air in cm/microsecond = 0.034 cm/microsecond
  // The division by 2 accounts for the fact that the pulse had to travel to the object and back
  distance= duration*0.034/2;

  return distance;
}