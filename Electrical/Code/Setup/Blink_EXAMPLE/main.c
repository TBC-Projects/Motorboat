#include "freertos/FreeRTOS.h" //Allows us to use vTaskDelay and pdMS_TO_TICKS
#include "freertos/task.h" //Not strictly required based on your freertos/FreeRTOS header file and environment
#include "driver/gpio.h" // GPIO driver header

#define LED_PIN GPIO_NUM_2 // Update to your own LED pin if necessary

void app_main() {
    // Reset and configure the GPIO pin
    gpio_reset_pin(LED_PIN); 
    gpio_set_direction(LED_PIN, GPIO_MODE_OUTPUT);

    while (true) {
        gpio_set_level(LED_PIN, 1); // Turn LED on
        vTaskDelay(pdMS_TO_TICKS(1000)); // Delay 1 second
        gpio_set_level(LED_PIN, 0); // Turn LED off
        vTaskDelay(pdMS_TO_TICKS(1000)); // Delay 1 second
    }
}
