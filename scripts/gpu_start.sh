#!/bin/bash

FAN_SPEED=60

sudo nvidia-settings -a "[gpu:0]/GPUFanControlState=1" -a "[fan:0]/GPUTargetFanSpeed=$FAN_SPEED" -a "[fan:1]/GPUTargetFanSpeed=$FAN_SPEED"
