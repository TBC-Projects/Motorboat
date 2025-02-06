# ESP32 Blink Example

This project demonstrates how to use the ESP32's GPIO functionality to blink an LED using the ESP-IDF framework. The main takeaway of this is to just verify that you are able to upload a program to the ESP32

## Features
- Configures a GPIO pin as an output.
- Toggles the LED state (ON/OFF) at 1-second intervals using FreeRTOS delay functions.

## Code Overview
The main program initializes and executes:
1. GPIO configuration for the LED pin.
2. A loop that alternates the LED state every second using `gpio_set_level` and `vTaskDelay`.

### Example Behavior
- The LED connected to GPIO2 (default) blinks ON for 1 second, then OFF for 1 second, continuously.

## Requirements
- **ESP32 Development Board**
- **ESP-IDF Framework**
- **LED** (connected to GPIO2, or another pin as configured in the code, in my example I just used one of the onboard LEDs)

## Usage
1. Clone this repository and open the project in an ESP-IDF-compatible IDE (e.g., Visual Studio Code with PlatformIO).
2. Modify the `LED_PIN` definition in the code if your LED is connected to a different GPIO pin.
3. Build and flash the program to your ESP32.
4. Observe the LED blinking.

## File Breakdown
- `main.c`: Contains the program logic for configuring the GPIO and controlling the LED.
- `platformio.ini`: Platform, board, framework, and other project configurations.
- When you create your own project, additional files and folders will be initialized as part of the ESP-IDF environment.

## How to Run
1. Connect your ESP32 to your computer using a USB cable.
2. Ensure the correct serial port is selected in your environment.
3. Press the Build and then Upload button in the top right or run the following commands to build, flash, and monitor:
  ```bash
  idf.py build flash monitor
  ```
4. Watch the LED blink at 1-second intervals.

## Troubleshooting
- If the LED doesn’t blink, verify:
  - The correct GPIO pin is defined in the code (LED_PIN).
  - The LED and ESP32 are properly connected and powered.