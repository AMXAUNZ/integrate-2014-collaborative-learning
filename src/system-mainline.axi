program_name='system-mainline'

#if_not_defined __SYSTEM_MAINLINE__
#define __SYSTEM_MAINLINE__

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
 * Mainline
 * 
 * This section of code will run whenever there are no events or waits
 * to process.
 *
 * Note: Updating values of global or local_var variables within mainline
 * will cause mainline to run more often. It is recommended to limit the
 * updating of variables within mainline to stack_var variables only in
 * order to reduce CPU usage. Alternatively, wait statements can be used
 * within mainline to delay execution of code.
 * -------------------------------------------------------------------
 */

define_program



#end_if