#!/usr/bin/env python3
import sys
import re
from subprocess import PIPE, run

REPO_OWNER_REGEX = '.+:([a-zA-Z\-]+)/.+'

out = run('git remote -v', shell=True, check=True, stdout=PIPE)
lines = [l.strip() for l in out.stdout.decode('utf-8').splitlines() if '(push)' in l]

to_fix = []
already_exists = set()
for line in lines:
    name, uri, _ = line.split()
    if name not in uri:
        proper_name = re.match(REPO_OWNER_REGEX, uri).group(1)
        to_fix.append((name, uri, proper_name))
    else:
        already_exists.add(name)

if not to_fix:
    print('All good!')
    sys.exit(0)

for name, uri, fixed_name in to_fix:
    run('git remote remove {}'.format(name), shell=True, check=True)
    if fixed_name in already_exists:
        print('[{}]\t{} -> {} (DELETED)'.format(uri, name, fixed_name))
    else:
        print('[{}]\t{} -> {}'.format(uri, name, fixed_name))
        already_exists.add(fixed_name)
        run('git remote add {} {}'.format(fixed_name, uri), shell=True, check=True)

