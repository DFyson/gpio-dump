gpio-dump
~~~~~~~~~
Set of scripts used for debugging the I2C interface by logging the GPIO ports and generating a plot of the SDA and SCL. 

gpio-dump.py: program for dumping GPIO state changes to a file. More info in script.
i2c-plot.py: parses the data and plots as a SVG file. More info in script.
gpio-dump.sh: run all the commands.

For monitoring i2c:
-Ran wires from a pair of GPIO ports through 10k resistors to the SDA and SCL. 
-Edited and ran the script gpio-dump.sh which would run two gpio-dump.py simultaneously, one for each port, then while they are capturing data run whichever script communicating with i2c. Once captured, data would be plotted using i2c-plot.py

Notes:
-had used ~12" of twisted pair from and ethernet cable to go from resistors to GPIO ports. This turned out to be a mistake and could see what appeared to be crosstalk from the rising on the SCL line as a 10us pulse on the SDA line. Changed to a non-twisted pair and had no more issue.
