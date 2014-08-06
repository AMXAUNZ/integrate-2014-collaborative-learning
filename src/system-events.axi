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

/*
 * -------------------------------------------------------------------
 * Events (Button, Channel, Custom, Data, Timeline)
 * -------------------------------------------------------------------
 */

define_event

data_event [dvDvxMain]
{
	online:
	{
		dvxRequestVideoInputNameAll (dvDvxMain)
		dvxRequestVideoInputStatusAll (dvDvxMain)
		dvxRequestInputVideo (dvDvxMain, dvDvxVidOutMonitorStudentTable.port)
		dvxRequestInputVideo (dvDvxMain, dvDvxVidOutProjectorAndMultiPip.port)
		dvxRequestInputAudio (dvDvxMain, dvDvxAudOutSpeakers.port)
		dvxRequestAudioOutputMute (dvDvxAudOutSpeakers)
		dvxRequestAudioOutputVolume (dvDvxAudOutSpeakers)
	}
}

data_event [vdvDragAndDropStudentTable]
{
	online:
	{
		// Define drag items - they will automatically be enabled by the module
		addDragItemsAll (vdvDragAndDropStudentTable)
	}
	
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
						
						/*moderoSetButtonText (dvTpStudentTableDragAndDrop, BTN_DROP_AREA_10_INCH_PANEL_DESTINATION_A, MODERO_BUTTON_STATE_ALL, 'Left')
						moderoSetButtonText (dvTpStudentTableDragAndDrop, BTN_DROP_AREA_10_INCH_PANEL_DESTINATION_B, MODERO_BUTTON_STATE_ALL, 'Right')*/
						
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
						
						/*moderoSetButtonText (dvTpStudentTableDragAndDrop, BTN_DROP_AREA_10_INCH_PANEL_DESTINATION_A, MODERO_BUTTON_STATE_ALL, 'Right')
						moderoSetButtonText (dvTpStudentTableDragAndDrop, BTN_DROP_AREA_10_INCH_PANEL_DESTINATION_B, MODERO_BUTTON_STATE_ALL, 'Left')*/
						
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
				enableDragItemsAll (vdvDragAndDropStudentTable)
				
				// delete the drop areas for the monitors
				disableDropAreasAll (vdvDragAndDropStudentTable)
				
				// reset the draggable popup position by hiding it and then showing it again
				resetDraggablePopup (vdvDragAndDropStudentTable, idDragItem)
				
				// unblock all of the drag items
				unblockDragItemsAll (vdvDragAndDropStudentTable)
				
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
				
				//channelOn (dvTpStudentTableDragAndDrop, btnDropArea)
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
				
				//channelOff (dvTpStudentTableDragAndDrop, btnDropArea)
			}
			
			case 'DRAG_ITEM_DROPPED_ON_DROP_AREA-':
			{
				stack_var integer idDragItem
				stack_var integer idDropArea
				stack_var integer btnDropArea
				
				idDragItem = atoi(remove_string(data.text,DELIM_PARAM,1))
				idDropArea = atoi(data.text)
				
				// Define drag items again
				enableDragItemsAll (vdvDragAndDropStudentTable)
				
				// unblock all of the drag items
				unblockDragItemsAll (vdvDragAndDropStudentTable)
				
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
					enableDragItemsAll (vdvDragAndDropStudentTable)
					
					// delete the drop areas for the monitors
					disableDropAreasAll (vdvDragAndDropStudentTable)
					
					// reset the draggable popup position by hiding it and then showing it again
					resetAllDraggablePopups (vdvDragAndDropStudentTable)
					
					// unblock all of the drag items
					unblockDragItemsAll (vdvDragAndDropStudentTable)
					
					moderoEnablePopupOnPage (dvTpStudentTableDragAndDrop, POPUP_NAME_MENU, PAGE_NAME_MAIN)
				}
			}
		}
	}
}



#end_if