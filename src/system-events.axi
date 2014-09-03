program_name='system-events'

#if_not_defined __SYSTEM_EVENTS__
#define __SYSTEM_EVENTS__

#include 'system-defines'
#include 'system-library-api'
#include 'system-library-control'
#include 'system-constants'
#include 'system-devices'
#include 'system-structures'
#include 'system-variables'
#include 'system-functions'
#include 'system-rms-api'

/*
 * -------------------------------------------------------------------
 * Events (Button, Channel, Custom, Data, Timeline)
 * -------------------------------------------------------------------
 */

define_event

data_event[vdvRmsGui]
{
	online:
	{
		// Alternatively, the touch panel can be designated for external use
		RmsSetExternalPanel(dvTpScheduling, dvTpSchedulingRms);
		
		// Set GUI defaults
		RmsSetDefaultEventBookingSubject('<Enter Meeting Subject>');
		RmsSetDefaultEventBookingBody('<Enter Meeting Details>');
		
		// Enable LED Support
		// Green => No event in progress
		// Red => Event in progress
		// LED support is enabled by default
		// RmsEnableLedSupport(TRUE);
		
		// Disable LED Support
		// RmsEnableLedSupport(FALSE);
	}
}

data_event [dvDXlinkTxRpmMain]
{
	online:
	{
		dxlinkEnableTxVideoInputAutoSelectPriotityDigital (dvDXlinkTxRpmMain)
	}
}

data_event [dvEncoderMain]
{
	online:
	{
		encoderRequestUsbPriority (dvEncoderMain)
		encoderRequestVideoStreamMode (dvEncoderMain)
		encoderRequestVideoStreamStatus (dvEncoderMain)
		encoderRequestVideoRecordControl (dvEncoderMain)
		encoderRequestVideoRecordStatus (dvEncoderMain)
		encoderRequestVideoInputStatus (dvEncoderMain)
		encoderRequestVideoInputResolution (dvEncoderMain)
		encoderRequestVideoInputFormat (dvEncoderMain)
	}
}

data_event [dvEncoderUsbFront]
{
	online:
	{
		if ([dvEncoderUsbFront,ENCODER_CHANNEL_USB_CONNECTED])
			encoder.usbStatusFront = ENCODER_USB_STATUS_CONNECTED
		else
			encoder.usbStatusFront = ENCODER_USB_STATUS_DISCONNECTED
	}
}

data_event [dvTpLecternEncoder]
{
	online:
	{
		encoderRequestUsbPriority (dvEncoderMain)
		encoderRequestVideoStreamMode (dvEncoderMain)
		encoderRequestVideoStreamStatus (dvEncoderMain)
		encoderRequestVideoRecordControl (dvEncoderMain)
		encoderRequestVideoRecordStatus (dvEncoderMain)
		encoderRequestVideoInputStatus (dvEncoderMain)
		encoderRequestVideoInputResolution (dvEncoderMain)
		encoderRequestVideoInputFormat (dvEncoderMain)
	}
}

data_event [dvEncoderUsbFront]
{
	online:
	{
		encoderRequestUsbStatus (dvEncoderUsbFront)
	}
}

data_event [dvDvxMain]
{
	online:
	{
		dvxRequestVideoInputNameAll (dvDvxMain)
		dvxRequestVideoInputStatusAll (dvDvxMain)
		dvxRequestInputVideo (dvDvxMain, dvDvxVidOutMonitorStudentTable.port)
		dvxRequestInputVideo (dvDvxMain, dvDvxVidOutProjector.port)
		dvxRequestInputAudio (dvDvxMain, dvDvxAudOutSpeakers.port)
		dvxRequestAudioOutputMute (dvDvxAudOutSpeakers)
		dvxRequestAudioOutputVolume (dvDvxAudOutSpeakers)
		
		// disable HDCP on all DVX inputs
		dvxDisableVideoInputHdcpCompliance (dvDvxVidInCamera)
		dvxDisableVideoInputHdcpCompliance (dvDvxVidInLecturnDocCam)
		dvxDisableVideoInputHdcpCompliance (dvDvxVidInLecturnEnzo)
		dvxDisableVideoInputHdcpCompliance (dvDvxVidInLecturnLaptopHdmi)
		dvxDisableVideoInputHdcpCompliance (dvDvxVidInLecturnLaptopVga)
		dvxDisableVideoInputHdcpCompliance (dvDvxVidInStudentEnzo)
		dvxDisableVideoInputHdcpCompliance (dvDvxVidInStudentLaptop1)
		dvxDisableVideoInputHdcpCompliance (dvDvxVidInStudentLaptop2)
		dvxDisableVideoInputHdcpCompliance (dvDvxVidInStudentLaptop3)
		dvxDisableVideoInputHdcpCompliance (dvDvxVidInStudentLaptop4)
	}
}

