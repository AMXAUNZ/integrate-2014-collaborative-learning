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


// Override the DEV arrays within encoder-listener
dev dvEncoderMainPorts[] = { dvEncoderMain }

dev dvEncoderUsbPorts[] = { dvEncoderUsbFront, dvEncoderUsbBack }



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
	dvTxTable4Main,
	dvDXlinkTxRpmMain
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


/*
 * --------------------
 * RMS DEV Arrays
 * --------------------
 */


// RMS Touch Panel Array
VOLATILE DEV dvRMSTP[] =
{
   dvTpSchedulingRms
}

// RMS Touch Panel Array -
//  Base Device for System Keyboard handling
VOLATILE DEV dvRMSTP_Base[] =
{
   dvTpScheduling
}

/*
 * --------------------
 * Button channel/address codes
 * - need to declare these as variable instead of constant as they are being
 *   passed through to a module
 * --------------------
 */

integer btnsVideoSnapshotPreviews[DVX_MAX_VIDEO_INPUTS] = 
{
	11,
	12,
	13,
	14,
	15,
	16,
	17,
	18,
	19,
	20
}

integer btnAdrsVideoSnapshotPreviews[DVX_MAX_VIDEO_INPUTS] = 
{
	11,
	12,
	13,
	14,
	15,
	16,
	17,
	18,
	19,
	20
}

integer btnAdrsVideoInputLabels[DVX_MAX_VIDEO_INPUTS] = 
{
	41,
	42,
	43,
	44,
	45,
	46,
	47,
	48,
	49,
	50
}

integer btnAdrsVideoOutputSnapshotPreviews[DVX_MAX_VIDEO_OUTPUTS] = 
{
	9991,
	9992,
	9993,
	9994
}

integer btnAdrsVideoOutputLabels[DVX_MAX_VIDEO_OUTPUTS] = 
{
	9991,
	9992,
	9993,
	9994
}

integer btnAdrVideoPreviewLoadingMessage = 30

integer btnLoadingBarMultiState = 32

integer btnAdrLoadingBar = 32

integer btnAdrVideoPreviewWindow = 31

integer btnExitVideoPreview = 100

char popupNameVideoPreview[] = 'popup-video-preview'

char imageFileNameNoVideo[] = ''//'icon-novideo.png'


integer btnVideoOutputDestinationSelections[DVX_MAX_VIDEO_OUTPUTS]

integer selectedInputStudentPodB
integer selectedInputStudentPodC

/*
 * --------------------
 * Device Driver Files
 * --------------------
 */

CHAR xddEpsonProjector[] = 'Epson_Video_Projector_EB-1430Wi_1430WT_1.0.0.xdd'

/*
 * --------------------
 * Variables to keep track of changes in the system
 * --------------------
 */

_DvxSwitcher dvx

_Encoder encoder

persistent integer selectedAudioInput = DVX_PORT_AUD_IN_NONE

persistent integer selectedVideoInputMonitorStudentTable  = DVX_PORT_VID_IN_NONE
persistent integer selectedVideoInputProjector = DVX_PORT_VID_IN_NONE

// Drag and drop areas for 10" panel
// drop areas
_area dropAreaLeftOrientationMonitorStudentTable
_area dropAreaRightOrientationMonitorStudentTable
// drag item areas
_area dragAreas10[DVX_MAX_VIDEO_INPUTS]

char draggablePopups10[DVX_MAX_VIDEO_INPUTS][40]
char blockDraggablePopups10[DVX_MAX_VIDEO_INPUTS][40]

integer selectedVideoInputLecternPanel = DVX_PORT_VID_IN_NONE

integer lightsMode = LIGHTS_MODE_MID

integer streamingStatus

integer encoderFollowingProjector

integer flash

/*
 * --------------------
 * Wait times
 * - in tenths of seconds
 * --------------------
 */

integer waitTimeValidSignal     = 20
integer waitTimeToShowSignageOnProjector = 20

#end_if