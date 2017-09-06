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

# Specify save file path
set_savefile_path("$(TOP)", "autosave")
set_requestfile_path("iocBoot/iocARAMP")

# Enable/Disable backup files (0->Disable, 1->Enable)
save_restoreSet_DatedBackupFiles(0)

# Number of copies of .sav files to maintain
save_restoreSet_NumSeqFiles(0)

cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs

# Start autosave
#create_monitor_set("auto_settings.req", 30, "P=${P}, R={R}")
