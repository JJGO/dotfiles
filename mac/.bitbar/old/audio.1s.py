#!/usr/bin/env python


# Prevents Internal Speakers from working (99% of the time you don't want them to work)
# Redirects "Display Audio" and 'eqMac2' to builtin output
# Redirects DELL 25 to DELL 27

import subprocess
import os

audiodevice = os.path.expanduser('~/bin/audiodevice')


def set_output(output):
    c1 = subprocess.call([audiodevice, 'output', output])
    c2 = subprocess.call([audiodevice, 'system', output])
    if c1 == 0 and c2 == 0:
        return output
    else:
        raise ValueError()
# outputs = outputs.split('\n')
# outputs = list(set(outputs))


current_output = subprocess.check_output([audiodevice, 'output']).decode().strip('\n')
outputs = subprocess.check_output([audiodevice, 'output', 'list']).decode().strip('\n')
# index = outputs.index(current_output)


if current_output in ['Display Audio', 'eqMac2']:
    for builtin in ['Headphones', 'Internal Speakers']:
        if builtin in outputs:
            current_output = set_output(builtin)
            break
    else:
        raise ValueError("Something funky is going on")

if current_output == 'Internal Speakers':
    return_code = subprocess.call(['osascript', '-e', "set Volume 0"])

# Home Desk
if 'DELL U2717D' in outputs:
    set_output('DELL U2717D')
