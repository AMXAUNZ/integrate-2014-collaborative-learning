program_name='system-functions'

#include 'system-defines'
#include 'system-library-api'
#include 'system-library-control'
#include 'system-constants'
#include 'system-devices'
#include 'system-structures'
#include 'system-variables'
#include 'system-rms-api'

#include 'debug'

#if_not_defined __SYSTEM_FUNCTIONS__
#define __SYSTEM_FUNCTIONS__

/*
 * -------------------------------------------------------------------
 * Functions
 * -------------------------------------------------------------------
 */



define_function resetMenuOnDragAndDropPanel ()
{
	moderoEnableButtonAnimateFromCurrentState (dvTpStudentTableDragAndDrop, 1, 1, 4)
	moderoEnableButtonAnimateFromCurrentState (dvTpStudentTableDragAndDrop, 2, 1, 4)
	moderoEnableButtonAnimateFromCurrentState (dvTpStudentTableDragAndDrop, 3, 1, 4)
	moderoEnableButtonAnimateFromCurrentState (dvTpStudentTableDragAndDrop, 4, 1, 4)
}

define_function resetDraggablePopup (dev dragAndDropVirtual, integer id)
{
	hideDraggablePopup (dragAndDropVirtual, id)
	showDraggablePopup (dragAndDropVirtual, id)
}

define_function resetAllDraggablePopups (dev dragAndDropVirtual)
{
	select
	{
		active (dragAndDropVirtual == vdvDragAndDropStudentTable):
		{
			hideDraggablePopup (vdvDragAndDropStudentTable, dvDvxVidInStudentLaptop1.port)
			hideDraggablePopup (vdvDragAndDropStudentTable, dvDvxVidInStudentLaptop2.port)
			hideDraggablePopup (vdvDragAndDropStudentTable, dvDvxVidInStudentLaptop3.port)
			hideDraggablePopup (vdvDragAndDropStudentTable, dvDvxVidInStudentLaptop4.port)
			
			showDraggablePopup (vdvDragAndDropStudentTable, dvDvxVidInStudentLaptop1.port)
			showDraggablePopup (vdvDragAndDropStudentTable, dvDvxVidInStudentLaptop2.port)
			showDraggablePopup (vdvDragAndDropStudentTable, dvDvxVidInStudentLaptop3.port)
			showDraggablePopup (vdvDragAndDropStudentTable, dvDvxVidInStudentLaptop4.port)
		}
	}
}

define_function hideDraggablePopup (dev dragAndDropVirtual, integer id)
{
	select
	{
		active (dragAndDropVirtual == vdvDragAndDropStudentTable):
		{
			moderoDisablePopup (dvTpStudentTableDragAndDrop, draggablePopups10[id])
		}
	}
}

define_function hideAllDraggablePopups (dev dragAndDropVirtual)
{
	select
	{
		active (dragAndDropVirtual == vdvDragAndDropStudentTable):
		{
			hideDraggablePopup (vdvDragAndDropStudentTable, dvDvxVidInStudentLaptop1.port)
			hideDraggablePopup (vdvDragAndDropStudentTable, dvDvxVidInStudentLaptop2.port)
			hideDraggablePopup (vdvDragAndDropStudentTable, dvDvxVidInStudentLaptop3.port)
			hideDraggablePopup (vdvDragAndDropStudentTable, dvDvxVidInStudentLaptop4.port)
		}
	}
}

define_function showDraggablePopup (dev dragAndDropVirtual, integer id)
{
	select
	{
		active (dragAndDropVirtual == vdvDragAndDropStudentTable):
		{
			if (dvx.videoInputs[id].status == DVX_SIGNAL_STATUS_VALID_SIGNAL)
				moderoEnablePopupOnPage (dvTpStudentTableDragAndDrop, draggablePopups10[id], PAGE_NAME_MAIN)
		}
	}
}

define_function showDraggablePopupsAll (dev dragAndDropVirtual)
{
	select
	{
		active (dragAndDropVirtual == vdvDragAndDropStudentTable):
		{
			showDraggablePopup (vdvDragAndDropStudentTable, dvDvxVidInStudentLaptop1.port)
			showDraggablePopup (vdvDragAndDropStudentTable, dvDvxVidInStudentLaptop2.port)
			showDraggablePopup (vdvDragAndDropStudentTable, dvDvxVidInStudentLaptop3.port)
			showDraggablePopup (vdvDragAndDropStudentTable, dvDvxVidInStudentLaptop4.port)
		}
	}
}


