#!/usr/bin/env python
# -*- coding: utf-8 -*-

# <bitbar.title>brew outdated</bitbar.title>
# <bitbar.author>Jose Javier Gonzalez Ortiz</bitbar.author>
# <bitbar.author.github>jjgo</bitbar.author.github>
# <bitbar.desc>Checks how many outdated packages there are.</bitbar.desc>

import argparse
import datetime
from glob import glob
import os
import subprocess
import sys

BREW = '/usr/local/bin/brew'

BREW_UPDATE_CMD = [BREW, 'update']
BREW_OUTDATED_CMD = [BREW, 'outdated']
CASK_OUTDATED_CMD = [BREW, 'outdated', '--cask']
BREW_UPGRADE = [BREW, 'upgrade']
CASK_UPGRADE = [BREW, 'cask', 'upgrade']
BREW_CLEANUP = [BREW, 'cleanup', '-s']

FIXED_FORMULA = ['mkvtoolnix', 'bitbar']
FIXED_CASK = ['wifi-explorer', 'filebot', 'eqmac', 'bitbar']

parser = argparse.ArgumentParser(description='Brew updater')
parser.add_argument('-u', '--upgrade', dest='upgrade', action='store_true')
parser.add_argument('-c', '--copy', dest='copy', default=None)
parser.add_argument('formulas', nargs='*', default=None, help='Formulas to upgrade')


def get_outdated():

    s = subprocess.check_output(BREW_UPDATE_CMD)

    outdated = subprocess.check_output(BREW_OUTDATED_CMD).decode()
    if len(outdated) > 0:
        outdated = [line.split(' ')[0] for line in outdated.strip().split('\n')]
        outdated = [i for i in outdated if i not in FIXED_FORMULA]
    else:
        outdated = []

    outdated_cask = subprocess.check_output(CASK_OUTDATED_CMD).decode()
    if len(outdated_cask) > 0:
        outdated_cask = [line.split(' ')[0] for line in outdated_cask.strip().split('\n')]
        outdated_cask = [i for i in outdated_cask if i not in FIXED_CASK]
    else:
        outdated_cask = []

    return outdated, outdated_cask


def write_to_clipboard(output):
    process = subprocess.Popen(
        'pbcopy', env={'LANG': 'en_US.UTF-8'}, stdin=subprocess.PIPE)
    process.communicate(output.encode('utf-8'))


if __name__ == '__main__':

    SELF = sys.argv[0]
    args = parser.parse_args()

    if args.upgrade:

        outdated_formulas = args.formulas
        if outdated_formulas is None:
            outdated_formulas = get_outdated()[0]
        print(outdated_formulas)
        now = datetime.datetime.now().strftime("%Y%m%d-%H%M%S")
        logfile = '/tmp/brew-upgrade-{}'.format(now)
        with open(logfile, 'w') as out:
            out.write("UPDATING FORMULAS\n")
            out.write('-----------------\n')
            for f in outdated_formulas:
                out.write(f+'\n')
            out.write('-----------------\n')
            subprocess.call(BREW_UPGRADE + outdated_formulas, stdout=out, stderr=out)
            subprocess.call(BREW_CLEANUP, stdout=out, stderr=out)

        to_remove = glob('/tmp/brew-upgrade-*')
        print(to_remove)
        for p in to_remove:
            if p != logfile:
                os.remove(p)

    elif args.copy is not None:
        cmd = args.copy
        cmd = cmd.replace('!', ' ')
        write_to_clipboard(cmd)

    else:
        outdated, outdated_cask = get_outdated()

        if len(outdated+outdated_cask) > 0:
            print('U:{}'.format(len(outdated) + len(outdated_cask)))
        else:
            print(' ')

        if len(outdated) > 0:
            print('---')
            print('Update All | bash={} param1=--upgrade refresh=true terminal=false'.format(SELF))

            print('---')
            for formula in outdated:
                print('{} | bash={} param1=--upgrade param2={} refresh=true terminal=false'.format(formula, SELF, formula))
            cmd = 'brew upgrade ' + ' '.join(outdated)
            cmd = cmd.replace(' ', '!')
            print("Copy upgrade cmd | terminal=false bash={} param1=--copy param2={}".format(SELF, cmd))

        if len(outdated_cask) > 0:
            print('---')
            for cask in outdated_cask:
                print(cask)
            cmd = 'brew cask upgrade ' + ' '.join(outdated_cask)
            cmd = cmd.replace(' ', '!')
            print("Copy upgrade cask cmd | terminal=false bash={} param1=--copy param2={}".format(SELF, cmd))