data_event [dvTxTable1VidInDigital]
data_event [dvTxTable2VidInDigital]
data_event [dvTxTable3VidInDigital]
data_event [dvTxTable4VidInDigital]
{
	online:
	{
		// disable HDCP on all DXLink MFTX's at the Student table
		// we don't want HDCP in the system as we can't stream it out the encoder
		dxlinkDisableTxVideoInputHdcpComplianceDigital (data.device)
	}
}

data_event [dvTpStudentTableDragAndDrop]
{
	online:
	{
		dvxRequestVideoInputNameAll (dvDvxMain)
		dvxRequestVideoInputStatusAll (dvDvxMain)
		dvxRequestInputVideo (dvDvxMain, dvDvxVidOutMonitorStudentTable.port)
		dvxRequestInputVideo (dvDvxMain, dvDvxVidOutProjector.port)
		dvxRequestInputAudio (dvDvxMain, dvDvxAudOutSpeakers.port)
		dvxRequestAudioOutputMute (dvDvxAudOutSpeakers)
		dvxRequestAudioOutputVolume (dvDvxAudOutSpeakers)
		
		// Define drag items - they will automatically be enabled by the module
		addDragItemsAll (vdvDragAndDropStudentTable)
	}
}


data_event [dvTpLecternVideo]
{
	online:
	{
		dvxRequestVideoInputNameAll (dvDvxMain)
		dvxRequestVideoInputStatusAll (dvDvxMain)
		dvxRequestInputVideo (dvDvxMain, dvDvxVidOutMonitorStudentTable.port)
		dvxRequestInputVideo (dvDvxMain, dvDvxVidOutProjector.port)
		dvxRequestInputAudio (dvDvxMain, dvDvxAudOutSpeakers.port)
		dvxRequestAudioOutputMute (dvDvxAudOutSpeakers)
		dvxRequestAudioOutputVolume (dvDvxAudOutSpeakers)
		
		moderoEnableButtonScaleToFit (dvTpLecternVideo, BTN_ADR_SELECTED_SOURCE_PREVIEW,MODERO_BUTTON_STATE_ALL)
	}
}



