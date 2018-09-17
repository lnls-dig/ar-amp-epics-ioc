#!/bin/sh

set -e
set +u

# Source environment
. ./checkEnv.sh

# Parse command-line options
. ./parseCMDOpts.sh "$@"

# Check last command return status
if [ $? -ne 0 ]; then
	echo "Could not parse command-line options" >&2
	exit 1
fi

if [ -z "$IPADDR" ]; then
    echo "\$IPADDR is not set, Please use -i option" >&2
    exit 2
fi

if [ -z "$PORT" ]; then
    echo "\$CARRIER_GEN is not set, Please use -p option" >&2
    exit 3
fi

if [ -z "$EPICS_CA_MAX_ARRAY_BYTES" ]; then
    export EPICS_CA_MAX_ARRAY_BYTES="50000000"
fi

cd "$IOC_BOOT_DIR"

P="$P" R="$R" IPADDR="$IPADDR" PORT="$PORT" "$IOC_BIN" stARAmp.cmd
