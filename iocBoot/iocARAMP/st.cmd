#!../../bin/linux-x86_64/ARAMP

## You may have to change ARAMP to something else
## everywhere it appears in this file

< envPaths

cd "${TOP}"

epicsEnvSet("STREAM_PROTOCOL_PATH", "$(TOP)/ARAMPApp/Db")

## Register all support components
dbLoadDatabase "dbd/ARAMP.dbd"
ARAMP_registerRecordDeviceDriver pdbbase

drvAsynIPPortConfigure("AMPPORT", "${DEVICE_IP}:${DEVICE_PORT}",0,0,0)

## Load record instances
dbLoadRecords("${TOP}/ARAMPApp/Db/aramp.db", "P=${P}, R=${R}, PORT=AMPPORT")

cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncxxx,"user=rootHost"
