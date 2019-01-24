TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = ARAmp
# ARAmp.dbd will be created and installed
DBD += ARAmp.dbd

# ARAmp.dbd will be made up from these files:
ARAmp_DBD += base.dbd

# Include dbd files from all support applications:
ARAmp_DBD += stream.dbd
ARAmp_DBD += drvAsynIPPort.dbd
ARAmp_DBD += asSupport.dbd
ARAmp_DBD += calcSupport.dbd

# Add all the support libraries needed by this IOC
ARAmp_LIBS += stream
ARAmp_LIBS += asyn
ARAmp_LIBS += autosave
ARAmp_LIBS += calc

# ARAmp_registerRecordDeviceDriver.cpp derives from ARAmp.dbd
ARAmp_SRCS += ARAmp_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
ARAmp_SRCS_DEFAULT += ARAmpMain.cpp
ARAmp_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#ARAmp_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
ARAmp_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