data_event [vdvDragAndDropStudentTable]
{
	string:
	{
		stack_var char header[50]
		local_var integer isClockwiseOrientation
		
		header = remove_string (data.text,DELIM_HEADER,1)
		
		switch (header)
		{
			case 'DRAG_ITEM_SELECTED-':
			{
				stack_var integer idDragItem
				stack_var integer idDragItemsToBlock[3]
				stack_var integer i
				
				idDragItem = atoi(data.text)
				
				
				// remove the other drag items (don't want to allow multiple item selection in this instance)
				select
				{
					active (idDragItem == dvDvxVidInStudentLaptop1.port):
					{
						idDragItemsToBlock[1] = dvDvxVidInStudentLaptop2.port
						idDragItemsToBlock[2] = dvDvxVidInStudentLaptop3.port
						idDragItemsToBlock[3] = dvDvxVidInStudentLaptop3.port
						
						moderoSetButtonBitmap (dvTpStudentTableDragAndDrop, BTN_DRAG_AND_DROP_INSTRUCTIONS, MODERO_BUTTON_STATE_ON, IMAGE_FILE_NAME_DRAG_AND_DROP_INSTRUCTIONS_LAPTOP_1)
					}
					
					active (idDragItem == dvDvxVidInStudentLaptop2.port):
					{
						idDragItemsToBlock[1] = dvDvxVidInStudentLaptop1.port
						idDragItemsToBlock[2] = dvDvxVidInStudentLaptop3.port
						idDragItemsToBlock[3] = dvDvxVidInStudentLaptop4.port
						
						moderoSetButtonBitmap (dvTpStudentTableDragAndDrop, BTN_DRAG_AND_DROP_INSTRUCTIONS, MODERO_BUTTON_STATE_ON, IMAGE_FILE_NAME_DRAG_AND_DROP_INSTRUCTIONS_LAPTOP_2)
					}
					
					active (idDragItem == dvDvxVidInStudentLaptop3.port):
					{
						idDragItemsToBlock[1] = dvDvxVidInStudentLaptop1.port
						idDragItemsToBlock[2] = dvDvxVidInStudentLaptop2.port
						idDragItemsToBlock[3] = dvDvxVidInStudentLaptop4.port
						
						moderoSetButtonBitmap (dvTpStudentTableDragAndDrop, BTN_DRAG_AND_DROP_INSTRUCTIONS, MODERO_BUTTON_STATE_ON, IMAGE_FILE_NAME_DRAG_AND_DROP_INSTRUCTIONS_LAPTOP_3)
					}
					
					active (idDragItem == dvDvxVidInStudentLaptop4.port):
					{
						idDragItemsToBlock[1] = dvDvxVidInStudentLaptop1.port
						idDragItemsToBlock[2] = dvDvxVidInStudentLaptop2.port
						idDragItemsToBlock[3] = dvDvxVidInStudentLaptop3.port
						
						moderoSetButtonBitmap (dvTpStudentTableDragAndDrop, BTN_DRAG_AND_DROP_INSTRUCTIONS, MODERO_BUTTON_STATE_ON, IMAGE_FILE_NAME_DRAG_AND_DROP_INSTRUCTIONS_LAPTOP_4)
					}
				}
				
				// make it impossible to select the other drag areas
				for (i = 1; i <= MAX_LENGTH_ARRAY(idDragItemsToBlock); i++)
				{
					disableDragItem (vdvDragAndDropStudentTable, idDragItemsToBlock[i])
					blockDragItem (vdvDragAndDropStudentTable, idDragItemsToBlock[i])
				}
				
				// Define drop areas based on which side was selected
				select
				{
					active (idDragItem == dvDvxVidInStudentLaptop1.port OR idDragItem == dvDvxVidInStudentLaptop3.port):
					{
						isClockwiseOrientation = true
						
						// NOTE: Don't call addPanelDropArea from here!
						// 10" is a special case where the  an assignment of the drop areas to the displays is dynamic
						// based on which sources (drag items) are selected by the user so as to orient buttons and graphics to
						// the side of the panel that the user is located.
						if (dvx.videoInputs[idDragItem].status == DVX_SIGNAL_STATUS_VALID_SIGNAL)
						{
							sendCommand (vdvDragAndDropStudentTable, "'DEFINE_DROP_AREA-',buildDragAndDropParameterString(dvDvxVidOutMonitorStudentTable.port, dropAreaLeftOrientationMonitorStudentTable)")
						}
						
						moderoSetButtonBitmap (dvTpStudentTableDragAndDrop, BTN_DROP_AREA_MONITOR_STUDENT_TABLE_DROP_ICON, MODERO_BUTTON_STATE_ALL, IMAGE_FILE_NAME_DROP_ICON_ROTATE_90_DEGREES_CLOCKWISE)
					}
					
					active (idDragItem == dvDvxVidInStudentLaptop2.port OR idDragItem == dvDvxVidInStudentLaptop4.port):
					{
						isClockwiseOrientation = false
						
						// NOTE: Don't call addPanelDropArea from here!
						// 10" is a special case where the  an assignment of the drop areas to the displays is dynamic
						// based on which sources (drag items) are selected by the user so as to orient buttons and graphics to
						// the side of the panel that the user is located.
						if (dvx.videoInputs[idDragItem].status == DVX_SIGNAL_STATUS_VALID_SIGNAL)
						{
							sendCommand (vdvDragAndDropStudentTable, "'DEFINE_DROP_AREA-',buildDragAndDropParameterString(dvDvxVidOutMonitorStudentTable.port, dropAreaRightOrientationMonitorStudentTable)")
						}
						
						moderoSetButtonBitmap (dvTpStudentTableDragAndDrop, BTN_DROP_AREA_MONITOR_STUDENT_TABLE_DROP_ICON, MODERO_BUTTON_STATE_ALL, IMAGE_FILE_NAME_DROP_ICON_ROTATE_90_DEGREES_COUNTER_CLOCKWISE)
					}
				}
				
				// hide audio/lighting control popups
				moderoDisablePopup (dvTpStudentTableDragAndDrop, POPUP_NAME_CONTROLS_AUDIO)
				moderoDisablePopup (dvTpStudentTableDragAndDrop, POPUP_NAME_CONTROLS_LIGHTING)
				moderoDisablePopup (dvTpStudentTableDragAndDrop, POPUP_NAME_MENU)
				resetMenuOnDragAndDropPanel ()
				
				// show buttons for the monitors
				cancel_wait 'FIRST_TIME_USER'
				cancel_wait 'NEW_SIGNAL'
				moderoEnableButtonAnimate (dvTpStudentTableDragAndDrop, BTN_DROP_AREA_MONITOR_STUDENT_TABLE, 0, 30, 2)
				moderoEnableButtonAnimate (dvTpStudentTableDragAndDrop, BTN_DROP_AREA_MONITOR_STUDENT_TABLE_DROP_ICON, 0, 30, 2)
				
				channelOn (dvTpStudentTableDragAndDrop, BTN_DRAG_AND_DROP_INSTRUCTIONS)
			}
			
			case 'DRAG_ITEM_DESELECTED-':
			{
				stack_var integer idDragItem
				
				idDragItem = atoi(data.text)
				
				// Define drag items again
				//enableDragItemsAll (vdvDragAndDropStudentTable)
				enableDragItemsAllWithValidSignal (vdvDragAndDropStudentTable)
				
				// delete the drop areas for the monitors
				disableDropAreasAll (vdvDragAndDropStudentTable)
				
				// reset the draggable popup position by hiding it and then showing it again
				resetDraggablePopup (vdvDragAndDropStudentTable, idDragItem)
				
				// unblock all of the drag items
				//unblockDragItemsAll (vdvDragAndDropStudentTable)
				unblockDragItemsAllWithValidSignal (vdvDragAndDropStudentTable)
				
				// hide the buttons for the monitors after a short time
				// allows user unfamiliar with the drag and drop interface to read innstructions
				wait 20 'FIRST_TIME_USER'
				{
					moderoEnableButtonAnimate (dvTpStudentTableDragAndDrop, BTN_DROP_AREA_MONITOR_STUDENT_TABLE, 30, 1, 3)
					moderoEnableButtonAnimate (dvTpStudentTableDragAndDrop, BTN_DROP_AREA_MONITOR_STUDENT_TABLE_DROP_ICON, 0, 1, 3)
					
					moderoEnablePopupOnPage (dvTpStudentTableDragAndDrop, POPUP_NAME_MENU, PAGE_NAME_MAIN)
					
					channelOff (dvTpStudentTableDragAndDrop, BTN_DRAG_AND_DROP_INSTRUCTIONS)
				}
			}
			
			case 'DRAG_ITEM_ENTER_DROP_AREA-':
			{
				stack_var integer idDragItem
				stack_var integer idDropArea
				stack_var integer btnDropArea
				
				idDragItem = atoi(remove_string(data.text,DELIM_PARAM,1))
				idDropArea = atoi(data.text)
				
				if (dvx.videoInputs[idDragItem].status == DVX_SIGNAL_STATUS_VALID_SIGNAL)
				{
					select
					{
						active (idDropArea == dvDvxVidOutMonitorStudentTable.port):
						{
							if (isClockwiseOrientation)
								btnDropArea = BTN_DROP_AREA_MONITOR_STUDENT_TABLE
							else
								btnDropArea = BTN_DROP_AREA_MONITOR_STUDENT_TABLE
						}
					}
					
					moderoEnableButtonAnimate (dvTpStudentTableDragAndDrop, btnDropArea, 30, 60, 1)
				}
				
			}
			
			case 'DRAG_ITEM_EXIT_DROP_AREA-':
			{
				stack_var integer idDragItem
				stack_var integer idDropArea
				stack_var integer btnDropArea
				
				idDragItem = atoi(remove_string(data.text,DELIM_PARAM,1))
				idDropArea = atoi(data.text)
				
				if (dvx.videoInputs[idDragItem].status == DVX_SIGNAL_STATUS_VALID_SIGNAL)
				{
					select
					{
						active (idDropArea == dvDvxVidOutMonitorStudentTable.port):
						{
							if (isClockwiseOrientation)
								btnDropArea = BTN_DROP_AREA_MONITOR_STUDENT_TABLE
							else
								btnDropArea = BTN_DROP_AREA_MONITOR_STUDENT_TABLE
						}
					}
					
					moderoEnableButtonAnimate (dvTpStudentTableDragAndDrop, btnDropArea, 60, 30, 2)
				}
				
			}
			
			case 'DRAG_ITEM_DROPPED_ON_DROP_AREA-':
			{
				stack_var integer idDragItem
				stack_var integer idDropArea
				stack_var integer btnDropArea
				
				idDragItem = atoi(remove_string(data.text,DELIM_PARAM,1))
				idDropArea = atoi(data.text)
				
				// Define drag items again
				enableDragItemsAllWithValidSignal (vdvDragAndDropStudentTable)
				
				// unblock all of the drag items
				unblockDragItemsAllWithValidSignal (vdvDragAndDropStudentTable)
				
				// delete the drop areas for the monitors
				disableDropAreasAll (vdvDragAndDropStudentTable)
				
				// hide the buttons for the monitors
				#warn '@TODO'
				
				// switch the selected input to the selected output
				showSourceOnDisplay (idDragItem, idDropArea)
				
				moderoEnableButtonAnimate (dvTpStudentTableDragAndDrop, BTN_DROP_AREA_MONITOR_STUDENT_TABLE, 0, 1, 0)
				moderoEnableButtonAnimate (dvTpStudentTableDragAndDrop, BTN_DROP_AREA_MONITOR_STUDENT_TABLE_DROP_ICON, 0, 1, 0)
				
				moderoEnablePopupOnPage (dvTpStudentTableDragAndDrop, POPUP_NAME_MENU, PAGE_NAME_MAIN)
				
				channelOff (dvTpStudentTableDragAndDrop, BTN_DRAG_AND_DROP_INSTRUCTIONS)
				
				// reset the draggable popup position by hiding it and then showing it again
				resetDraggablePopup (vdvDragAndDropStudentTable, idDragItem)
			}
		}
	}
}



