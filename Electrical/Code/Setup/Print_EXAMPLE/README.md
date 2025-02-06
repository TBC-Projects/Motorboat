# ESP32 Print and Logging Example

This project demonstrates how to use the ESP32's serial output to print messages and log information using ESP-IDF.

## Features
- Prints a simple message using `printf`.
- Logs informational and error messages using `ESP_LOGI` and `ESP_LOGE`.

## Code Overview
The main program initializes and outputs:
1. A simple message to the serial monitor using `printf`.
2. Informational and error logs with the ESP-IDF logging macros.

### Example Output

- Hello, ESP32! Text printing works!
- MyApp: This is an informational log
- MyApp: This is an error log
- Weather: The temperature is 25
- Weather: The humidity is 60

## Requirements
- **ESP32 Development Board**
- **ESP-IDF Framework**
- **Serial Monitor** (e.g., PlatformIO Serial Monitor, minicom, or PuTTY)

## Usage
1. Clone this repository and open the project in an ESP-IDF-compatible IDE (e.g., Visual Studio Code with PlatformIO).
2. Build and flash the program to your ESP32.
3. Open the serial monitor to view the output.

## File Breakdown
- `main.c`: Contains the program logic for printing and logging messages.
- `platformio.ini`: platform, board, framework, etc. declaration
- When you make your own project there will be a variety of other files/folders that will be initialized as well

## How to Run
1. Connect your ESP32 to your computer using a USB cable.
2. Ensure the correct serial port is selected in your environment.
3. Press the Build and then Upload button in the top right or run the following commands to build, flash, and monitor:
  ```bash
  idf.py build flash monitor
  ```
4. Observe the output in the serial monitor, (click the small plug icon in the bottom bar of your screen)

## Troubleshooting
- If logs or messages don’t appear, verify the serial monitor is configured for the correct baud rate (default: 115200), this should be manually done in the platformio.ini file provided.
- Ensure your ESP32 is properly connected and powered.
