program_name='system-devices'

#if_not_defined __SYSTEM_DEVICES__
#define __SYSTEM_DEVICES__

#include 'system-library-api'
#include 'system-constants'

/*
 * -------------------------------------------------------------------
 * Declared Devices
 * -------------------------------------------------------------------
 */

define_device

// Master Controller
dvMaster    = DEV_ID_MASTER:1:SYS_MASTER

// Student table 10" panel drag and drop
dvTpStudentTableDragAndDrop = DEV_ID_TOUCH_PANEL_STUDENT_TABLE:PORT_TP_MAIN:SYS_MASTER

// Scheduling panel
dvTpScheduling = DEV_ID_TOUCH_PANEL_SCHEDULING:PORT_TP_MAIN:SYS_MASTER

// DXLinx Receiver at Monitor on Student Table
dvRxMonitorStudentTableMain     = DEV_ID_RX_MONITOR_STUDENT_TABLE:DXLINK_PORT_MAIN:SYS_MASTER
dvRxMonitorStudentTableSerial   = DEV_ID_RX_MONITOR_STUDENT_TABLE:DXLINK_PORT_SERIAL:SYS_MASTER
dvRxMonitorStudentTableVidOut   = DEV_ID_RX_MONITOR_STUDENT_TABLE:DXLINK_PORT_VIDEO_OUTPUT:SYS_MASTER
dvRxMonitorStudentTableAudOut   = DEV_ID_RX_MONITOR_STUDENT_TABLE:DXLINK_PORT_AUDIO_OUTPUT:SYS_MASTER

// DXLinx Receiver at Projector
dvRxProjectorMain    = DEV_ID_RX_PROJECTOR:DXLINK_PORT_MAIN:SYS_MASTER
dvRxProjectorSerial  = DEV_ID_RX_PROJECTOR:DXLINK_PORT_SERIAL:SYS_MASTER
dvRxProjectorVidOut  = DEV_ID_RX_PROJECTOR:DXLINK_PORT_VIDEO_OUTPUT:SYS_MASTER
dvRxProjectorAudOut  = DEV_ID_RX_PROJECTOR:DXLINK_PORT_AUDIO_OUTPUT:SYS_MASTER

// DXLinx Multi-Format Transmitter #1 under student table
dvTxTable1Main          = DEV_ID_TX_1:DXLINK_PORT_MAIN:SYS_MASTER
dvTxTable1VidInDigital  = DEV_ID_TX_1:DXLINK_PORT_VIDEO_INPUT_DIGITAL:SYS_MASTER
dvTxTable1VidInAnalog   = DEV_ID_TX_1:DXLINK_PORT_VIDEO_INPUT_ANALOG:SYS_MASTER
dvTxTable1AudIn         = DEV_ID_TX_1:DXLINK_PORT_AUDIO_INPUT:SYS_MASTER

// DXLinx Multi-Format Transmitter #2 under student table
dvTxTable2Main          = DEV_ID_TX_2:DXLINK_PORT_MAIN:SYS_MASTER
dvTxTable2VidInDigital  = DEV_ID_TX_2:DXLINK_PORT_VIDEO_INPUT_DIGITAL:SYS_MASTER
dvTxTable2VidInAnalog   = DEV_ID_TX_2:DXLINK_PORT_VIDEO_INPUT_ANALOG:SYS_MASTER
dvTxTable2AudIn         = DEV_ID_TX_2:DXLINK_PORT_AUDIO_INPUT:SYS_MASTER

// DXLinx Multi-Format Transmitter #3 under student table
dvTxTable3Main          = DEV_ID_TX_3:DXLINK_PORT_MAIN:SYS_MASTER
dvTxTable3VidInDigital  = DEV_ID_TX_3:DXLINK_PORT_VIDEO_INPUT_DIGITAL:SYS_MASTER
dvTxTable3VidInAnalog   = DEV_ID_TX_3:DXLINK_PORT_VIDEO_INPUT_ANALOG:SYS_MASTER
dvTxTable3AudIn         = DEV_ID_TX_3:DXLINK_PORT_AUDIO_INPUT:SYS_MASTER