data_event [dvTpStudentTableDragAndDrop]
{
	online:
	{
		moderoEnablePageTracking (dvTpStudentTableDragAndDrop)
	}
	string:
	{
		switch (data.text)
		{
			case 'AWAKE':
			{
			}
			
			case 'ASLEEP':
			{
			}
			
			case 'STANDBY':
			{
			}
			
			case 'SHUTDOWN':
			{
			}
			
			case 'STARTUP':
			{
			}
			
			default:
			{
				if (find_string(data.text, "'PAGE-',PAGE_NAME_MAIN", 1) == 1)
				{
					// Define drag items again
					enableDragItemsAllWithValidSignal (vdvDragAndDropStudentTable)
					
					// delete the drop areas for the monitors
					disableDropAreasAll (vdvDragAndDropStudentTable)
					
					// reset the draggable popup position by hiding it and then showing it again
					resetAllDraggablePopups (vdvDragAndDropStudentTable)
					
					// unblock all of the drag items
					unblockDragItemsAllWithValidSignal (vdvDragAndDropStudentTable)
					
					moderoEnablePopupOnPage (dvTpStudentTableDragAndDrop, POPUP_NAME_MENU, PAGE_NAME_MAIN)
				}
			}
		}
	}
}


button_event [dvTpLecternVideo,btnsVideoSnapshotPreviews]
{
	push:
	{
		stack_var integer input
		
		input = get_last (btnsVideoSnapshotPreviews)
		
		if (dvx.videoInputs[input].status == DVX_SIGNAL_STATUS_VALID_SIGNAL)	// selected an input with a valid signal
		{
			selectedVideoInputLecternPanel = input
			
			if ( (selectedVideoInputLecternPanel == dvDvxVidInLecturnDocCam.port) or
				 (selectedVideoInputLecternPanel == dvDvxVidInLecturnEnzo.port) or
				 (selectedVideoInputLecternPanel == dvDvxVidInLecturnLaptopHdmi.port) or
				 (selectedVideoInputLecternPanel == dvDvxVidInLecturnLaptopVga.port) )
			{
				// switch the projector output to the "None" input
				dvxSwitchAll (dvDvxMain, selectedVideoInputLecternPanel, dvDvxVidOutProjector.port)
				snapiDisplayEnablePower (vdvProjector)
				
				moderoSetButtonText (dvTpLecternVideo, BTN_ADR_SELECTED_SOURCE_LABEL, MODERO_BUTTON_STATE_ALL, "'Teaching Station - ',dvx.videoInputs[selectedVideoInputLecternPanel].name")
			}
			else if ( (selectedVideoInputLecternPanel == dvDvxVidInStudentLaptop1.port) or
					  (selectedVideoInputLecternPanel == dvDvxVidInStudentLaptop2.port) or
					  (selectedVideoInputLecternPanel == dvDvxVidInStudentLaptop3.port) or
					  (selectedVideoInputLecternPanel == dvDvxVidInStudentLaptop4.port) or
					  (selectedVideoInputLecternPanel == dvDvxVidInStudentEnzo.port) )
			{
				moderoSetButtonText (dvTpLecternVideo, BTN_ADR_SELECTED_SOURCE_LABEL, MODERO_BUTTON_STATE_ALL, "'Student Pod A - ',dvx.videoInputs[selectedVideoInputLecternPanel].name")
			}
			
			// copy the image from the selected source snapshot button
			moderoButtonCopyAttribute (dvTpLecternVideo,
									   dvTpLecternVideo.port,
									   btnAdrsVideoSnapshotPreviews[selectedVideoInputLecternPanel],
									   MODERO_BUTTON_STATE_OFF,
									   BTN_ADR_SELECTED_SOURCE_PREVIEW,
									   MODERO_BUTTON_STATE_ALL,
									   MODERO_BUTTON_ATTRIBUTE_BITMAP)
			
			
			sendCommand (vdvMultiPreview, "'VIDEO_PREVIEW-',itoa(input)")
			
			moderoEnablePopup (dvTpLecternVideo, 'select-video-destination')
		}
		else	// selected an input with no signal
		{
			moderoPlaySoundFile (dvTpLecternVideo, 'invalid-selection.wav')
		}
	}
}

