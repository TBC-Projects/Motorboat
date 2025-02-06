#include <stdio.h>
#include "esp_log.h"

void app_main(void)
{
    // Initialize UART for serial output (this is done by default in ESP-IDF)
    printf("Hello, ESP32! Text printing works!\n");

    int temp = 25;
    int humidity = 60;

    /* You can also log messages, informational or error messages to UART0, 
    the same interface for flashing firmware and accessing the serial monitor */

    //Basic Usage: Requires two arguments a tag and a message
    ESP_LOGI("MyApp", "This is an informational log.");
    ESP_LOGE("MyApp", "This is an error log.");

    //Advanced Usage: Can take a third argument, a variable
    ESP_LOGI("Weather", "The temperature is %d", temp);
    ESP_LOGE("Weather", "The humidity is %d", humidity);
}
