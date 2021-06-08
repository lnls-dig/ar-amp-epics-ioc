#!/bin/sh

set -e
set +u

# Parse command-line options
. ./parseCMDOpts.sh "$@"

UNIX_SOCKET=""
if [ -z "${DEVICE_TELNET_PORT}" ]; then
    UNIX_SOCKET="true"
fi

if [ -z "${ARAMP_INSTANCE}" ]; then
   ARAMP_INSTANCE="ARAmp1"
fi

set -u

# Run run*.sh scripts with procServ
if [ "${UNIX_SOCKET}" ]; then
    /usr/local/bin/procServ \
        --logfile - \
        --foreground \
        --name ${ARAMP_INSTANCE} \
        --ignore ^C^D \
        unix:./procserv.sock \
            ./runARAmp.sh "$@"
else
    /usr/local/bin/procServ \
        --logfile - \
        --foreground \
        --name ${ARAMP_INSTANCE} \
        --ignore ^C^D \
        ${DEVICE_TELNET_PORT} \
            ./runARAmp.sh "$@"
fi
