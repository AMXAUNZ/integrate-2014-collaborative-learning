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
integer DEV_ID_TX_1                                 = 7001
integer DEV_ID_TX_2                                 = 7002
integer DEV_ID_TX_3                                 = 7003
integer DEV_ID_TX_4                                 = 7004
integer DEV_ID_RX_PROJECTOR                         = 8001
integer DEV_ID_RX_MONITOR_STUDENT_TABLE             = 8002
integer DEV_ID_ENZO_LECTURN                         = 9001
integer DEV_ID_ENZO_STUDENT_TABLE                   = 9001
integer DEV_ID_TOUCH_PANEL_LECTURN                  = 10001
integer DEV_ID_TOUCH_PANEL_STUDENT_TABLE            = 10002
integer DEV_ID_TOUCH_PANEL_SCHEDULING               = 10003
integer DEV_ID_VIRTUAL_RMS                          = 41001
integer DEV_ID_VIRTUAL_PROJECTOR                    = 41002
integer DEV_ID_VIRTUAL_MONITOR_STUDENT_TABLE        = 41003
integer DEV_ID_VIRTUAL_DRAG_AND_DROP_STUDENT_TABLE  = 33001
integer DEV_ID_VIRTUAL_MULTI_PREVIEW                = 33002


/*
 * --------------------
 * Device ports
 * --------------------
 */
 
 // Virtual device main port
integer PORT_VIRTUAL_MAIN       = 1

// Touch Panel Ports
integer PORT_TP_MAIN            = 1
integer PORT_TP_VIDEO           = 3
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

#end_if