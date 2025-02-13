#include <esp_now.h>
#include <WiFi.h>

// Callback function for when data is received
void OnDataRecv(const uint8_t *mac_addr, const uint8_t *incomingData, int len)
{
  Serial.print("Data received from ");
  for (int i = 0; i < 6; i++)
  {
    Serial.printf("%02X", mac_addr[i]);
    if (i < 5)
      Serial.print(":");
  }
  Serial.print(" -> ");
  Serial.println((char *)incomingData); // Print received message
}

void setup()
{
  Serial.begin(115200);

  // Set ESP32 as Wi-Fi station
  WiFi.mode(WIFI_STA);

  // Init ESP-NOW
  if (esp_now_init() != ESP_OK)
  {
    Serial.println("Error initializing ESP-NOW");
    return;
  }

  // Register Receive Callback
  esp_now_register_recv_cb(OnDataRecv);

  Serial.println("ESP-NOW receiver initialized. Waiting for data...");
}

void loop()
{
  delay(1000); // Keep the loop running
}