define_function blockDragItem (dev dragAndDropVirtual, integer id)
{
	select
	{
		active (dragAndDropVirtual == vdvDragAndDropStudentTable):
		{
			moderoEnablePopup (dvTpStudentTableDragAndDrop, blockDraggablePopups10[id])
		}
	}
}

define_function unblockDragItem (dev dragAndDropVirtual, integer id)
{
	select
	{
		active (dragAndDropVirtual == vdvDragAndDropStudentTable):
		{
			moderoDisablePopup (dvTpStudentTableDragAndDrop, blockDraggablePopups10[id])
		}
	}
}

define_function unblockDragItemsAll (dev dragAndDropVirtual)
{
	select
	{
		active (dragAndDropVirtual == vdvDragAndDropStudentTable):
		{
			unblockDragItem (vdvDragAndDropStudentTable, dvDvxVidInStudentLaptop1.port)
			unblockDragItem (vdvDragAndDropStudentTable, dvDvxVidInStudentLaptop2.port)
			unblockDragItem (vdvDragAndDropStudentTable, dvDvxVidInStudentLaptop3.port)
			unblockDragItem (vdvDragAndDropStudentTable, dvDvxVidInStudentLaptop4.port)
		}
	}
}


define_function unblockDragItemsAllWithValidSignal (dev dragAndDropVirtual)
{
	select
	{
		active (dragAndDropVirtual == vdvDragAndDropStudentTable):
		{
			if (dvx.videoInputs[dvDvxVidInStudentLaptop1.port].status == DVX_SIGNAL_STATUS_VALID_SIGNAL)
				unblockDragItem (vdvDragAndDropStudentTable, dvDvxVidInStudentLaptop1.port)
			else
				unblockDragItem (vdvDragAndDropStudentTable, dvDvxVidInStudentLaptop1.port)
			
			if (dvx.videoInputs[dvDvxVidInStudentLaptop2.port].status == DVX_SIGNAL_STATUS_VALID_SIGNAL)
				unblockDragItem (vdvDragAndDropStudentTable, dvDvxVidInStudentLaptop2.port)
			else
				unblockDragItem (vdvDragAndDropStudentTable, dvDvxVidInStudentLaptop2.port)
			
			if (dvx.videoInputs[dvDvxVidInStudentLaptop3.port].status == DVX_SIGNAL_STATUS_VALID_SIGNAL)
				unblockDragItem (vdvDragAndDropStudentTable, dvDvxVidInStudentLaptop3.port)
			else
				unblockDragItem (vdvDragAndDropStudentTable, dvDvxVidInStudentLaptop3.port)
			
			if (dvx.videoInputs[dvDvxVidInStudentLaptop4.port].status == DVX_SIGNAL_STATUS_VALID_SIGNAL)
				unblockDragItem (vdvDragAndDropStudentTable, dvDvxVidInStudentLaptop4.port)
			else
				unblockDragItem (vdvDragAndDropStudentTable, dvDvxVidInStudentLaptop4.port)
		}
	}
}

define_function addDragItem (dev dragAndDropVirtual, integer id)
{
	select
	{
		active (dragAndDropVirtual == vdvDragAndDropStudentTable):
		{
			sendCommand (vdvDragAndDropStudentTable, "'DEFINE_DRAG_ITEM-',buildDragAndDropParameterString(id, dragAreas10[id])")
		}
	}
}

define_function addDragItemsAll (dev dragAndDropVirtual)
{
	select
	{
		active (dragAndDropVirtual == vdvDragAndDropStudentTable):
		{
			addDragItem (vdvDragAndDropStudentTable, dvDvxVidInStudentLaptop1.port)
			addDragItem (vdvDragAndDropStudentTable, dvDvxVidInStudentLaptop2.port)
			addDragItem (vdvDragAndDropStudentTable, dvDvxVidInStudentLaptop3.port)
			addDragItem (vdvDragAndDropStudentTable, dvDvxVidInStudentLaptop4.port)
		}
	}
}

define_function enableDragItem (dev dragAndDropVirtual, integer id)
{
	select
	{
		active (dragAndDropVirtual == vdvDragAndDropStudentTable):
		{
			sendCommand (vdvDragAndDropStudentTable, "'ACTIVATE_DRAG_ITEM-',buildDragAndDropParameterString(id, dragAreas10[id])")
		}
	}
}

