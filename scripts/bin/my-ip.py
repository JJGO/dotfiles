#!/Users/josejavier/.pyenv/versions/anaconda3-5.0.1/bin/python
# <bitbar.title>external-ip</bitbar.title>
# <bitbar.author>Jose Javier Gonzalez Ortiz</bitbar.author>
# <bitbar.author.github>jjgo</bitbar.author.github>
# <bitbar.desc>Gets the current external IP address.</bitbar.desc>


import requests
import json
import subprocess
import sys


def code2flag(code):
    OFFSET = 127462 - ord('A')
    code = code.upper()
    return chr(ord(code[0]) + OFFSET) + chr(ord(code[1]) + OFFSET)


def write_to_clipboard(output):
    process = subprocess.Popen(
        'pbcopy', env={'LANG': 'en_US.UTF-8'}, stdin=subprocess.PIPE)
    process.communicate(output.encode('utf-8'))


r = requests.get('http://ipinfo.io')
r = json.loads(r.content.decode())


external_ip = r['ip']

flag = code2flag(r['country'])
if r['org'] == 'AS3 Massachusetts Institute of Technology':
    if external_ip.startswith('18'):        # MIT
        flag = '🏛️'  # '📕'
    elif external_ip.startswith('128'):     # CSAIL
        flag = '🏭'  # '🔸📙'

if len(sys.argv) > 1:
    if sys.argv[1] == 'copy':
        write_to_clipboard(external_ip)
        # sys.exit(0)

# print(f"{external_ip}{flag}")
print(f"{flag}")
print("---")
print(f"External IP address: {external_ip}")
print(f"Copy External IP | terminal=false bash='{sys.argv[0]}' param1=copy")
print("---")

interfaces = [f'en{i}' for i in [1, 2, 3, 4, 5, 6, 0]] # Wireless last

for interface in interfaces:
    cmd = ['ipconfig', 'getifaddr', interface]
    p = subprocess.run(cmd, stdout=subprocess.PIPE)
    if p.returncode == 0:
        internal_ip = p.stdout.decode().strip()
        if interface == 'en0':
            print(f"Wireless IP: {internal_ip}")
        else:
            print(f"Wired IP {interface}: {internal_ip}")
