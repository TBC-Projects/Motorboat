#include <esp_now.h>
#include <WiFi.h>

// Receiver MAC address (replace with actual address)
uint8_t broadcastAddress[] = {0x3C, 0x8A, 0x1F, 0xA7, 0x36, 0x18};

// Message to be sent
const char *message = "Hello from ESP-NOW sender!";

// Callback function for send status
void OnDataSent(const uint8_t *mac_addr, esp_now_send_status_t status)
{
  Serial.print("Data sent to ");
  for (int i = 0; i < 6; i++)
  {
    Serial.printf("%02X", mac_addr[i]);
    if (i < 5)
      Serial.print(":");
  }
  Serial.println(status == ESP_NOW_SEND_SUCCESS ? " Success" : " Fail");
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

  // Register send callback
  esp_now_register_send_cb(OnDataSent);

  // Register peer
  esp_now_peer_info_t peerInfo = {};
  memcpy(peerInfo.peer_addr, broadcastAddress, 6);
  peerInfo.channel = 0;
  peerInfo.encrypt = false;

  if (esp_now_add_peer(&peerInfo) != ESP_OK)
  {
    Serial.println("Failed to add peer");
    return;
  }

  Serial.println("ESP-NOW sender initialized.");
}

void loop()
{
  Serial.println("Sending data...");
  esp_err_t result = esp_now_send(broadcastAddress, (uint8_t *)message, strlen(message));

  if (result == ESP_OK)
  {
    Serial.println("Message sent successfully");
  }
  else
  {
    Serial.println("Error sending data");
  }

  delay(2000); // Wait 2 seconds before sending again
}