define_function enableDragItemsAll (dev dragAndDropVirtual)
{
	select
	{
		active (dragAndDropVirtual == vdvDragAndDropStudentTable):
		{
			enableDragItem (vdvDragAndDropStudentTable, dvDvxVidInStudentLaptop1.port)
			enableDragItem (vdvDragAndDropStudentTable, dvDvxVidInStudentLaptop2.port)
			enableDragItem (vdvDragAndDropStudentTable, dvDvxVidInStudentLaptop3.port)
			enableDragItem (vdvDragAndDropStudentTable, dvDvxVidInStudentLaptop4.port)
		}
	}
}



define_function enableDragItemsAllWithValidSignal (dev dragAndDropVirtual)
{
	select
	{
		active (dragAndDropVirtual == vdvDragAndDropStudentTable):
		{
			if (dvx.videoInputs[dvDvxVidInStudentLaptop1.port].status == DVX_SIGNAL_STATUS_VALID_SIGNAL)
				enableDragItem (vdvDragAndDropStudentTable, dvDvxVidInStudentLaptop1.port)
			else
				disableDragItem (vdvDragAndDropStudentTable, dvDvxVidInStudentLaptop1.port)
			
			
			if (dvx.videoInputs[dvDvxVidInStudentLaptop2.port].status == DVX_SIGNAL_STATUS_VALID_SIGNAL)
				enableDragItem (vdvDragAndDropStudentTable, dvDvxVidInStudentLaptop2.port)
			else
				disableDragItem (vdvDragAndDropStudentTable, dvDvxVidInStudentLaptop2.port)
			
			if (dvx.videoInputs[dvDvxVidInStudentLaptop3.port].status == DVX_SIGNAL_STATUS_VALID_SIGNAL)
				enableDragItem (vdvDragAndDropStudentTable, dvDvxVidInStudentLaptop3.port)
			else
				disableDragItem (vdvDragAndDropStudentTable, dvDvxVidInStudentLaptop3.port)
			
			if (dvx.videoInputs[dvDvxVidInStudentLaptop4.port].status == DVX_SIGNAL_STATUS_VALID_SIGNAL)
				enableDragItem (vdvDragAndDropStudentTable, dvDvxVidInStudentLaptop4.port)
			else
				disableDragItem (vdvDragAndDropStudentTable, dvDvxVidInStudentLaptop4.port)
		}
	}
}


define_function disableDragItem (dev dragAndDropVirtual, integer id)
{
	select
	{
		active (dragAndDropVirtual == vdvDragAndDropStudentTable):
		{
			sendCommand (vdvDragAndDropStudentTable, "'DEACTIVATE_DRAG_ITEM-',itoa(id)")
		}
	}
}


define_function disableDragItemsAll (dev dragAndDropVirtual)
{
	select
	{
		active (dragAndDropVirtual == vdvDragAndDropStudentTable):
		{
			disableDragItem (vdvDragAndDropStudentTable, dvDvxVidInStudentLaptop1.port)
			disableDragItem (vdvDragAndDropStudentTable, dvDvxVidInStudentLaptop2.port)
			disableDragItem (vdvDragAndDropStudentTable, dvDvxVidInStudentLaptop3.port)
			disableDragItem (vdvDragAndDropStudentTable, dvDvxVidInStudentLaptop4.port)
		}
	}
}

define_function disableDropArea (dev dragAndDropVirtual, integer id)
{
	select
	{
		active (dragAndDropVirtual == vdvDragAndDropStudentTable):
		{
			sendCommand (vdvDragAndDropStudentTable, "'DEACTIVATE_DROP_AREA-',itoa(id)")
		}
	}
}

define_function disableDropAreasAll (dev dragAndDropVirtual)
{
	select
	{
		active (dragAndDropVirtual == vdvDragAndDropStudentTable):
		{
			disableDropArea (vdvDragAndDropStudentTable, dvDvxVidOutMonitorStudentTable.port)
		}
	}
}

define_function addDropArea (dev dragAndDropVirtual, integer id)
{
	/*select
	{
		/*active (dragAndDropVirtual == vdvDragAndDropStudentTable):
		{
			sendCommand (vdvDragAndDropStudentTable, "'DEFINE_DROP_AREA-',buildDragAndDropParameterString(id, dropAreas10[id])")
		}*/
	}*/
}


define_function addDropAreasAll (dev dragAndDropVirtual)
{
	/*select
	{
		/*active (dragAndDropVirtual == vdvDragAndDropStudentTable):
		{
			addDropArea (vdvDragAndDropStudentTable, dvDvxVidOutMonitorStudentTable.port)
		}*/
	}*/
}

