#!/usr/bin/python

#this script will rename all the xcode wdlce.pbxuser user settings to yourosxusername.pbxproj to provide the default debugging setup

import os, getpass, glob, shutil
 
path = os.path.dirname(os.path.realpath(__file__))
username = getpass.getuser()

for r,d,f in os.walk(path):
    for files in f:
        if files.endswith(".pbxuser"):
        	noext = os.path.splitext(files)[0]
        	if noext == "wdlce":
        		shutil.copy(os.path.join(r, files), os.path.join(r, username + ".pbxuser"))