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
	company = variable.get()
	print "value is", company
	plotTckr(company)
	
def plotTckr(company):
	ax.set_ylim([0,1000])
	valueArray =[ ]
	page = pageBase + company + "/real-time"
	for i in range(100):
		update(page,fig,ax)
		sleep(.1)

def update(page,fig,ax):
	content = urllib.urlopen(page)
	for line in content:
		match = re.search(pattern, line)
		if match is not None:
			print match.group(0)
			valueArray.append(match.group(1))
			ticker = ax.plot(valueArray, 'b-')
			fig.canvas.draw()
SYMBOL = ["AAPL", "MU", "AMD"]

master = Tk()
plt.ion()
fig = plt.figure()
ax = fig.add_subplot(111)
variable = StringVar(master)

variable.set(SYMBOL[0]) # default value
pageBase = "https://www.nasdaq.com/symbol/" 
pattern = re.compile(r"<div id=\"qwidget_lastsale\" class=\"qwidget-dollar\">\$(\d{2,5}.\d{2,2})",0)
valueArray=[]
w = apply(OptionMenu,(master, variable) + tuple(SYMBOL))
w.pack()
button = Button(master, text="Select Ticker", command = buttonClicked)
button.pack()
quitButton = Button(master, text="QUIT", command=destroy)
quitButton.pack(side = BOTTOM)

mainloop()
