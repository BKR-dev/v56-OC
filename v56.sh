#!/bin/bash
vga_device=/sys/class/drm/card0/device
pwm=$vga_device/hwmon/hwmon1/pwm1
perf_level=$vga_device/power_dpm_force_performance_level
gpu_clock=$vga_device/pp_sclk_od
vram_clock=$vga_device/pp_mclk_od
help=$(cat /Users/lionelpedro/Git/GamingPerformanceEnhancer/help.v56)
current_cpu_clock=$(cat $gpu_clock)
print_monitoring () {
echo "$(cat /sys/kernel/debug/dri/0/amdgpu_pm_info | tail -15 | head -12)";
echo "$current_gpu_clock";
echo "$vram_clock";
sleep 0.5;
};
print_gaming () {
	printf 'Do you wish to enable OC? Enter [y/n] : '
	read -r opt
	echo "***ENABLING HIGH PERFORMANCE***";
	echo "high" > $perf_level;
	echo "130" > $pwm;
	echo "GPU-FAN-RPM SET TO 50% POWER";
	show_gpu_load;
	echo "$(cat /sys/kernel/debug/dri/0/amdgpu_pm_info | tail -15 | head -12)";
	echo "$current_gpu_clock";
	echo "$vram_clock";
	sleep 0.5;
	#done;
	#could be interefeering with while true, sleep and done

}
print_chill () {
	printf 'Do you wish to enable Chill-Settings? Enter [y/n] : '
	read -r opt
	echo "***ENABLING LOW PERFORMANCE***";
	echo "auto" > $perf_level;
	echo "20" > $pwm;
	echo "GPU-FAN-RPM SET TO 50% POWER";
}
print_help () {																#no idea what das stuff does
printf "GPU OC for AMD GPUs(tm) \n-c Setting Chill Profile \n-g Setting Gaming Profile \n-m for Monitoring GPU Infos\n-h for help\n"

}
case $1 in

		-g)
		print_gaming;;
		-c)
		print_chill;;
		-h)
		print_help;;
		-m)
		print_monitoring;;
		*)
		echo "Use -h for options and instructions";;
esac
