#!/bin/bash

source ~/.env
echo "Every day in the morning on $(date)"
set -x

BORG_LOG="/tmp/borg-$(date -u +"%Y%m%d-%H%M%S")"
lion-backup &> $BORG_LOG
