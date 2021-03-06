< envPaths
epicsEnvSet("TOP", "../..")
< ARAmp.config

####################################################

epicsEnvSet("STREAM_PROTOCOL_PATH", "$(TOP)/ARAmpApp/Db")

## Register all support components
dbLoadDatabase("$(TOP)/dbd/ARAmp.dbd",0,0)
ARAmp_registerRecordDeviceDriver pdbbase

drvAsynIPPortConfigure("AMPPORT", "$(IPADDR):$(PORT)",0,0,0)

## Load record instances
dbLoadRecords("${TOP}/db/ARAmp75A400.db", "P=$(P), R=$(R), PORT=AMPPORT")

< save_restore.cmd

iocInit

## Start any sequence programs
# No sequencer program

# Create periodic trigger for Autosave
create_monitor_set("auto_settings_ARAmp75A400.req", 5, "P=${P}, R=${R}")
set_savefile_name("auto_settings_ARAmp75A400.req", "auto_settings_${P}${R}.sav")
