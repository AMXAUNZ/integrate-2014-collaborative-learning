program_name='system-modules'

#if_not_defined __SYSTEM_MODULES__
#define __SYSTEM_MODULES__

#include 'system-devices'
#include 'system-variables'

/*
 * -------------------------------------------------------------------
 * Module Instantiations
 * -------------------------------------------------------------------
 */

define_module

// drag and drop module for the student table
'drag-and-drop' dragAndDropMod (vdvDragAndDropStudentTable, dvTpStudentTableDragAndDrop)

'multi-preview-dvx' multiPreviewDvx (vdvMultiPreview,
                                     dvDvxVidOutMultiPreview, 
                                     dvTpLecternVideo, 
                                     btnsVideoSnapshotPreviews,          // address codes
                                     btnAdrsVideoSnapshotPreviews,       // address codes
                                     btnAdrsVideoInputLabels,            // address codes
                                     btnAdrsVideoOutputSnapshotPreviews, // address codes
									 btnAdrsVideoOutputLabels,
                                     btnAdrVideoPreviewLoadingMessage,   // address code
                                     btnLoadingBarMultiState,            // channel code
                                     btnAdrLoadingBar,                   // address code
                                     btnAdrVideoPreviewWindow,           // address code
                                     btnExitVideoPreview,                // channel code
                                     popupNameVideoPreview,
                                     imageFileNameNoVideo)

'DeviceDriverEngine' projector (vdvProjector, dvRxProjectorSerial, xddEpsonProjector)

'RmsNetLinxAdapter_dr4_0_0' mdlRMSNetLinx(vdvRMS)

'RmsClientGui_dr4_0_0' mdlRMSGUI(vdvRMSGui,dvRMSTP,dvRMSTP_Base)

'RmsControlSystemMonitor' mdlRmsControlSystemMonitorMod(vdvRMS,dvMaster)

'RmsTouchPanelMonitor' mdlRmsTouchPanelMonitorMod_1(vdvRMS,dvTpScheduling)


#end_if