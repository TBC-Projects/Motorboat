# ESP-NOW Transmitter Example

This project demonstrates how to set up an ESP32 as an ESP-NOW transmitter using the ESP-IDF framework.

## Features
- Initializes the ESP32's NVS (Non-Volatile Storage) and Wi-Fi stack.
- Configures the device as a Wi-Fi station to enable ESP-NOW communication.
- Sends data packets to a specified ESP-NOW receiver at regular intervals.
- Logs the MAC address of the receiver and the status of each transmission.

## Code Overview
The main program performs the following steps:
1. Initializes the ESP32's NVS flash to ensure proper storage operations.
2. Sets up the Wi-Fi stack in station mode.
3. Initializes the ESP-NOW protocol.
4. Registers a callback function to handle transmission status.
5. Configures the receiver's MAC address and adds it as a peer.
6. Sends data to the receiver in a loop, logging the transmission status.

### Example Output
```
I (1234) ESP-NOW: ESP-NOW transmitter initialized. Sending data... 
I (2234) ESP-NOW: Sending data: Hello from ESP-NOW transmitter! I (3234) ESP-NOW: Data sent to 3C:8A:1F:A7:36:18, status: Success
```

## Requirements
- **ESP32 Development Board**
- **ESP-IDF Framework**
- **Serial Monitor** (e.g., PlatformIO Serial Monitor, minicom, or PuTTY)

## Usage
1. Clone this repository and open the project in an ESP-IDF-compatible IDE (e.g., Visual Studio Code with PlatformIO).
2. Build and flash the program to your ESP32.
3. Open the serial monitor to view the output. (Remember, you can do this by clicking the plug icon in the bottom ribbon or using the terminal command.)

## File Breakdown
- `main.c`: Contains the program logic for initializing the ESP32, setting up ESP-NOW, and sending data.
- `CMakeLists.txt`: Configuration file for building the project.
- `sdkconfig`: Project-specific configuration for the ESP-IDF environment.

## How to Run
1. Connect your ESP32 to your computer using a USB cable.
2. Ensure the correct serial port is selected in your environment.
3. Build, flash, and monitor the project using the following command:
   ```
   idf.py build flash monitor
   ```
4. Observe the output in the serial monitor, which will display the receiver's MAC address, the data being sent, and the transmission status.

## Troubleshooting
- If data fails to send, ensure the receiver is correctly configured and powered on.
- Verify that the receiver's MAC address is accurately specified in the broadcastAddress array.
- Check that the serial monitor is configured for the correct baud rate (default: 115200).
- Ensure the ESP-IDF environment is correctly set up and your ESP32 drivers are installed.

## Notes
- Replace the placeholder MAC address in the code with the actual MAC address of your receiver.
- ESP-NOW is suitable for lightweight and low-power data transmission, making it ideal for IoT applications.
- The transmission status is logged for debugging and verification purposes.
