program_name='system-constants'

#if_not_defined __SYSTEM_CONSTANTS__
#define __SYSTEM_CONSTANTS__

/*
 * -------------------------------------------------------------------
 * Declared Constants
 * -------------------------------------------------------------------
 */

define_constant


/*
 * --------------------
 * Device Id's
 * --------------------
 */
integer DEV_ID_MASTER                               = 0
integer DEV_ID_DVX_CONTROLLER                       = 5001
integer DEV_ID_DVX_SWITCHER                         = 5002
integer DEV_ID_ENCODER                              = 6001
integer DEV_ID_TX_1                                 = 7001
integer DEV_ID_TX_2                                 = 7002
integer DEV_ID_TX_3                                 = 7003
integer DEV_ID_TX_4                                 = 7004
integer DEV_ID_RX_PROJECTOR                         = 8001
integer DEV_ID_RX_MONITOR_STUDENT_TABLE             = 8002
integer DEV_ID_ENZO_LECTURN                         = 9001
integer DEV_ID_ENZO_STUDENT_TABLE                   = 9001
integer DEV_ID_TOUCH_PANEL_LECTERN                  = 10001
integer DEV_ID_TOUCH_PANEL_STUDENT_TABLE            = 10002
integer DEV_ID_TOUCH_PANEL_SCHEDULING               = 10003
integer DEV_ID_VIRTUAL_DRAG_AND_DROP_STUDENT_TABLE  = 33001
integer DEV_ID_VIRTUAL_MULTI_PREVIEW                = 33002
integer DEV_ID_VIRTUAL_RMS                          = 41001
integer DEV_ID_VIRTUAL_RMS_GUI                      = 41002
integer DEV_ID_VIRTUAL_PROJECTOR                    = 41003
integer DEV_ID_VIRTUAL_MONITOR_STUDENT_TABLE        = 41004


/*
 * --------------------
 * Device ports
 * --------------------
 */
 
 // Virtual device main port
integer PORT_VIRTUAL_MAIN       = 1

 // Encoder ports
integer PORT_ENCODER_MAIN       = 1
integer PORT_ENCODER_USB_FRONT  = 1
integer PORT_ENCODER_USB_BACK   = 2

// Touch Panel Ports
integer PORT_TP_MAIN            = 1
integer PORT_TP_LIGHTING        = 2
integer PORT_TP_VIDEO           = 3
integer PORT_TP_AUDIO           = 4
integer PORT_TP_ENCODER         = 5
integer PORT_TP_RMS             = 9
integer PORT_TP_DEBUG           = 100

// DVX Controller Serial Ports
integer PORT_DVX_CONTROLLER_MAIN    = 1
integer PORT_DVX_SERIAL_1           = 1
integer PORT_DVX_SERIAL_2           = 2
integer PORT_DVX_SERIAL_3           = 3
integer PORT_DVX_SERIAL_4           = 4
integer PORT_DVX_SERIAL_5           = 5
integer PORT_DVX_SERIAL_6           = 6
integer PORT_DVX_RELAYS             = 8
integer PORT_DVX_IR_1               = 9
integer PORT_DVX_IR_2               = 10
integer PORT_DVX_IR_3               = 11
integer PORT_DVX_IR_4               = 12
integer PORT_DVX_IR_5               = 13
integer PORT_DVX_IR_6               = 14
integer PORT_DVX_IR_7               = 15
integer PORT_DVX_IR_8               = 16
integer PORT_DVX_IOS                = 17

// Enzo port
integer PORT_ENZO_MAIN = 1

// Axlink port - always 1
integer PORT_AXLINK = 1

// System IDs
integer SYS_MASTER  = 0

/*
 * --------------------
 * Student table 10" panel button channel, address, and level codes
 * --------------------
 */

integer BTN_STUDENT_TABLE_SELECT_ENZO = 5
integer BTN_STUDENT_TABLE_SHUTDOWN = 3

// Drag Items
integer BTN_DRAG_ITEM_SOURCE_1      = 1
integer BTN_DRAG_ITEM_SOURCE_2      = 2
integer BTN_DRAG_ITEM_SOURCE_3      = 3
integer BTN_DRAG_ITEM_SOURCE_4      = 4

integer BTN_DRAG_ITEMS_VIDEO_SOURCES[] = 
{
	1,
	2,
	3,
	4
}

// Drop Items
integer BTN_DROP_AREA_MONITOR_STUDENT_TABLE  = 11
integer BTN_DROP_AREA_MONITOR_STUDENT_TABLE_DROP_ICON = 13

// Drag and Drop Instructions that appear to the user
integer BTN_DRAG_AND_DROP_INSTRUCTIONS = 70

/*
 * --------------------
 * Page and popup page names
 * --------------------
 */

char POPUP_NAME_CONTROLS_AUDIO[]         = 'volume'
char POPUP_NAME_CONTROLS_LIGHTING[]      = 'lighting'
char PAGE_NAME_SPLASH[]                  = 'splash'
char PAGE_NAME_MAIN[]                    = 'main'
char POPUP_NAME_MENU[]                   = 'menu'

