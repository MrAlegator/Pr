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

    read -p "Code: " host_input

    if [[ "$host_input" == "DISPLAY=/opt/google/chrome-remote-desktop/start-host --code="* ]]; then
    command="$host_input"
else
    echo "Invalid format. Check SSH Debian Linux" 
    exit 1
    fi

    echo "Updating system and installing required packages..."
    sudo apt update && sudo apt upgrade -y
    sudo apt install xfce4 -y  
    wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb -P /tmp
    sudo apt install --assume-yes /tmp/chrome-remote-desktop_current_amd64.deb
    echo "Starting Chrome Remote Desktop host..."
    eval $command
    sudo bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'
    echo "export CHROME_REMOTE_DESKTOP_DEFAULT_DESKTOP_SIZES=1920x1080,1080x720" >> ~/.profile

    echo "Setup complete!"
    echo "Go https://remotedesktop.google.com/access/ enter password and use VM!"
}

rx-start
