#!/bin/bash

if [ "$1" == "-u" ]; then
  pactl unload-module module-loopback
  pactl unload-module module-null-sink
else
  pactl load-module module-null-sink sink_name=iocombined
  pactl load-module module-loopback source=alsa_output.usb-GeneralPlus_USB_Audio_Device-00.analog-stereo.monitor sink=iocombined
  pactl load-module module-loopback source=alsa_input.usb-GeneralPlus_USB_Audio_Device-00.mono-fallback sink=iocombined
fi
