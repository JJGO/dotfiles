#!/bin/bash

source ~/.env
echo "Every day at nighttime on $(date)"
set -x

md2list /Users/josejavier/Dropbox\ \(Personal\)/checklists/*.txt