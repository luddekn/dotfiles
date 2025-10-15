#!/usr/bin/env bash
# Getting sys info
distro=$(cat /etc/*-release | awk -F= '/PRETTY_NAME/ {print $2}' | tr -d '"')
kernel=$(uname -s -r)
uptime=$(uptime -p | cut --delimiter " " -f2-)
architecure=$(uname -m)
cpu=$(lscpu | awk -F: '/Model name/ {print $2}' | sed "s/^ *//")
gpu=$(lspci | awk -F: '/VGA/ {print $3}' | sed "s/^ *//" | sed "s/ ([^)]*)$//")
memory=$(lsmem | awk -F: '/Total online memory/ {print $2}' | sed "s/^ *//")
# Output
order=("OS" "Kernel" "Uptime" "Architecture" "CPU" "GPU" "Memory")

declare -A lines=(
    ["OS"]="$distro"
    ["Kernel"]="$kernel"
    ["Uptime"]="$uptime"
    ["Architecture"]="$architecure"
    ["CPU"]="$cpu"
    ["GPU"]="$gpu"
    ["Memory"]="$memory"
)

echo
for key in "${order[@]}"; do
    printf "\033[33m %s:\033[0m %s\n" "$key" "${lines[$key]}"
done