// DXLinx Multi-Format Transmitter #4 under student table
dvTxTable4Main          = DEV_ID_TX_4:DXLINK_PORT_MAIN:SYS_MASTER
dvTxTable4VidInDigital  = DEV_ID_TX_4:DXLINK_PORT_VIDEO_INPUT_DIGITAL:SYS_MASTER
dvTxTable4VidInAnalog   = DEV_ID_TX_4:DXLINK_PORT_VIDEO_INPUT_ANALOG:SYS_MASTER
dvTxTable4AudIn         = DEV_ID_TX_4:DXLINK_PORT_AUDIO_INPUT:SYS_MASTER

// DVX Main Port
dvDvxMain   = DEV_ID_DVX_SWITCHER:DVX_PORT_MAIN:SYS_MASTER

// DVX Video Inputs
dvDvxVidIn1     = DEV_ID_DVX_SWITCHER:DVX_PORT_VID_IN_1:SYS_MASTER
dvDvxVidIn2     = DEV_ID_DVX_SWITCHER:DVX_PORT_VID_IN_2:SYS_MASTER
dvDvxVidIn3     = DEV_ID_DVX_SWITCHER:DVX_PORT_VID_IN_3:SYS_MASTER
dvDvxVidIn4     = DEV_ID_DVX_SWITCHER:DVX_PORT_VID_IN_4:SYS_MASTER
dvDvxVidIn5     = DEV_ID_DVX_SWITCHER:DVX_PORT_VID_IN_5:SYS_MASTER
dvDvxVidIn6     = DEV_ID_DVX_SWITCHER:DVX_PORT_VID_IN_6:SYS_MASTER
dvDvxVidIn7     = DEV_ID_DVX_SWITCHER:DVX_PORT_VID_IN_7:SYS_MASTER
dvDvxVidIn8     = DEV_ID_DVX_SWITCHER:DVX_PORT_VID_IN_8:SYS_MASTER
dvDvxVidIn9     = DEV_ID_DVX_SWITCHER:DVX_PORT_VID_IN_9:SYS_MASTER
dvDvxVidIn10    = DEV_ID_DVX_SWITCHER:DVX_PORT_VID_IN_10:SYS_MASTER
// Named video input ports
dvDvxVidInLecturnLaptopVga  = dvDvxVidIn1
dvDvxVidInLecturnLaptopHdmi = dvDvxVidIn3
dvDvxVidInCamera            = dvDvxVidIn4
dvDvxVidInLecturnEnzo       = dvDvxVidIn5
dvDvxVidInStudentEnzo       = dvDvxVidIn6
dvDvxVidInStudentLaptop1    = dvDvxVidIn7
dvDvxVidInStudentLaptop2    = dvDvxVidIn8
dvDvxVidInStudentLaptop3    = dvDvxVidIn9
dvDvxVidInStudentLaptop4    = dvDvxVidIn10

// DVX Video Outputs
dvDvxVidOut1    = DEV_ID_DVX_SWITCHER:DVX_PORT_VID_OUT_1:SYS_MASTER
dvDvxVidOut2    = DEV_ID_DVX_SWITCHER:DVX_PORT_VID_OUT_2:SYS_MASTER
dvDvxVidOut3    = DEV_ID_DVX_SWITCHER:DVX_PORT_VID_OUT_3:SYS_MASTER
dvDvxVidOut4    = DEV_ID_DVX_SWITCHER:DVX_PORT_VID_OUT_4:SYS_MASTER
// Named video output ports
dvDvxVidOutProjectorAndMultiPip  = dvDvxVidOut1
dvDvxVidOutMultiPip              = dvDvxVidOut2
dvDvxVidOutMonitorStudentTable   = dvDvxVidOut3
dvDvxVidOutMultiPreview          = dvDvxVidOut4

