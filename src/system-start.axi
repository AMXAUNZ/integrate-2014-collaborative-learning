program_name='system-start'

#if_not_defined __SYSTEM_START__
#define __SYSTEM_START__

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
 * System Initialisation
 * -------------------------------------------------------------------
 */

define_start

initArea (dropAreaLeftOrientationMonitorStudentTable, 310, 480, 180, 320)
initArea (dropAreaRightOrientationMonitorStudentTable, 310, 480, 180, 320)

initArea (dragAreas10[dvDvxVidInStudentLaptop1.port], 40, 40 ,133, 200)
initArea (dragAreas10[dvDvxVidInStudentLaptop2.port], 627, 40, 133, 200)
initArea (dragAreas10[dvDvxVidInStudentLaptop3.port], 40, 1040, 133, 200)
initArea (dragAreas10[dvDvxVidInStudentLaptop4.port], 627, 1040, 133, 200)

draggablePopups10[dvDvxVidInStudentLaptop1.port] = 'draggable-source-laptop-1'
draggablePopups10[dvDvxVidInStudentLaptop2.port] = 'draggable-source-laptop-2'
draggablePopups10[dvDvxVidInStudentLaptop3.port] = 'draggable-source-laptop-3'
draggablePopups10[dvDvxVidInStudentLaptop4.port] = 'draggable-source-laptop-4'

blockDraggablePopups10[dvDvxVidInStudentLaptop1.port] = "'block-',draggablePopups10[dvDvxVidInStudentLaptop1.port]"
blockDraggablePopups10[dvDvxVidInStudentLaptop2.port] = "'block-',draggablePopups10[dvDvxVidInStudentLaptop2.port]"
blockDraggablePopups10[dvDvxVidInStudentLaptop3.port] = "'block-',draggablePopups10[dvDvxVidInStudentLaptop3.port]"
blockDraggablePopups10[dvDvxVidInStudentLaptop4.port] = "'block-',draggablePopups10[dvDvxVidInStudentLaptop4.port]"

#end_if