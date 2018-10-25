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

if [ -z "${DEVICE}" ]; then
    echo "Device not set. Please use -d option or set \$DEVICE environment variable" >&2
    exit 4
fi

if [ -z "$EPICS_CA_MAX_ARRAY_BYTES" ]; then
    export EPICS_CA_MAX_ARRAY_BYTES="50000000"
fi

cd "$IOC_BOOT_DIR"

ST_CMD_FILE=
# Select the appropriate ST_CMD file and
# Generate .proto from .proto.in depending on $DEVICE
case ${DEVICE} in
    50W1000DM2)
        ST_CMD_FILE=stARAmp50W1000DM2.cmd
        ;;

    75250AM2)
        ST_CMD_FILE=stARAmp75250AM2.cmd
        ;;
    75A400)
        ST_CMD_FILE=stARAmp75A400.cmd
        ;;
    *)
        echo "Invalid Device type: "${DEVICE} >&2
        exit 1
        ;;
esac

echo "Using st.cmd file: "${ST_CMD_FILE}

P="$P" R="$R" IPADDR="$IPADDR" PORT="$PORT" "$IOC_BIN" ${ST_CMD_FILE}
