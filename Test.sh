#!/bin/bash

rx-start() Pkg   # Print "Hello"
    echo "
██████╗░██╗░░██╗
██╔══██╗╚██╗██╔╝
██████╔╝░╚███╔╝░
██╔══██╗░██╔██╗░
██║░░██║██╔╝╚██╗
╚═╝░░╚═╝╚═╝░░╚═╝"
    echo "Remotix - A utility that allows you to install various add-ons in linux"
    echo: "1 - Linux (Virtual-Machine)                       3 - Linux (SSH-Port)"
    echo: "2 - Linux (Parallel-Space)                        4 - Linux (Pkg-Codespace)"

    read -p "Select the desired option:" input

    # Check if the input is 1
    if [ "$input" -eq 1 ]; then
        echo "1"
    fi
}

rx-start
