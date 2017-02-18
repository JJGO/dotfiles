import re

def latex_substitute(file, out=None):

    with open(file, 'r') as f:
        s = f.read()
    s = s.replace('{','{{')
    s = s.replace('}','}}')
    varnames = re.findall('{{(\w+):.\df}}', s)
    d = dict(((k, eval(k)) for k in varnames))
    s = re.sub('{{(\w+:.\df)}}', r' {\1} ', s)
    s = s.format(**d)
    s = s.replace('(\d)%',r'\1\%')
    s = re.sub('e\+0(\d)', r' $\\times 10^{\1}$', s)
    if out:
        with open(out, 'w') as f:
            print(s, file=f)
    return s