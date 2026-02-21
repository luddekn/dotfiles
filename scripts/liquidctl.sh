#!/bin/bash

liquidctl initialize all
liquidctl --match kraken set pump speed 100
liquidctl --match kraken set fan speed 20 75  30 75  40 75  50 80  55 90  60 100
