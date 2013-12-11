#!/usr/bin/env python
import os
import sys
import subprocess

config_file = '~/.kegstand'

print('Updating brew...')
subprocess.call('brew update', shell=True)

# install brews
kegs_installed = subprocess.check_output('brew list', shell=True).split()
kegs_desired = [line.rstrip('\n') for line in open(os.path.expanduser(config_file))]
kegs_to_install = [x for x in kegs_desired if x.split(' ')[0] not in kegs_installed]

if len(kegs_to_install) == 0:
    print "No kegs left to install."
else:
    for keg in kegs_to_install:
        print('Installing "%s"' % keg)
        subprocess.call('brew install %s' % keg, shell=True)
