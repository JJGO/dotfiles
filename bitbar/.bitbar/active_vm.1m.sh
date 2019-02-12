#!/usr/bin/env bash
export vmFile="/Users/josejavier/Virtual Machines.localized/6858_Debian.vmwarevm/6858_Debian.vmx"
NUM_VMS=$($HOME/bin/vm status | sed "s/Total running VMs: //" | head -n 1)

if [ "$NUM_VMS" != "0" ]; then
    echo "VM: $NUM_VMS"
fi
