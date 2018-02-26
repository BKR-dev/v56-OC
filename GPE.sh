#!/bin/bash
# /sys/class/drm/card0/device/hwmon/hwmon1/pwm1 => setting gpu rpm
# /sys/class/drm/card0/device/power_dpm_force_performance_level => auto for office usage // high for gaming ***WARNING*** High needs pwm1=min65 if not gaming
#where do i get the gpu temp from to make up a "fan curve"?
#start when steam starts up => performance high, rpm=65
#steam closes => performance auto, rpm=35
#
#[root@vortex-nether booker-x9]# ls /sys/class/drm/card0/device/hwmon/hwmon1/
#device      name   pwm1         pwm1_max  subsystem   temp1_crit_hyst  uevent
#fan1_input  power  pwm1_enable  pwm1_min  temp1_crit  temp1_input
#
#
#
#
#
#
#


