program_name='system-variables'

#if_not_defined __SYSTEM_VARIABLES__
#define __SYSTEM_VARIABLES__

#include 'system-devices'
#include 'system-structures'
#include 'system-constants'

/*
 * -------------------------------------------------------------------
 * Global Variable Declarations
 * -------------------------------------------------------------------
 */

define_variable

/*
 * --------------------
 * Device arrays
 * --------------------
 */


// Override the DEV array within dvx-listener
dev dvDvxMainPorts[] = {dvDvxMain}

dev dvDvxVidOutPorts[] = 
{
	dvDvxVidOut1,
	dvDvxVidOut2,
	dvDvxVidOut3,
	dvDvxVidOut4
}

dev dvDvxVidInPorts[] =
{
	dvDvxVidIn1,
	dvDvxVidIn2,
	dvDvxVidIn3,
	dvDvxVidIn4,
	dvDvxVidIn5,
	dvDvxVidIn6,
	dvDvxVidIn7,
	dvDvxVidIn8,
	dvDvxVidIn9,
	dvDvxVidIn10
}

dev dvDvxAudOutPorts[] = 
{
	dvDvxAudOut1,
	dvDvxAudOut2,
	dvDvxAudOut3,
	dvDvxAudOut4
}

dev dvDvxAudInPorts[] = 
{
	dvDvxAudIn1,
	dvDvxAudIn2,
	dvDvxAudIn3,
	dvDvxAudIn4,
	dvDvxAudIn5,
	dvDvxAudIn6,
	dvDvxAudIn7,
	dvDvxAudIn8,
	dvDvxAudIn9,
	dvDvxAudIn10
}



// Override the DEV arrays within dxlink-listener
dev dvDxlinkTxMainPorts[] = 
{
	dvTxTable1Main,
	dvTxTable2Main, 
	dvTxTable3Main, 
	dvTxTable4Main
}

dev dvDxlinkTxDigitalVideoInPorts[] = 
{
	dvTxTable1VidInDigital, 
	dvTxTable2VidInDigital, 
	dvTxTable3VidInDigital, 
	dvTxTable4VidInDigital
}

dev dvDxlinkTxAudInPorts[] = 
{
	dvTxTable1AudIn, 
	dvTxTable2AudIn, 
	dvTxTable3AudIn, 
	dvTxTable4AudIn
}

dev dvDxlinkTxAnalogVidInPorts[] = 
{
	dvTxTable1VidInAnalog, 
	dvTxTable2VidInAnalog, 
	dvTxTable3VidInAnalog, 
	dvTxTable4VidInAnalog
}

// DXLink RX Ports
dev dvDxlinkRxMainPorts[] = 
{
	dvRxProjectorMain, 
	dvRxMonitorStudentTableMain
}

dev dvDxlinkRxVidOutPorts[] = 
{
	dvRxProjectorVidOut, 
	dvRxMonitorStudentTableVidOut
}

dev dvDxlinkRxAudOutPorts[] = 
{
	dvRxProjectorAudOut,
	dvRxMonitorStudentTableAudOut
}


#end_if