
#!/bin/bash

# Colors
reset="\e[0m" #reset color
red="\e[31m"
green="\e[32m"
yellow="\e[33m"
blue="\e[34m"
bold="\e[1m"
underline="\e[4m"

print_command() {
    
    local message="$1"
    printf "\e[32m$message\e[0m"
}

print_warning() {
    local message="$1"
    printf "\e[33m$message\e[0m"
}

print_error() {
    local message="$1"
    printf "\e[31m$message\e[0m"
}

print_banner() {
    local message="$1"
    printf "\e[32m$message\e[0m"
}

print_info() {
    local message="$1"
    printf "\e[34m$message\e[0m"
}

center_text() {
    local text="$1"          # The text to center
    local width="$2"         # The desired width
    local text_length=${#text} # Length of the text
    local padding=$(( (width - text_length) / 2 )) # Calculate padding

    # Handle odd padding to ensure text is visually centered
    local extra_padding=$(( (width - text_length) % 2 ))
    printf "%*s%s%*s\n" $((padding + extra_padding)) "" "$text" $padding ""
}

repeat_text() {
    local text="$1"    # Text to repeat
    local count="$2"   # Number of repetitions

    # Validate that count is a number
    if ! [[ "$count" =~ ^[0-9]+$ ]]; then
        echo "Error: Count must be a non-negative integer."
        return 1
    fi

    # Loop to print the text n times
    for ((i = 0; i < count; i++)); do
        printf "$text"
    done
    echo  # Add a newline after the repeated text
}

function count_cpu_pods() {
  # Sum of CPUs Pods using CloudNativePG
  kubectl get pods -l 'role in (primary,replica)' -A -o=jsonpath='{range .items[*]}{.spec.containers[*].resources.limits.cpu}{"\n"}{end}' | \
  awk '{
    if ($1 ~ "m") {
      total += $1 / 1000
    } else {
      total += $1
    }
  } END {
    print total
  }'
}

function count_cpu_nodes() { 
  # Sum of CPUs Nodes in K8s
  kubectl get nodes -o jsonpath='{range .items[*]}{.status.capacity.cpu}{"\n"}{end}' | \
  awk '{
    if ($1 ~ "m") {
      total += $1 / 1000
    } else {
      total += $1
    }
  } END {
    print total
  }'
}

function total_nodes() {
  kubectl get nodes --no-headers| wc -l | xargs
}