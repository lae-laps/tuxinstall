#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    echo "Exiting..."
    exit
fi

arch_install () {
    pacman -S $1 --needed --noconfirm
}

arch_update () {
    pacman -Syyu --noconfirm
    pacman -Syy --noconfirm
}

nmap () {
    arch_install "nmap"
}

metasploit () {
    arch_install "metasploit"
}

nexphisher () {
    git clone https://github.com/htr-tech/nexphisher
    cd nexphisher
    chmod +x setup
    ./setup
    chmod +x nexphisher
    ./nexphisher
}

while [ true ]; do
    echo "

===========
TUX-INSTALL
===========
Coded by: lae_laps

Automates common tool installation for linux distributions and makes it system-wide

Select a tool to install:

[0] ~ exit
[1] ~ nmap
[2] ~ metasploit
[3] ~ nexphisher
"

    read -p ">> " option

    if [[ -n ${option//[0-9]/} ]]; then
        echo "Invalid input -> Please enter a numerical value"
    else
        case $option in
            0)
                exit 0
                ;;
            1)
                nmap
                ;;
            2)
                metasploit
                ;;
            3)
                nexphisher
                ;;
            *)
                echo "Invalid input --> Please enter a number between 0 and 3"
                ;;
      esac
    fi;
done
