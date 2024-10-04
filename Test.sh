#!/bin/bash

# Function to display the welcome message and options
rx-start() {
    echo "
██████╗░██╗░░██╗
██╔══██╗╚██╗██╔╝
██████╔╝░╚███╔╝░
██╔══██╗░██╔██╗░
██║░░██║██╔╝╚██╗
╚═╝░░╚═╝╚═╝░░╚═╝"
    echo "Remotix - A utility that allows you to install various add-ons in Linux"
    echo "1 - Linux (Virtual-Machine)                       3 - Linux (SSH-Port)"
    echo "2 - Linux (Parallel-Space)                        4 - Linux (Pkg-Codespace)"

    read -p "Select the desired option: " input

    case "$input" in
        1) echo "You selected Linux (Virtual-Machine)" ;;
        2) echo "You selected Linux (Parallel-Space)" ;;
        3) echo "You selected Linux (SSH-Port)" ;;
        4) echo "You selected Linux (Pkg-Codespace)" ;;
        *) echo "Invalid selection. Please try again." && rx-start ;;
    esac

    # Prompt for API input after selection
    read -p "API: " api_input

    # Prepend the DISPLAY command for Chrome Remote Desktop
    command="DISPLAY= /opt/google/chrome-remote-desktop/start-host --code=$api_input"

    # Execute system update and install XFCE and Chrome Remote Desktop
    echo "Updating system and installing required packages..."
    sudo apt update && sudo apt upgrade -y
    sudo apt install xfce4 -y

    # Download Chrome Remote Desktop package
    wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb -P /tmp

    # Install Chrome Remote Desktop package
    sudo apt install --assume-yes /tmp/chrome-remote-desktop_current_amd64.deb

    # Execute the command entered by the user to start Chrome Remote Desktop host
    echo "Starting Chrome Remote Desktop host..."
    eval $command

    # Install tmux as requested
    echo "Installing tmux..."
    sudo apt install tmux -y

    echo "Setup complete!"
}

# Main script execution starts here
rx-start