define_function enableDropArea (dev dragAndDropVirtual, integer id)
{
	/*select
	{
		// do not handle 10" panel in this function.
		// the 10" is a special case as the index number of the drodAreas array does not necessary correlate to the output number of the dvx.
		/*active (dragAndDropVirtual == vdvDragAndDropStudentTable):
		{
			sendCommand (vdvDragAndDropStudentTable, "'DEFINE_DROP_AREA-',buildDragAndDropParameterString(id, dropAreas10[id])")
		}*/
	}*/
}

define_function enableDropItemsAll (dev dragAndDropVirtual)
{
	/*select
	{
		
		// do not handle 10" panel in this function.
		// the 10" is a special case as the index number of the drodAreas array does not necessary correlate to the output number of the dvx.
		/*active (dragAndDropVirtual == vdvDragAndDropStudentTable):
		{
			enableDropArea (vdvDragAndDropStudentTable, dvDvxVidOutMonitorStudentTable.port)
		}*/
	}*/
}

define_function char[20] buildDragAndDropParameterString (integer id, _area area)
{
	return "itoa(id),',',itoa(area.left),',',itoa(area.top),',',itoa(area.width),',',itoa(area.height)"
}

define_function initArea (_area area, integer left, integer top, integer width, integer height)
{
	area.left = left
	area.top = top
	area.width = width
	area.height = height
}


define_function showSourceOnDisplay (integer input, integer output)
{
	// switch the video
	dvxSwitchVideoOnly (dvDvxMain, input, output)
	
	// disable any test patterns on the output of the dvx
	// turn on the monitor
	select
	{
		active (output == dvDvxVidOutMonitorStudentTable.port):
		{
			dvxSetVideoOutputTestPattern (dvDvxVidOutMonitorStudentTable, DVX_TEST_PATTERN_OFF)
			turnOnDisplay (vdvMonitorStudentTable)
		}
		
		active (output == dvDvxVidOutProjector.port):
		{
			dvxSetVideoOutputTestPattern (dvDvxVidOutProjector, DVX_TEST_PATTERN_OFF)
			turnOnDisplay (vdvProjector)
		}
	}
}

define_function turnOnDisplay (dev virtual)
{
	snapiDisplayEnablePower (virtual)
}

define_function turnOffDisplay (dev virtual)
{
	snapiDisplayDisablePower (virtual)
}

define_function turnOnDisplaysAll ()
{
	turnOnDisplay (vdvMonitorStudentTable)
	turnOnDisplay (vdvProjector)
}

define_function turnOffDisplaysAll ()
{
	turnOffDisplay (vdvMonitorStudentTable)
	turnOffDisplay (vdvProjector)
}


define_function LaptopInputDetectedStudentTable (dev dvTxVidIn)
{
	// turn on the monitor at the student table
	turnOnDisplay (vdvMonitorStudentTable)
	
	// if there is no video currently routed to the monitor at the student table, show this source
	if (selectedVideoInputMonitorStudentTable == DVX_PORT_VID_IN_NONE)
	{
		stack_var integer input
		
		select
		{
			active (dvTxVidIn == dvTxTable1VidInDigital):    input = dvDvxVidInStudentLaptop1.port
			active (dvTxVidIn == dvTxTable1VidInAnalog):     input = dvDvxVidInStudentLaptop1.port
			
			active (dvTxVidIn == dvTxTable2VidInDigital):    input = dvDvxVidInStudentLaptop2.port
			active (dvTxVidIn == dvTxTable2VidInAnalog):     input = dvDvxVidInStudentLaptop2.port
			
			active (dvTxVidIn == dvTxTable3VidInDigital):    input = dvDvxVidInStudentLaptop3.port
			active (dvTxVidIn == dvTxTable3VidInAnalog):     input = dvDvxVidInStudentLaptop3.port
			
			active (dvTxVidIn == dvTxTable4VidInDigital):    input = dvDvxVidInStudentLaptop4.port
			active (dvTxVidIn == dvTxTable4VidInAnalog):     input = dvDvxVidInStudentLaptop4.port
		}
		
		// route the DVX input for this TX to the DVX output for the left monitor
		dvxSwitchVideoOnly (dvDvxMain, input, dvDvxVidOutMonitorStudentTable.port)
	}
}

/*
 * --------------------
 * Override encoder-listener callback functions
 * --------------------
 */


