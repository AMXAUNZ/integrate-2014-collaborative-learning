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
#include 'system-rms-api'

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

wait 5
{
	flash = !flash
	
	switch (encoder.streamStatus)
	{
		case ENCODER_STREAM_STATUS_STARTING:
		{
			if (flash)
				moderoEnableButtonAnimate (dvTpLecternEncoder, BTN_ADR_ENCODER_STREAM_START_STOP, 0, BTNSTATE_STREAMING_STARTING_TOGGLE_1, 0)
			else
				moderoEnableButtonAnimate (dvTpLecternEncoder, BTN_ADR_ENCODER_STREAM_START_STOP, 0, BTNSTATE_STREAMING_STARTING_TOGGLE_2, 0)
		}
	}
	
	switch (encoder.recordStatus)
	{
		case ENCODER_RECORDING_STATUS_STARTING:
		{
			if (flash)
				moderoEnableButtonAnimate (dvTpLecternEncoder, BTN_ADR_ENCODER_RECORD_START_STOP, 0, BTNSTATE_RECORDING_STARTING_TOGGLE_1, 0)
			else
				moderoEnableButtonAnimate (dvTpLecternEncoder, BTN_ADR_ENCODER_RECORD_START_STOP, 0, BTNSTATE_RECORDING_STARTING_TOGGLE_2, 0)
		}
	}
}

[dvTpLecternVideo, BTN_SELECT_VIDEO_DESTINATION_PROJECTOR] = (selectedVideoInputLecternPanel == dvx.switchStatusVideoOutputs[dvDvxVidOutProjector.port])
[dvTpLecternVideo, BTN_SELECT_VIDEO_DESTINATION_STUDENT_POD_A] = (selectedVideoInputLecternPanel == dvx.switchStatusVideoOutputs[dvDvxVidOutMonitorStudentTable.port])

[dvTpLecternVideo, BTN_SELECT_VIDEO_DESTINATION_STUDENT_POD_B] = (selectedVideoInputLecternPanel == selectedInputStudentPodB)
[dvTpLecternVideo, BTN_SELECT_VIDEO_DESTINATION_STUDENT_POD_C] = (selectedVideoInputLecternPanel == selectedInputStudentPodC)

[dvTpLecternLighting, BTN_LIGHTS_OFF] = (lightsMode == LIGHTS_MODE_OFF)
[dvTpLecternLighting, BTN_LIGHTS_LOW] = (lightsMode == LIGHTS_MODE_LOW)
[dvTpLecternLighting, BTN_LIGHTS_MID] = (lightsMode == LIGHTS_MODE_MID)
[dvTpLecternLighting, BTN_LIGHTS_FULL] = (lightsMode == LIGHTS_MODE_FULL)

[dvTpLecternAudio, BTN_AUDIO_MUTE] = [dvDvxAudOutSpeakers, DVX_CHANNEL_AUDIO_OUTPUT_VOLUME_MUTE]

[dvTpLecternEncoder, BTN_ENCODER_INSERT_USB_WARNING] = (encoder.usbStatusFront == ENCODER_USB_STATUS_CONNECTED)

[dvTpLecternEncoder, BTN_ENCODER_SELECT_SOURCE_PRESENTATION] = (dvx.switchStatusVideoOutputs[dvDvxVidOutEncoder.port] == dvx.switchStatusVideoOutputs[dvDvxVidOutProjector.port])
[dvTpLecternEncoder, BTN_ENCODER_SELECT_SOURCE_CAMERA] = (dvx.switchStatusVideoOutputs[dvDvxVidOutEncoder.port] == dvDvxVidInCamera.port)


wait 100
{
	dxlinkRequestTxVideoInputAutoSelect (dvDXlinkTxRpmMain)
}


#end_if