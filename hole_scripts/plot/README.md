You can call the log reader with

``python path/to/log_reader.py -h``

You have three interaction types with the logs.

1. "minrad": This option will print the minimum radius with it's positions. I often see papers presenting only the minimum radius over time. However the position of the minimum radius might vary a lot in a simulation. 

Output format: Tab delimited file. "Time Minimum_Radius Position"

2. "frame": This option allows you to print information only from a certain time frame. Required arguments are "time". 

Output format:Tab delimited file. "Position  Radius"

3. "region": This option will allow you to calculate the average pore radius over time. This is useful for example when you want to plot the change around 9' region over time. Required arguments are "llim" (lower limit of the desired region), "ulim" (upper limit of the desired region), "step" (Time step used in calculation). 

Output format: Tab delimited file. "Time Average_Radius StdDev"

Example:

``python /path/to/stb_proteinart/hole_scripts/log_reader.py --log "/path/to/stb_proteinart/examples/log" --output minimum_radius.xvg --type minrad``

**KNOWN ISSUES**

- When outputting only a certain time frame, the script will still read through all the log files. It might take some time if you have too many log files. 

- Any file with the extension .log will be picked up.

- Script does not yet output the matrix containing all the information from all the log files. In a future update you will be able to obtain 2D plot, Time vs Position colored with pore radius.