#define INCLUDE_ENCODER_NOTIFY_USB_STATUS_CALLBACK
define_function encoderNotifyUsbStatus (dev encoderUsb, char status[])
{
	// encoderUsb is the D:P:S of the USB port on the Encoder.
	// status is the status of the USB storage connection (ENCODER_USB_STATUS_CONNECTED | ENCODER_USB_STATUS_DISCONNECTED)
	
	debugPrint ("'encoderNotifyUsbStatus (dev encoderUsb, char status[])'")
	debugPrint ("'encoderUsb = [',debugDevToString(encoderUsb),']'")
	debugPrint ("'status = "',status,'"'")
	
	select
	{
		active (encoderUsb == dvEncoderUsbFront):
		{
			encoder.usbStatusFront = status
			
			switch (status)
			{
				case ENCODER_USB_STATUS_CONNECTED:
				{
					encoderRequestVideoRecordStatus (dvEncoderMain)
				}
				
				case ENCODER_USB_STATUS_DISCONNECTED:
				{
					moderoEnableButtonAnimate (dvTpLecternEncoder, BTN_ADR_ENCODER_RECORD_START_STOP, 0, BTNSTATE_RECORDING_NO_USB, 0)
				}
			}
		}
		
		active (encoderUsb == dvEncoderUsbBack):
		{
			encoder.usbStatusBack = status
		}
	}
}

#define INCLUDE_ENCODER_NOTIFY_ALARM_CALLBACK
define_function encoderNotifyAlarm (dev encoderUsb, char alarmMsg[])
{
	// encoderUsb is the D:P:S of the USB port on the Encoder.
	// alarmMsg is the message from the alarm.
	//		ENCODER_ALARM_STREAM_STOPPED
	//		ENCODER_ALARM_STREAM_STARTED
	//		ENCODER_ALARM_STREAM_SUSPENDED
	//		ENCODER_ALARM_RECORD_STARTED
	//		ENCODER_ALARM_RECORD_STOPPED
	//		ENCODER_ALARM_RECORD_SUSPENDED
	//		ENCODER_ALARM_NO_VIDEO_IN_DETECTED
	//		ENCODER_ALARM_CONFLICTING_VIDEO_IN_FORMAT
	//		ENCODER_ALARM_TIMEOUT_STOP_RECORD_STREAM
	//		ENCODER_ALARM_CANNOT_RECORD_NO_MEDIUM
	//		ENCODER_ALARM_CANNOT_RECORD_NO_SIGNAL
	
	switch (alarmMsg)
	{
		case ENCODER_ALARM_RECORD_STOPPED:
		{
			moderoEnableButtonAnimate (dvTpLecternEncoder, BTN_ADR_ENCODER_RECORD_START_STOP, 0, BTNSTATE_RECORDING_STOPPED, 0)
		}
	}
}


#define INCLUDE_ENCODER_NOTIFY_VIDEO_RECORDING_STATUS_CALLBACK
define_function encoderNotifyVideoRecordingStatus (dev encoderMain, char status[])
{
	// encoderMain is the D:P:S of the main port on the Encoder.
	// status is the status of the recording (ENCODER_RECORDING_STATUS_STARTING | ENCODER_RECORDING_STATUS_STARTED | ENCODER_RECORDING_STATUS_STOPPED | ENCODER_RECORDING_STATUS_SUSPENDED)
	
	encoder.recordStatus = status
	
	switch (status)
	{
		case ENCODER_RECORDING_STATUS_STARTING:
		{
			
		}
		
		case ENCODER_RECORDING_STATUS_STARTED:
		{
			moderoEnableButtonAnimate (dvTpLecternEncoder, BTN_ADR_ENCODER_RECORD_START_STOP, 0, BTNSTATE_RECORDING_STARTED, 0)
		}
		
		case ENCODER_RECORDING_STATUS_STOPPED:
		{
			moderoEnableButtonAnimate (dvTpLecternEncoder, BTN_ADR_ENCODER_RECORD_START_STOP, 0, BTNSTATE_RECORDING_STOPPED, 0)
		}
		
		case ENCODER_RECORDING_STATUS_SUSPENDED:
		{
			if (encoder.usbStatusFront = ENCODER_USB_STATUS_DISCONNECTED)
				moderoEnableButtonAnimate (dvTpLecternEncoder, BTN_ADR_ENCODER_RECORD_START_STOP, 0, BTNSTATE_RECORDING_NO_USB, 0)
			else
				moderoEnableButtonAnimate (dvTpLecternEncoder, BTN_ADR_ENCODER_RECORD_START_STOP, 0, BTNSTATE_RECORDING_STOPPED, 0)
		}
	}
}




