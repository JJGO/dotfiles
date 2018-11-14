#!/bin/bash

source ~/.env
echo "Every day in the morning on $(date)"
set -x

# BORG_LOG="/tmp/borg-lion-$(date -u +"%Y%m%d-%H%M%S")"
# lion-backup &> $BORG_LOG
# BORG_LOG="/tmp/borg-syl-$(date -u +"%Y%m%d-%H%M%S")"
# syl-backup &> $BORG_LOG