char POPUP_NAME_DRAGGABLE_SOURCE_TABLE_LAPTOP_1[] = 'draggable-source-laptop-1'
char POPUP_NAME_DRAGGABLE_SOURCE_TABLE_LAPTOP_2[] = 'draggable-source-laptop-2'
char POPUP_NAME_DRAGGABLE_SOURCE_TABLE_LAPTOP_3[] = 'draggable-source-laptop-3'
char POPUP_NAME_DRAGGABLE_SOURCE_TABLE_LAPTOP_4[] = 'draggable-source-laptop-4'

char POPUP_NAMES_DRAGGABLE_SOURCES[][50] = 
{
	'draggable-source-laptop-1',
	'draggable-source-laptop-2',
	'draggable-source-laptop-3',
	'draggable-source-laptop-4'
}

/*
 * --------------------
 * Lighting Modes
 * --------------------
 */

integer LIGHTS_MODE_OFF = 1
integer LIGHTS_MODE_LOW = 2
integer LIGHTS_MODE_MID = 3
integer LIGHTS_MODE_FULL = 4


/*
 * --------------------
 * RMS variables
 * --------------------
 */

// define the main starting touch panel page name
CHAR mainPanelPage[] = 'rmsMainPage';
// alternatively, the main page could be set to the scheduling
// page named: 'rmsSchedulingPage'
//CHAR mainPanelPage[] = 'rmsSchedulingPage';



/*
 * --------------------
 * Lectern 20" panel button channel, address, and level codes
 * --------------------
 */

integer BTN_SYSTEM_OFF = 1
integer BTN_SWIPE_DOWN_TO_COLLABORATE = 2

integer BTN_SELECT_VIDEO_DESTINATION_PROJECTOR     = 51
integer BTN_SELECT_VIDEO_DESTINATION_STUDENT_POD_A = 52
integer BTN_SELECT_VIDEO_DESTINATION_STUDENT_POD_B = 53 // there is no spoon!
integer BTN_SELECT_VIDEO_DESTINATION_STUDENT_POD_C = 54 // there is no spoon!

integer BTN_LIGHTS_OFF = 1
integer BTN_LIGHTS_LOW = 2
integer BTN_LIGHTS_MID = 3
integer BTN_LIGHTS_FULL = 4

integer BTN_AUDIO_MUTE = 1

integer BTN_ADR_SELECTED_SOURCE_LABEL = 51

integer BTN_ADR_SELECTED_SOURCE_PREVIEW = 61

integer BTN_ENCODER_SELECT_SOURCE_PRESENTATION = 1
integer BTN_ENCODER_SELECT_SOURCE_CAMERA = 2
integer BTN_ENCODER_INSERT_USB_WARNING = 11
integer BTN_ADR_ENCODER_STREAM_START_STOP = 21
integer BTN_ADR_ENCODER_RECORD_START_STOP = 22
integer BTN_ENCODER_STREAM_START_STOP = 21
integer BTN_ENCODER_RECORD_START_STOP = 22

// button states for streaming button
integer BTNSTATE_STREAMING_STOPPED           = 1
integer BTNSTATE_STREAMING_STARTING_TOGGLE_1 = 2
integer BTNSTATE_STREAMING_STARTING_TOGGLE_2 = 3
integer BTNSTATE_STREAMING_STARTED           = 4

// button states for recording button

integer BTNSTATE_RECORDING_NO_USB            = 1
integer BTNSTATE_RECORDING_STOPPED           = 2
integer BTNSTATE_RECORDING_STARTING_TOGGLE_1 = 3
integer BTNSTATE_RECORDING_STARTING_TOGGLE_2 = 4
integer BTNSTATE_RECORDING_STARTED           = 5

/*
 * --------------------
 * Touch panel image files
 * --------------------
 */

char IMAGE_FILE_NAME_NO_IMAGE_ICON[]                                 = 'icon-novideo.png'
char IMAGE_FILE_NAME_DROP_ICON_ROTATE_90_DEGREES_CLOCKWISE[]         = 'icon-drop-medium-rotate-90-degrees-clockwise-black.png'
char IMAGE_FILE_NAME_DROP_ICON_ROTATE_90_DEGREES_COUNTER_CLOCKWISE[] = 'icon-drop-medium-rotate-90-degrees-counter-clockwise-black.png'

char IMAGE_FILE_NAME_DRAG_AND_DROP_INSTRUCTIONS_LAPTOP_1[] = 'dragAndDropInstructions-1.png'
char IMAGE_FILE_NAME_DRAG_AND_DROP_INSTRUCTIONS_LAPTOP_2[] = 'dragAndDropInstructions-2.png'
char IMAGE_FILE_NAME_DRAG_AND_DROP_INSTRUCTIONS_LAPTOP_3[] = 'dragAndDropInstructions-3.png'
char IMAGE_FILE_NAME_DRAG_AND_DROP_INSTRUCTIONS_LAPTOP_4[] = 'dragAndDropInstructions-4.png'

char IMAGE_FILE_NAMES_DRAG_AND_DROP_INSTRUCTIONS_SOURCES[][50] = 
{
	'dragAndDropInstructions-1.png',
	'dragAndDropInstructions-2.png',
	'dragAndDropInstructions-3.png',
	'dragAndDropInstructions-4.png'
}

#end_if