#define INCLUDE_ENCODER_NOTIFY_STREAM_STATUS_CALLBACK
define_function encoderNotifyStreamStatus (dev encoderMain, char status[])
{
	// encoderMain is the D:P:S of the main port on the Encoder.
	// status is the status of the stream (ENCODER_STREAM_STATUS_STARTING | ENCODER_STREAM_STATUS_STARTED | ENCODER_STREAM_STATUS_STOPPED | ENCODER_STREAM_STATUS_SUSPENDED)
	
	encoder.streamStatus = status
	
	switch (status)
	{
		
		case ENCODER_STREAM_STATUS_STARTING:
		{
			
		}
		
		case ENCODER_STREAM_STATUS_STARTED:
		{
			moderoEnableButtonAnimate (dvTpLecternEncoder, BTN_ADR_ENCODER_STREAM_START_STOP, 0, BTNSTATE_STREAMING_STARTED, 0)
		}
		
		case ENCODER_STREAM_STATUS_STOPPED:
		{
			moderoEnableButtonAnimate (dvTpLecternEncoder, BTN_ADR_ENCODER_STREAM_START_STOP, 0, BTNSTATE_STREAMING_STOPPED, 0)
		}
		
		case ENCODER_STREAM_STATUS_SUSPENDED:
		{
			moderoEnableButtonAnimate (dvTpLecternEncoder, BTN_ADR_ENCODER_STREAM_START_STOP, 0, BTNSTATE_STREAMING_STOPPED, 0)
		}
	}
}



/*
 * --------------------
 * Override dvx-listener callback functions
 * --------------------
 */

#define INCLUDE_DVX_NOTIFY_SWITCH_CALLBACK
define_function dvxNotifySwitch (dev dvxPort1, char signalType[], integer input, integer output)
{
	// dvxPort1 is port 1 on the DVX.
	// signalType contains the type of signal that was switched ('AUDIO' or 'VIDEO')
	// input contains the source input number that was switched to the destination
	// output contains the destination output number that the source was switched to
	
	if ( (encoderFollowingProjector) and (output == dvDvxVidOutProjector.port) )
	{
		dvxSwitchVideoOnly (dvDvxMain, input, dvDvxVidOutEncoder.port)
	}
	
	switch (signalType)
	{
		case SIGNAL_TYPE_VIDEO:
		{
			dvx.switchStatusVideoOutputs[output] = input
			
			select
			{
				active (output == dvDvxVidOutMonitorStudentTable.port):     selectedVideoInputMonitorStudentTable = input
				
				active (output == dvDvxVidOutProjector.port):    selectedVideoInputProjector = input
			}
		}
		case SIGNAL_TYPE_AUDIO:
		{
			dvx.switchStatusAudioOutputs[output] = input
			
			select
			{
				active (output == dvDvxAudOutSpeakers.port):    selectedAudioInput = input
			}
		}
	}
}

#define INCLUDE_DVX_NOTIFY_VIDEO_INPUT_NAME_CALLBACK
define_function dvxNotifyVideoInputName (dev dvxVideoInput, char name[])
{
	// dvxVideoInput is the D:P:S of the video input port on the DVX switcher. The input number can be taken from dvxVideoInput.PORT
	// name is the name of the video input
	
	dvx.videoInputs[dvxVideoInput.port].name = name
}

