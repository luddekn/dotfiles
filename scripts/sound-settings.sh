#!/bin/bash
pacmd set-default-source alsa_output.usb-Kingston_HyperX_Quadcast_4110-00.iec958-stereo.monitor
sleep 3
pacmd set-default-sink alsa_output.pci-0000_0a_00.4.analog-stereo
