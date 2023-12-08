# WLED LED Controller

This script controls an outdoor LED strip connected to an ESP8266 device using the WLED firmware. It turns the LEDs on and sets a random effect and palette during the nighttime, and turns them off during the daytime.

## Prerequisites
- Raspberry Pi with internet access
- ESP8266 with WLED firmware installed

## Setup
1. **Clone the Repository:**
   ```bash
   git clone git@github.com:chanthyhit/wled.git
   ```
2. Configure the Script:
Open the Outdoor.sh script in a text editor.
Update the host variable with the IP address or hostname of your ESP8266 device.
3. Test the Script:
Run the script manually to test if it controls the LEDs correctly.
   ```bash
   chmod +x Outdoor.sh
   ./Outdoor.sh
   ```
4. Set up a Cron Job:
Open the crontab editor:
  ```bash
  crontab -e
  * * * * * /path/to/your/script/Outdoor.sh
  ```

## Script Explanation
The script uses the WLED API to turn the LEDs on/off and set random effects during the nighttime.
It checks the current hour and, if it's between 5 PM and 6 AM, it turns the LEDs on and sets a random capacity, color, and effect.
During the daytime, it turns the LEDs off.
Feel free to customize the script further based on your preferences.
