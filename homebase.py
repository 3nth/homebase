#!/usr/bin/env python
import os
import sys
import subprocess

try:
    import ConfigParser as configparser
except ImportError:
    import configparser

PROJECT_ROOT_DIRECTORY = os.path.abspath(os.path.dirname(os.path.realpath(sys.argv[0])))
    
parser = configparser.SafeConfigParser()
parser.read(os.path.join(PROJECT_ROOT_DIRECTORY, 'homebase.conf'))
# check if gcc is available

# install brew
if subprocess.check_output('type -P brew', shell=True).strip() == "":
	subprocess.call('true | /usr/bin/ruby -e "$(/usr/bin/curl -fsSL https://raw.github.com/mxcl/homebrew/master/Library/Contributions/install_homebrew.rb)"', shell=True)

# update brew
subprocess.call('brew update', shell=True)

# install brews
kegs_installed = subprocess.check_output('brew list', shell=True).split()

kegs_desired = eval(parser.get('homebase', 'kegs'))
keg_opts = eval(parser.get('homebase', 'keg_opts'))

kegs_to_install = [x for x in kegs_desired if x not in kegs_installed]

if len(kegs_to_install) == 0:
	print "No kegs left to install"
else:
	for keg in kegs_to_install:
		if keg in keg_opts:
			subprocess.call('brew install ' + keg_opts[keg], shell=True)
		else:
			subprocess.call('brew install ' % keg, shell=True)


# install pips
pips_installed = subprocess.check_output('pip list', shell=True).split()

pips_desired = eval(parser.get('homebase', 'pips'))
pip_opts = eval(parser.get('homebase', 'pip_opts'))

pips_to_install = [x for x in pips_desired if x not in pips_installed and not x.startswith('(')]

if len(pips_to_install) == 0:
	print "No pips left to install"
else:
	print "pips: " + ", ".join(pips_to_install)
	for pip in pips_to_install:
		if pip in pip_opts:
			subprocess.call('pip install ' + pip_opts[pip], shell=True)
		else:
			subprocess.call('pip install ' + pip, shell=True)

subprocess.call("dotfiles -C " + os.path.join(PROJECT_ROOT_DIRECTORY, 'dotfiles', 'dotfilesrc') + " -s -f", shell=True)