button_event [dvTpLecternVideo, 0]
{
	push:
	{
		switch (button.input.channel)
		{
			case BTN_SELECT_VIDEO_DESTINATION_PROJECTOR:
			{
				snapiDisplayEnablePower (vdvProjector)
				if (selectedVideoInputLecternPanel == dvx.switchStatusVideoOutputs[dvDvxVidOutProjector.port])
					dvxSwitchAll (dvDvxMain, DVX_PORT_VID_IN_NONE, dvDvxVidOutProjector.port)
				else
					dvxSwitchAll (dvDvxMain, selectedVideoInputLecternPanel, dvDvxVidOutProjector.port)
			}
			case BTN_SELECT_VIDEO_DESTINATION_STUDENT_POD_A:
			{
				if (selectedVideoInputLecternPanel == dvx.switchStatusVideoOutputs[dvDvxVidOutMonitorStudentTable.port])
					dvxSwitchAll (dvDvxMain, DVX_PORT_VID_IN_NONE, dvDvxVidOutMonitorStudentTable.port)
				else
					dvxSwitchAll (dvDvxMain, selectedVideoInputLecternPanel, dvDvxVidOutMonitorStudentTable.port)
			}
			case BTN_SELECT_VIDEO_DESTINATION_STUDENT_POD_B:
			{
				if (selectedVideoInputLecternPanel = selectedInputStudentPodB)
					selectedInputStudentPodB = DVX_PORT_VID_IN_NONE
				else
					selectedInputStudentPodB = selectedVideoInputLecternPanel
			}
			case BTN_SELECT_VIDEO_DESTINATION_STUDENT_POD_C:
			{
				if (selectedVideoInputLecternPanel = selectedInputStudentPodC)
					selectedInputStudentPodC = DVX_PORT_VID_IN_NONE
				else
					selectedInputStudentPodC = selectedVideoInputLecternPanel
			}
		}
	
		
	}
}

