#include <Arduino.h>
#include <ESP32Servo.h>

Servo seansServo;

void setup()
{
  seansServo.attach(18); // signal for PWM control
}

void loop()
{
  seansServo.write(90);
  delay(1000);
  seansServo.write(0);
  delay(1000);
  seansServo.write(180);
  delay(1000);
}