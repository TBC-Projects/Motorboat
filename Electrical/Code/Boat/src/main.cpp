#include <esp_now.h>
#include <WiFi.h>
#include <ESP32Servo.h>

// REPLACE WITH YOUR RECEIVER MAC Address
uint8_t broadcastAddress[] = {0xA0, 0xB7, 0x65, 0x25, 0xFB, 0x7C};
int servo_pin = 34;
Servo servo;
int x;
int y;
int position = 90;

// Structure example to send data
// Must match the receiver structure
typedef struct struct_message
{
  int a;
  int b;
} struct_message;

// Create a struct_message called myData
struct_message myData;

esp_now_peer_info_t peerInfo;

// callback when data is sent
void OnDataSent(const uint8_t mac_addr, esp_now_send_status_t status)
{
  Serial.print("\r\nLast Packet Send Status:\t");
  Serial.println(status == ESP_NOW_SEND_SUCCESS ? "Delivery Success" : "Delivery Fail");
}

void OnDataRecv(const uint8_t mac, const uint8_t *incomingData, int len)
{
  memcpy(&myData, incomingData, sizeof(myData));
  x = myData.a;
  y = myData.b;
}

void setup()
{
  // Initialize Serial Monitor
  Serial.begin(115200);

  // Set device as a Wi-Fi Station
  WiFi.mode(WIFI_STA);

  // Init ESP-NOW
  if (esp_now_init() != ESP_OK)
  {
    Serial.println("Error initializing ESP-NOW");
    return;
  }

  servo.attach(servo_pin);
  servo.write(position);

  // Once ESPNow is successfully Init, we will register for recv CB to
  // get recv packer info
  esp_now_register_recv_cb(OnDataRecv);
}

void loop()
{
  Serial.println(x + ", " + y);
  if (x < 300)
  {
    if (position >= 10)
    {
      position = position - 20;
      servo.write(position);
      delay(1);
    }
  }

  if (x > 700)
  {
    if (position <= 180)
    {
      position = position + 20;
      servo.write(position);
      delay(1);
    }
  }
  delay(500);
}