button_event [dvTpLecternVideo,btnExitVideoPreview]
{
	push:
	{
		sendCommand (vdvMultiPreview, "'SNAPSHOTS'")
	}
}

button_event [dvTpLecternLighting, 0]
{
	push:
	{
		switch (button.input.channel)
		{
			case BTN_LIGHTS_OFF:	lightsMode = LIGHTS_MODE_OFF
			case BTN_LIGHTS_LOW:	lightsMode = LIGHTS_MODE_LOW
			case BTN_LIGHTS_MID:	lightsMode = LIGHTS_MODE_MID
			case BTN_LIGHTS_FULL:	lightsMode = LIGHTS_MODE_FULL
		}
	}
}

button_event [dvTpLecternAudio, 0]
{
	push:
	{
		switch (button.input.channel)
		{
			case BTN_AUDIO_MUTE:
			{
				dvxCycleAudioOutputVolumeMute (dvDvxAudOutSpeakers)
			}
		}
	}
}

button_event [dvTpLecternMain, BTN_SYSTEM_OFF]
{
	push:
	{
		// take the UI back to the splash screen
		moderoSetPage (dvTpLecternMain, 'splash')
		// hide all popups
		moderoDisableAllPopups (dvTpLecternMain)
		// disable mute
		dvxDisableAudioOutputMute (dvDvxAudOutSpeakers)
		// reset lighting back to medium
		lightsMode = LIGHTS_MODE_MID
		// send multi-preview module back to snapshots mode
		sendCommand (vdvMultiPreview, "'SNAPSHOTS'")
		// switch the projector output to the "None" input
		dvxSwitchAll (dvDvxMain, DVX_PORT_VID_IN_NONE, dvDvxVidOutProjector.port)
		// switch the encoder output to the "None" input
		dvxSwitchAll (dvDvxMain, DVX_PORT_VID_IN_NONE, dvDvxVidOutEncoder.port)
		// Stop recording on encoder
		encoderDisableVideoRecording (dvEncoderMain)
		// Stop Streaming on encoder
		encoderDisableVideoStream (dvEncoderMain)
		
		enzoSessionEnd (dvEnzoLecturn)
		
		// what do we do with the student table???
		//	Options:
		//		A) switch to none (to show AMX Uni Logo) and send Student table to splash screen
		//		B check if student monitor showing student table source and if it is do nothing otherwise option A as listed above
		if ( (dvx.switchStatusVideoOutputs[dvDvxVidOutMonitorStudentTable.port] != dvDvxVidInStudentLaptop1.port) and
		     (dvx.switchStatusVideoOutputs[dvDvxVidOutMonitorStudentTable.port] != dvDvxVidInStudentLaptop2.port) and
			 (dvx.switchStatusVideoOutputs[dvDvxVidOutMonitorStudentTable.port] != dvDvxVidInStudentLaptop3.port) and
			 (dvx.switchStatusVideoOutputs[dvDvxVidOutMonitorStudentTable.port] != dvDvxVidInStudentLaptop4.port) and
			 (dvx.switchStatusVideoOutputs[dvDvxVidOutMonitorStudentTable.port] != dvDvxVidInStudentEnzo.port) )
		{
			// switch the student monitor output to the "None" input
			dvxSwitchAll (dvDvxMain, DVX_PORT_VID_IN_NONE, dvDvxVidOutMonitorStudentTable.port)
			// send the student table 10" monitor to the "splash" page
			moderoSetPage (dvTpStudentTableDragAndDrop, 'splash')
			enzoSessionEnd (dvEnzoStudentTable)
		}
		
		WAIT waitTimeToShowSignageOnProjector 'SHOW SIGNAGE ON PROJECTOR'
		{
			snapiDisplaySetInput (vdvProjector, 'HDMI2')
		}
	}
}