// DVX Audio Inputs
dvDvxAudIn1     = DEV_ID_DVX_SWITCHER:DVX_PORT_AUD_IN_1:SYS_MASTER
dvDvxAudIn2     = DEV_ID_DVX_SWITCHER:DVX_PORT_AUD_IN_2:SYS_MASTER
dvDvxAudIn3     = DEV_ID_DVX_SWITCHER:DVX_PORT_AUD_IN_3:SYS_MASTER
dvDvxAudIn4     = DEV_ID_DVX_SWITCHER:DVX_PORT_AUD_IN_4:SYS_MASTER
dvDvxAudIn5     = DEV_ID_DVX_SWITCHER:DVX_PORT_AUD_IN_5:SYS_MASTER
dvDvxAudIn6     = DEV_ID_DVX_SWITCHER:DVX_PORT_AUD_IN_6:SYS_MASTER
dvDvxAudIn7     = DEV_ID_DVX_SWITCHER:DVX_PORT_AUD_IN_7:SYS_MASTER
dvDvxAudIn8     = DEV_ID_DVX_SWITCHER:DVX_PORT_AUD_IN_8:SYS_MASTER
dvDvxAudIn9     = DEV_ID_DVX_SWITCHER:DVX_PORT_AUD_IN_9:SYS_MASTER
dvDvxAudIn10    = DEV_ID_DVX_SWITCHER:DVX_PORT_AUD_IN_10:SYS_MASTER
dvDvxAudIn11    = DEV_ID_DVX_SWITCHER:DVX_PORT_AUD_IN_11:SYS_MASTER
dvDvxAudIn12    = DEV_ID_DVX_SWITCHER:DVX_PORT_AUD_IN_12:SYS_MASTER
dvDvxAudIn13    = DEV_ID_DVX_SWITCHER:DVX_PORT_AUD_IN_13:SYS_MASTER
dvDvxAudIn14    = DEV_ID_DVX_SWITCHER:DVX_PORT_AUD_IN_14:SYS_MASTER
// Named audio input ports
dvDvxAudInLecturnLaptopVga   = dvDvxAudIn1
dvDvxAudInLecturnLaptopHdmi  = dvDvxAudIn3
dvDvxAudInLecturnEnzo        = dvDvxAudIn5
dvDvxAudInStudentEnzo        = dvDvxAudIn6
dvDvxAudInStudentLaptop1     = dvDvxAudIn7
dvDvxAudInStudentLaptop2     = dvDvxAudIn8
dvDvxAudInStudentLaptop3     = dvDvxAudIn9
dvDvxAudInStudentLaptop4     = dvDvxAudIn10

// DVX Audio Outputs
dvDvxAudOut1    = DEV_ID_DVX_SWITCHER:DVX_PORT_AUD_OUT_1:SYS_MASTER
dvDvxAudOut2    = DEV_ID_DVX_SWITCHER:DVX_PORT_AUD_OUT_2:SYS_MASTER
dvDvxAudOut3    = DEV_ID_DVX_SWITCHER:DVX_PORT_AUD_OUT_3:SYS_MASTER
dvDvxAudOut4    = DEV_ID_DVX_SWITCHER:DVX_PORT_AUD_OUT_4:SYS_MASTER
// Named audio output ports
dvDvxAudOutSpeakers = dvDvxAudOut1

// DVX Controller
dvDvxControllerMain = DEV_ID_DVX_CONTROLLER:PORT_DVX_CONTROLLER_MAIN:SYS_MASTER

// Monitor at Student Table
dvMonitorStudentTable   = dvRxMonitorStudentTableSerial
vdvMonitorStudentTable  = DEV_ID_VIRTUAL_MONITOR_STUDENT_TABLE:PORT_VIRTUAL_MAIN:SYS_MASTER

// Projector
dvProjector  = dvRxProjectorSerial
vdvProjector = DEV_ID_VIRTUAL_PROJECTOR:PORT_VIRTUAL_MAIN:SYS_MASTER

// Enzo's
dvEnzoLecturn      = DEV_ID_ENZO_LECTURN:PORT_ENZO_MAIN:SYS_MASTER
dvEnzoStudentTable = DEV_ID_ENZO_STUDENT_TABLE:PORT_ENZO_MAIN:SYS_MASTER

// RMS
vdvRms  = DEV_ID_VIRTUAL_RMS:PORT_VIRTUAL_MAIN:SYS_MASTER

// Multi-Preview
vdvMultiPreview = DEV_ID_VIRTUAL_MULTI_PREVIEW:PORT_VIRTUAL_MAIN:SYS_MASTER

// Drag and Drop Virtual
vdvDragAndDropStudentTable = DEV_ID_VIRTUAL_DRAG_AND_DROP_STUDENT_TABLE:PORT_VIRTUAL_MAIN:SYS_MASTER

#end_if