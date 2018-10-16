import urllib
import re  # for reg expressions
from time import sleep
import matplotlib.pyplot as plt

plt.ion()
fig = plt.figure()
ax = fig.add_subplot(111)

city = "sacramento"
page = "https://www.timeanddate.com/worldclock/usa/" + city

secondsArray = []

for i in range(100):
	content = urllib.urlopen(page)
	pattern = re.compile(r"\d{1,2}:\d{1,2}:(\d{1,2}) (am|pm)", 0)
	for line in content:
		match = re.search(pattern, line)
		if match is not None:
			secondsArray.append(match.group(1))
			secPlot = ax.plot(secondsArray, 'b-')
			fig.canvas.draw()

	sleep(.1)
