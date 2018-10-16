from Tkinter import * # for gui
import matplotlib.pyplot as plt	# for plotting
from time import sleep	# just the sleep function
import re	# regular expressions
import urllib	# retrieving html data
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg # embedding pyplots into guis

# purely for debugging purposes
# 	call this function with a string input
# 	to print the string and pause the program
def pause(str):
	print(str)
	programPause = raw_input("Press the <ENTER> key to continue...")

# gets called when the quit button is hit on the gui	
def destroy():
	sys.exit()
	
def buttonClicked():
	city = variable.get()
	print "value is", city
	plotTime(city)
	
def plotTime(city):
	ax.set_ylim([0,59])
	secondsArray =[ ]
	page = pageBase + city
	for i in range(100):
		update(page,fig,ax)
		sleep(.1)

def update(page,fig,ax):
	content = urllib.urlopen(page)
	for line in content:
		match = re.search(pattern, line)
		if match is not None:
			print match.group(0)
			secondsArray.append(match.group(1))
			secPlot = ax.plot(secondsArray, 'b-')
			fig.canvas.draw()
OPTIONS = [
    "dallas",
    "boston",
    "sacramento"
]

master = Tk()
plt.ion()
fig = plt.figure()
ax = fig.add_subplot(111)
variable = StringVar(master)
variable.set(OPTIONS[0]) # default value
pageBase = "https://www.timeanddate.com/worldclock/usa/"
pattern = re.compile(r"\d{1,2}:\d{1,2}:(\d{1,2}) (am|pm)",0)
secondsArray=[]
w = apply(OptionMenu,(master, variable) + tuple(OPTIONS))
w.pack()
button = Button(master, text="plot the time", command = buttonClicked)
button.pack()
quitButton = Button(master, text="QUIT", command=destroy)
quitButton.pack(side = BOTTOM)

mainloop()
