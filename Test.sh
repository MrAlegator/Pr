#!/bin/bash

start() {
    # Print "Hello"
    echo "Hello"

    # Prompt user for input
    read -p "Enter a number: " input

    # Check if the input is 1
    if [ "$input" -eq 1 ]; then
        echo "bye"
    fi
}

start
