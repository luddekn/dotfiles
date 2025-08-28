#!/bin/bash

liquidctl initialize all
liquidctl --match kraken set pump speed 100
liquidctl --match kraken set fan speed 25 50  30 60  35 70  40 80  45 90  50 100
