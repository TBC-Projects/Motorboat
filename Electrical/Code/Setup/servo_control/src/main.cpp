#include <Arduino.h>
#include <ESP32Servo.h>

#define ENCODER_CLK 15
#define ENCODER_DT 2
#define SERVO_PIN 18

Servo seansServo;
volatile int angle = 90; // Must be volatile since it's used in ISR
int lastStateCLK;
unsigned long lastDebounceTime = 0;
const int debounceDelay = 10;

/*
The function readEncoder should be declared as an interupt service routine, (ISR), because this
way the main loop, loop(), doesn't have to continuously check the encoder for changes in the
ENCODER_CLK, it automatically goes to this function when a change is detected
*/
void IRAM_ATTR readEncoder()
{
  unsigned long currentTime = millis();

  // Debounce: Ignore fast changes
  if (currentTime - lastDebounceTime > debounceDelay)
  {
    int stateCLK = digitalRead(ENCODER_CLK);

    if (stateCLK != lastStateCLK)
    {
      if (digitalRead(ENCODER_DT) != stateCLK)
      {
        angle += 20; // Clockwise
      }
      else
      {
        angle -= 20; // Counterclockwise
      }

      // Ensure angle stays between 0 and 180
      angle = constrain(angle, 0, 180);
      lastDebounceTime = currentTime;
    }
  }

  lastStateCLK = digitalRead(ENCODER_CLK);
}

void setup()
{
  Serial.begin(115200);

  pinMode(ENCODER_CLK, INPUT);
  pinMode(ENCODER_DT, INPUT);

  attachInterrupt(digitalPinToInterrupt(ENCODER_CLK), readEncoder, CHANGE);

  seansServo.attach(SERVO_PIN);
  seansServo.write(angle); // Set initial position

  lastStateCLK = digitalRead(ENCODER_CLK);
}

void loop()
{
  static int lastServoAngle = 90;

  // Only update the servo if the angle has changed
  if (angle != lastServoAngle)
  {
    seansServo.write(angle);
    lastServoAngle = angle;
    Serial.print("Servo Angle: ");
    Serial.println(angle);
  }
}
