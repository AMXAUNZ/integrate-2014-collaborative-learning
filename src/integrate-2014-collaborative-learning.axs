program_name='integrate-2014-collaborative-learning'

#include 'system-defines'

#include 'system-library-api'

#include 'system-library-control'

#include 'system-constants'

#include 'system-devices'

#include 'system-structures'

#include 'system-variables'

#include 'system-mutual-exclusions'

#include 'system-functions'

#include 'system-modules'

#include 'system-start'

#include 'system-events'

#include 'system-mainline'

// listener libraries always need to go last due to the way #define statements work
#include 'system-library-listener'

////// RMS Includes need to be declared after the define devices section (where vdvRms is declared)
////// and after any references to any callback function use. Safest to put this last.

#include 'system-rms-api'

#include 'system-rms-listener'

