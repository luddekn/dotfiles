#!/bin/bash

liquidctl initialize all
liquidctl --match kraken set pump speed 20 76 30 76 40 86 50 100
liquidctl --match kraken set fan speed 20 46 30 46 40 56 50 66 60 76 70 100