#define INCLUDE_DVX_NOTIFY_VIDEO_INPUT_STATUS_CALLBACK
define_function dvxNotifyVideoInputStatus (dev dvxVideoInput, char signalStatus[])
{
	// dvxVideoInput is the D:P:S of the video input port on the DVX switcher. The input number can be taken from dvxVideoInput.PORT
	// signalStatus is the input signal status (DVX_SIGNAL_STATUS_NO_SIGNAL | DVX_SIGNAL_STATUS_UNKNOWN | DVX_SIGNAL_STATUS_VALID_SIGNAL)
	
	stack_var char oldSignalStatus[50]
	
	oldSignalStatus = dvx.videoInputs[dvxVideoInput.port].status
	
	if (signalStatus != oldSignalStatus)
	{
		dvx.videoInputs[dvxVideoInput.port].status = signalStatus
		
		if (signalStatus == DVX_SIGNAL_STATUS_VALID_SIGNAL)
		{
			select
			{
				active (dvxVideoInput == dvDvxVidInStudentLaptop1):
				{
					LaptopInputDetectedStudentTable (dvTxTable1VidInDigital)
				}
				
				active (dvxVideoInput == dvDvxVidInStudentLaptop2):
				{
					LaptopInputDetectedStudentTable (dvTxTable2VidInDigital)
				}
				
				active (dvxVideoInput == dvDvxVidInStudentLaptop3):
				{
					LaptopInputDetectedStudentTable (dvTxTable3VidInDigital)
				}
				
				active (dvxVideoInput == dvDvxVidInStudentLaptop4):
				{
					LaptopInputDetectedStudentTable (dvTxTable4VidInDigital)
				}
			}
		}
		else
		{
			
		}
	}
	
	// 10" Drag and drop
	// if input is one of the table inputs and the signal has just been lost (changed from valid signal)
	//  - disable the corresponding drag area on the 10" panel
	//  - hide the draggable popup for that input on the 10" panel
	// if input is one of the table inputs and the signal has just been detected (changed to valid signal)
	//  - enable the corresponding drag area on the 10" panel
	//  - show the draggable popup for that input on the 10" panel (on the main page)
	
	if (signalStatus != oldSignalStatus)
	{
		select
		{
			active (signalStatus == DVX_SIGNAL_STATUS_VALID_SIGNAL):
			{
				if ( (dvxVideoInput == dvDvxVidInStudentLaptop1) OR
					 (dvxVideoInput == dvDvxVidInStudentLaptop2) OR
					 (dvxVideoInput == dvDvxVidInStudentLaptop3) OR
					 (dvxVideoInput == dvDvxVidInStudentLaptop4) )
				{
					enableDragItem (vdvDragAndDropStudentTable, dvxVideoInput.port)
					unblockDragItem (vdvDragAndDropStudentTable, dvxVideoInput.port)
					showDraggablePopup (vdvDragAndDropStudentTable, dvxVideoInput.port)
					
					select
					{
						active (dvxVideoInput.port == dvDvxVidInStudentLaptop1.port):
						{
							moderoSetButtonBitmap (dvTpStudentTableDragAndDrop, BTN_DRAG_AND_DROP_INSTRUCTIONS, MODERO_BUTTON_STATE_ON, IMAGE_FILE_NAME_DRAG_AND_DROP_INSTRUCTIONS_LAPTOP_1)
							moderoSetButtonBitmap (dvTpStudentTableDragAndDrop, BTN_DROP_AREA_MONITOR_STUDENT_TABLE_DROP_ICON, MODERO_BUTTON_STATE_ALL, IMAGE_FILE_NAME_DROP_ICON_ROTATE_90_DEGREES_CLOCKWISE)
						}
						
						active (dvxVideoInput.port == dvDvxVidInStudentLaptop2.port):
						{
							moderoSetButtonBitmap (dvTpStudentTableDragAndDrop, BTN_DRAG_AND_DROP_INSTRUCTIONS, MODERO_BUTTON_STATE_ON, IMAGE_FILE_NAME_DRAG_AND_DROP_INSTRUCTIONS_LAPTOP_2)
							moderoSetButtonBitmap (dvTpStudentTableDragAndDrop, BTN_DROP_AREA_MONITOR_STUDENT_TABLE_DROP_ICON, MODERO_BUTTON_STATE_ALL, IMAGE_FILE_NAME_DROP_ICON_ROTATE_90_DEGREES_COUNTER_CLOCKWISE)
						}
						
						active (dvxVideoInput.port == dvDvxVidInStudentLaptop3.port):
						{
							moderoSetButtonBitmap (dvTpStudentTableDragAndDrop, BTN_DRAG_AND_DROP_INSTRUCTIONS, MODERO_BUTTON_STATE_ON, IMAGE_FILE_NAME_DRAG_AND_DROP_INSTRUCTIONS_LAPTOP_3)
							moderoSetButtonBitmap (dvTpStudentTableDragAndDrop, BTN_DROP_AREA_MONITOR_STUDENT_TABLE_DROP_ICON, MODERO_BUTTON_STATE_ALL, IMAGE_FILE_NAME_DROP_ICON_ROTATE_90_DEGREES_CLOCKWISE)
						}
						
						active (dvxVideoInput.port == dvDvxVidInStudentLaptop4.port):
						{
							moderoSetButtonBitmap (dvTpStudentTableDragAndDrop, BTN_DRAG_AND_DROP_INSTRUCTIONS, MODERO_BUTTON_STATE_ON, IMAGE_FILE_NAME_DRAG_AND_DROP_INSTRUCTIONS_LAPTOP_4)
							moderoSetButtonBitmap (dvTpStudentTableDragAndDrop, BTN_DROP_AREA_MONITOR_STUDENT_TABLE_DROP_ICON, MODERO_BUTTON_STATE_ALL, IMAGE_FILE_NAME_DROP_ICON_ROTATE_90_DEGREES_COUNTER_CLOCKWISE)
						}
					}
					
					moderoDisablePopup (dvTpStudentTableDragAndDrop, POPUP_NAME_MENU)
					resetMenuOnDragAndDropPanel ()
					
					channelOn (dvTpStudentTableDragAndDrop, BTN_DRAG_AND_DROP_INSTRUCTIONS)
					moderoEnableButtonAnimate (dvTpStudentTableDragAndDrop, BTN_DROP_AREA_MONITOR_STUDENT_TABLE, 0, 30, 2)
					moderoEnableButtonAnimate (dvTpStudentTableDragAndDrop, BTN_DROP_AREA_MONITOR_STUDENT_TABLE_DROP_ICON, 0, 30, 2)
					wait 100 'NEW_SIGNAL'
					{
						channelOff (dvTpStudentTableDragAndDrop, BTN_DRAG_AND_DROP_INSTRUCTIONS)
						moderoEnableButtonAnimate (dvTpStudentTableDragAndDrop, BTN_DROP_AREA_MONITOR_STUDENT_TABLE, 30, 1, 3)
						moderoEnableButtonAnimate (dvTpStudentTableDragAndDrop, BTN_DROP_AREA_MONITOR_STUDENT_TABLE_DROP_ICON, 0, 1, 3)
						moderoEnablePopupOnPage (dvTpStudentTableDragAndDrop, POPUP_NAME_MENU, PAGE_NAME_MAIN)
					}
				}
			}
			
			active (signalStatus != DVX_SIGNAL_STATUS_VALID_SIGNAL):
			{
				disableDragItem (vdvDragAndDropStudentTable, dvxVideoInput.port)
				hideDraggablePopup (vdvDragAndDropStudentTable, dvxVideoInput.port)
				blockDragItem (vdvDragAndDropStudentTable, dvxVideoInput.port)
			}
		}
	}
	
	// Energy saving - switch off monitors when signal has been disconnected for some time
	// if signal
	switch (signalStatus)
	{
		case DVX_SIGNAL_STATUS_VALID_SIGNAL:
		{
			if (dvxVideoInput.port == selectedVideoInputMonitorStudentTable)
			{
				cancel_wait 'WAIT_FOR_SIGNAL_OF_INPUT_ROUTED_TO_STUDENT_TABLE_TO_RETURN'
				
			}
			if (dvxVideoInput.port == selectedVideoInputProjector)
			{
				cancel_wait 'WAIT_FOR_SIGNAL_OF_INPUT_ROUTED_TO_PROJECTOR_TO_RETURN'
			}
		}
		
		case DVX_SIGNAL_STATUS_NO_SIGNAL:
		{
			if (dvxVideoInput.port == selectedVideoInputMonitorStudentTable)
			{
				wait waitTimeValidSignal 'WAIT_FOR_SIGNAL_OF_INPUT_ROUTED_TO_STUDENT_TABLE_TO_RETURN'
				{
					off [selectedVideoInputMonitorStudentTable]
				}
			}
			
			if (dvxVideoInput.port == selectedVideoInputProjector)
			{
				wait waitTimeValidSignal 'WAIT_FOR_SIGNAL_OF_INPUT_ROUTED_TO_PROJECTOR_TO_RETURN'
				{
					off [selectedVideoInputProjector]
				}
			}
		}
	}
}


/*
 * --------------------
 * Override dxlink-listener callback functions
 * --------------------
 */


#define INCLUDE_DXLINK_NOTIFY_TX_VIDEO_INPUT_AUTO_SELECT_CALLBACK
define_function dxlinkNotifyTxVideoInputAutoSelect (dev dxlinkTxPort1, char status[])
{
	// dxlinkTxPort1 is the port #1 on the DXLink Tx
	// status contains the auto video input select status (STATUS_ENABLE | STATUS_DISABLE | DXLINK_AUTO_SELECT_ANALOG_PRIORITY)
	
	if (dxlinkTxPort1 == dvDXlinkTxRpmMain)
	{
		switch (status)
		{
			case STATUS_DISABLE:
			{
				dxlinkEnableTxVideoInputAutoSelectPriotityDigital (dvDXlinkTxRpmMain)
			}
		}
	}
}






#end_if