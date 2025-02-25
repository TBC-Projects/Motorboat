#include <esp_now.h>
#include <WiFi.h>

// Structure example to receive data
// Must match the sender structure
typedef struct struct_message
{
  char a[32];
  int b;
  float c;
  bool d;
} struct_message;

// Create a struct_message called myData
struct_message myData;

// callback function that will be executed when data is received
void OnDataRecv(const uint8_t *mac, const uint8_t *incomingData, int len)
{
  /*
  Have to use memcpy as opposed to direct assignment because the data in the struct that is
  being copied via memcpy is longer than 1 byte long, (it is of variable length if you change),
  the contents of the struct), and memcpy loops through all of the bytes contained in the struct,
  (that icomingData points to the first one of).
  */
  memcpy(&myData, incomingData, sizeof(myData));
  Serial.print("Bytes received: ");
  Serial.println(len);
  Serial.print("Char: ");
  Serial.println(myData.a);
  Serial.print("Char array length: ");
  Serial.println(sizeof(myData.a));
  Serial.print("Int: ");
  Serial.println(myData.b);
  Serial.print("Int length: ");
  Serial.println(sizeof(myData.b));
  Serial.print("Float: ");
  Serial.println(myData.c);
  Serial.print("Float length: ");
  Serial.println(sizeof(myData.c));
  Serial.print("Bool: ");
  Serial.println(myData.d);
  Serial.print("Boolean length: ");
  Serial.println(sizeof(myData.d));
  Serial.println();
  /*
  Also notice that when the number of bytes of the entire struct is 44 but when we use the sizeof
  function on each of the individual variables within the struct, the total is 41 bytes. This is
  because the struct as a whole must be aligned according to the largest alignment requirement of
  its members, (which in this case is 4 bytes due to the int and float). For the boolean that is
  just 1 byte, 3 bytes of padding must be used in order to preserve alignment.
  */
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

  // Once ESPNow is successfully Init, we will register for recv CB to
  // get recv packer info
  esp_now_register_recv_cb(OnDataRecv);
}

void loop()
{
}