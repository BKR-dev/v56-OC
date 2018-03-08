#!/bin/bash
vga_device=/sys/class/drm/card0/device
pwm=$vga_device/hwmon/hwmon1/pwm1
perf_level=$vga_device/power_dpm_force_performance_level
gpu_clock=$vga_device/pp_sclk_od
vram_clock=$vga_device/pp_mclk_od
current_cpu_clock=$(cat $gpu_clock)


print_monitoring () {
echo "$(cat /sys/kernel/debug/dri/0/amdgpu_pm_info | tail -15 | head -12)";
sleep 0.5;
};

set_gaming () {
cols=$( tput cols )
rows=$( tput lines )
welco_message="***SETTING GAMING PROFILE***"
message=$welco_message
input_length=${#message}
half_input_length=$(( $input_length / 2 ))
middle_row=$(( $rows / 2 ))
middle_col=$(( ($cols / 2) - $half_input_length ))
tput clear
tput cup $middle_row $middle_col
tput bold
echo $message
tput sgr0
tput cup $( tput lines ) 0
};

set_mining () {
cols=$( tput cols )
rows=$( tput lines )
welco_message="***SETTING MINING PROFILE***"
message=$welco_message
input_length=${#message}
half_input_length=$(( $input_length / 2 ))
middle_row=$(( $rows / 2 ))
middle_col=$(( ($cols / 2) - $half_input_length ))
tput clear
tput cup $middle_row $middle_col
tput bold
echo $message
tput sgr0
tput cup $( tput lines ) 0
};

set_office () {
cols=$( tput cols )
rows=$( tput lines )
welco_message="***SETTING OFFICE PROFILE***"
message=$welco_message
input_length=${#message}
half_input_length=$(( $input_length / 2 ))
middle_row=$(( $rows / 2 ))
middle_col=$(( ($cols / 2) - $half_input_length ))
tput clear
tput cup $middle_row $middle_col
tput bold
echo $message
tput sgr0
tput cup $( tput lines ) 0
};

message_txtbox_mid () {
cols=$( tput cols )
rows=$( tput lines )
welco_message="WELCOME TO THE GPE-PROJECT"
message=$welco_message
input_length=${#message}
half_input_length=$(( $input_length / 2 ))
middle_row=$(( $rows / 2 ))
middle_col=$(( ($cols / 2) - $half_input_length ))
tput clear
tput cup $middle_row $middle_col
tput bold
echo $message
tput sgr0
tput cup $( tput lines ) 0
};

message_txtbox_mid () {
cols=$( tput cols )
rows=$( tput lines )
welco_message="WELCOME TO THE GPE-PROJECT"
message=$welco_message
input_length=${#message}
half_input_length=$(( $input_length / 2 ))
middle_row=$(( $rows / 2 ))
middle_col=$(( ($cols / 2) - $half_input_length ))
tput clear
tput cup $middle_row $middle_col
tput bold
echo $message
tput sgr0
tput cup $( tput lines ) 0
};

show_gpu_load () {
cols=$( tput cols )
rows=$( tput lines )
message_1=$(cat /sys/kernel/debug/dri/0/amdgpu_pm_info | tail -7 | cut -d":" -f 1,2)
#message_2=$(cat /sys/kernel/debug/dri/0/amdgpu_pm_info | tail -14 | head -3)
message=$message_1 #+ $message_2
input_length=${#message}
half_input_length=$(( $input_length / 2 ))
middle_row=$(( $rows / 2 ))
middle_col=$(( ($cols / 2) - $half_input_length ))
tput clear
tput cup $middle_row $middle_col
tput bold
echo $message
tput sgr0
tput cup $( tput lines ) 0
};


case $1 in

		-g|--game)
		echo "***ENABLING HIGH PERFORMANCE***";
		echo "high" > $perf_level;
		echo "130" > $pwm;
		echo "GPU-FAN-RPM SET TO 50% POWER";
		while true; do show_gpu_load;
		sleep 0.5; 
		done;;
		---mining)
		echo "***WARNING*** TOTAL PERFORMANCE!";
		echo "high" > $perf_level;
		echo "200" > $pwm;;
		-o|--office)
		#welco_message="***SETTING OFFICE USAGE PATTERN***";
		#message_txtbox_mid($welco_message);
		echo "auto" > $perf_level;
		echo "50" > $pwm;;
		-h|--help)
		message_txtbox_mid;
		echo "Enhance GPU Performance for YOUR needs";
		echo "-c --core 	Read or Set VCORE clock";
		echo "-m --memory 	Read or Set VRAM clock";
		echo "-o --office 	Setting Office-Use Profile";
		echo "-g --game		Setting Gaming Profile";
		echo "--mining		Setting Mining Profile";
		echo "--monitoring	Monitoring GPU Infos";;
		-c|--core)
		echo "***CAUTION! SETTING NEW CLOCK PARAMETER***";
		echo "$2" > $gpu_clock;
		echo "high" > $perf_level;
		echo "CPU CORE CLOCK IS NOW AT "$current_gpu_clock"";;
                --monitoring)
                while true; do print_monitoring;

done

esac



