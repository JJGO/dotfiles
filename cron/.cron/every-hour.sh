#!/bin/bash

source ~/.env
echo "Every hour on $(date)"
set -x


backup-outdated syl
backup-outdated lion
backup-outdated nal