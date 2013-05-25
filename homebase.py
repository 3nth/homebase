#!/usr/bin/env python
import os
import subprocess

try:
    import ConfigParser as configparser
except ImportError:
    import configparser
    
parser = configparser.SafeConfigParser()
parser.read('homebase.conf')
# check if gcc is available

# install brew
#subprocess.call('ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"', shell=True)

# update brew
subprocess.call('brew update', shell=True)

kegs_installed = subprocess.check_output('brew list', shell=True).split()

kegs_desired = eval(parser.get('homebase', 'kegs'))

kegs_to_install = [x for x in kegs_desired if x not in kegs_installed]

if len(kegs_to_install) == 0:
	print "No kegs left to install"
else:
	for keg in kegs_to_install:
		subprocess.call('brew install ' % keg, shell=True)

pips_installed = subprocess.check_output('pip list', shell=True).split()

pips_desired = eval(parser.get('homebase', 'pips'))

pips_to_install = [x for x in pips_desired if x not in pips_installed and not x.startswith('(')]

if len(pips_to_install) == 0:
	print "No pips left to install"
else:
	print "pips: " + ", ".join(pips_to_install)
	for pip in pips_to_install:
		subprocess.call('pip install ' + pip, shell=True)

# install git

# test for git



