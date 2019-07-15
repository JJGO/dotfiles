#!/usr/bin/env python
# -*- coding: utf-8 -*-

# <bitbar.title>Borg outdated</bitbar.title>
# <bitbar.author>Jose Javier Gonzalez Ortiz</bitbar.author>
# <bitbar.author.github>jjgo</bitbar.author.github>
# <bitbar.desc>Checks how many outdated repos there are.</bitbar.desc>


import subprocess
import os
import datetime

try:
    from subprocess import DEVNULL # py3k
except ImportError:
    DEVNULL = open(os.devnull, 'wb')


class color:
    MAGENTA     = '\033[95m'
    CYAN        = '\033[96m'
    DARKCYAN    = '\033[36m'
    BLUE        = '\033[94m'
    GREEN       = '\033[92m'
    GRASS       = '\033[32m'
    ORANGE      = '\033[93m'
    YELLOW      = '\033[33m'
    RED         = '\033[91m'
    FADERED     = '\033[31m'
    BOLD        = '\033[1m'
    UNDERLINE   = '\033[4m'
    END         = '\033[0m'


BORG = '/usr/local/bin/borg'
BORG_BACKUP = '/Users/josejavier/bin/backup-outdated'

BORG_REPOS = {
    'lion': 'lion-bk:/mnt/disk/cpm',
    'syl':  '/Volumes/Data/cpm',
    # 'iroh': 'iroh-bk:/mnt/holo/cpm',
    'nal':  'nal-bk:/mnt/polar/borg/cpm',
}


def outdated_days(last_version):
    line = last_version#.strip().split('\n')[-1]
    version = line.split(' ')[0]
    timestamp = version[version.index("-")+1:]
    date = timestamp.split('T')[0]
    last = datetime.datetime.strptime(date+"T07:59:00", "%Y-%m-%dT%H:%M:%S")
    now = datetime.datetime.now()
    days = (now-last).days
    return days


if __name__ == '__main__':

    repo_state = {}

    for reponame, repopath in BORG_REPOS.items():

        last_file = "/tmp/borg-last-"+reponame
        if os.path.isfile(last_file):
            with open(last_file, 'r') as f:
                last_version = f.read().strip()
            if "not reachable" in last_version:
                repo_state[reponame] = "unreachable"
            else:
                days_since = outdated_days(last_version)
                repo_state[reponame] = days_since

        else:
            repo_state[reponame] = "unknown"

    up_to_date_repos = sum(1 for s in repo_state.values() if isinstance(s, int) and s <= 0 )
    print("B:{}/{}".format(up_to_date_repos, len(BORG_REPOS)))

    print('---')

    for reponame, state in repo_state.items():

        if isinstance(state, str):
            print("{} is {} | color=orange | bash={} param1={} terminal=false refresh=true".format(reponame, state, BORG_BACKUP, reponame))
        elif state <= 0:
            print("{} is up to date | color=green | bash={} param1={} terminal=false refresh=true".format(reponame, BORG_BACKUP, reponame))
        elif state > 0:
            print("{} is {} days outdated | color=red | bash={} param1={} terminal=false refresh=true".format(reponame, state, BORG_BACKUP, reponame))
