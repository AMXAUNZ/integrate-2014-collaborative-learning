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

#end_if