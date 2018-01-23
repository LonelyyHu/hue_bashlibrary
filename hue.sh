#!/bin/bash

# Demo for Hue BashLibrary (hue_bashlibrary.sh)
# Written 2013 by Markus Proske, released under GNU GENERAL PUBLIC LICENSE v2, see LICENSE 
# Google+: https://plus.google.com/+MarkusProske
# Github: https://github.com/markusproske/hue_bashlibrary
# -----------------------------------------------------------------------------------------


# Note: this library relies on curl to be installed on your system.
# Type which curl or curl --help in your Terminal to see if it is installed
# If not, install with sudo apt-get install curl 


# import my hue bash library
source hue_bashlibrary.sh


# CONFIGURATION
# -----------------------------------------------------------------------------------------

# Mind the gap: do not change the names of these variables, the bash_library needs those...

ip='192.168.7.149'								# IP of hue bridge
devicetype='SIT'						# Link with bridge: type of device
username='37a78eab14706f0f37f5c3b32b5eb097'						# Link with bridge: username / app name
loglevel=1									# 0 all logging off, # 1 gossip, # 2 verbose, # 3 errors


# Variables of this scripts
lights='3 4'								# Define the lights you want to use, e.g. '3' or '3 4' or '3 4 7 9'




# PROGRAM FUNCTIONS
# -----------------------------------------------------------------------------------------

function usage {
	# cmdname is defined in the library
	echo "Usage: $cmdname -onoff on|off light"
	echo "Usage: $cmdname -get light"
	# HSL stands for hue, saturation, and lightness (or luminosity)
	echo "Usage: $cmdname -color hue(0-65535) saturation(0-255) brightness(0-255) light"
	echo "Usage: $cmdname -alert light"
}



# MAIN
# -----------------------------------------------------------------------------------------

# store name of command for usage and log
# cmdname is defined in the library
cmdname=`basename "$0"`


# very simple argument processing
if [[ $# > 0 ]]
	then 
	# valid number of arguments
	if [[ $1 == "-onoff" ]]
	then
		hue_onoff $2 $3
	elif [[ $1 == "-get" ]]
	then
		hue_getstate $2
	elif [[ $1 == "-color" ]]
	then
		hue_on_hue_sat_brightness $2 $3 $4 $5
	elif [[ $1 == "-alert" ]]
	then
		hue_alert on $2
	else
		usage	
	fi
	
	echo		# force new line
	exit
else 
	if (( $# < 1 )) 
	then
		# more than one argument, show usage
		usage
		echo
		exit
	fi
fi 


# no arguments


# demo mode, call function demo with the lights 3 and 4
#hue_demo $lights

# hue_onoff "on" 3
# hue_is_on 3
# echo "Result variable is: $result_hue_is_on"