button_event [dvTpLecternMain, BTN_SWIPE_DOWN_TO_COLLABORATE]
{
	push:
	{
		CANCEL_WAIT 'SHOW SIGNAGE ON PROJECTOR'
		snapiDisplaySetInput (vdvProjector, 'HDMI1')
	}
}

button_event [dvTpLecternEncoder, 0]
{
	push:
	{
		switch (button.input.channel)
		{
			case BTN_ENCODER_SELECT_SOURCE_PRESENTATION:
			{
				// need to make sure to follow the presentation so whatever gets switched to the projector also gets switched to the encoder
				on[encoderFollowingProjector]
				// switch the input currently routed to the projector to the encoder
				dvxSwitchVideoOnly (dvDvxMain, dvx.switchStatusVideoOutputs[dvDvxVidOutProjector.port], dvDvxVidOutEncoder.port)
			}
			
			case BTN_ENCODER_SELECT_SOURCE_CAMERA:
			{
				// need to make sure to not follow the presentation any more
				off[encoderFollowingProjector]
				// switch the video (and only video) from the camera input on the DVX to the Encoder output
				dvxSwitchVideoOnly (dvDvxMain, dvDvxVidInCamera.port, dvDvxVidOutEncoder.port)
			}
			
			case BTN_ENCODER_STREAM_START_STOP:
			{
				if ( (encoder.streamStatus == ENCODER_STREAM_STATUS_STARTING) or (encoder.streamStatus == ENCODER_STREAM_STATUS_STARTED) )
				{
					encoderDisableVideoStream (dvEncoderMain)
				}
				else if ( (encoder.streamStatus == ENCODER_STREAM_STATUS_STOPPED) or (encoder.streamStatus == ENCODER_STREAM_STATUS_SUSPENDED) )
				{
					encoderEnableVideoStream (dvEncoderMain)
				}
			}
			
			case BTN_ENCODER_RECORD_START_STOP:
			{
				if ( (encoder.recordStatus == ENCODER_RECORDING_STATUS_STARTING) or (encoder.recordStatus == ENCODER_RECORDING_STATUS_STARTED) )
				{
					encoderDisableVideoRecording (dvEncoderMain)
				}
				else if ( (encoder.recordStatus == ENCODER_RECORDING_STATUS_STOPPED) or (encoder.recordStatus == ENCODER_RECORDING_STATUS_SUSPENDED) )
				{
					if (encoder.usbStatusFront == ENCODER_USB_STATUS_CONNECTED)
						encoderEnableVideoRecording (dvEncoderMain)
					else if (encoder.usbStatusFront == ENCODER_USB_STATUS_DISCONNECTED)
						moderoPlaySoundFile (dvTpLecternVideo, 'invalid-selection.wav')
				}
			}
		}
	}
}

button_event[dvTpStudentTableDragAndDrop,0]
{
	push:
	{
		switch (button.input.channel)
		{
			case BTN_STUDENT_TABLE_SELECT_ENZO:
			{
				// switch DVX output to student monitor to DVX input connected to Student Enzo.
				dvxSwitchVideoOnly (dvDvxMain, dvDvxVidInStudentEnzo.port,  dvDvxVidOutMonitorStudentTable.port)
			}
			
			case BTN_STUDENT_TABLE_SHUTDOWN:
			{
				// switch DVX output to student monitor to DVX input "none".
				dvxSwitchVideoOnly (dvDvxMain, DVX_PORT_VID_IN_NONE, dvDvxVidOutMonitorStudentTable.port)
				// send student panel to splash screen
				moderoSetPage (dvTpStudentTableDragAndDrop, PAGE_NAME_SPLASH) // don't really need to do this since the panel file does it already
				
				enzoSessionEnd (dvEnzoStudentTable)
			}
		}
	}
}


#end_if