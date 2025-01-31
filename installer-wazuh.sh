#!/bin/bash

# Function to display help
function display_help() {
    echo "Usage: $0 -m <WAZUH_MANAGER> -n <HOSTNAME_AGENT> [-i] [-e]"
    echo
    echo "   -m <WAZUH_MANAGER>  Server Wazuh (IP atau hostname)"
    echo "   -n <HOSTNAME_AGENT>  Hostname Agent (biarkan kosong untuk menggunakan hostname sistem)"
    echo "   -i                   Install Wazuh Agent"
    echo "   -e                   Enable and start Wazuh Agent service"
    echo "   -h                   Display this help message"
    exit 1
}

# Check if no arguments were provided
if [ $# -eq 0 ]; then
    display_help
fi

# Variables
INSTALL=false
ENABLE=false
WAZUH_MANAGER=""
HOSTNAME_AGENT=""

# Parse command line options
while getopts "iem:n:h" opt; do
    case $opt in
        i)
            INSTALL=true
            ;;
        e)
            ENABLE=true
            ;;
        m)
            WAZUH_MANAGER="$OPTARG"
            ;;
        n)
            HOSTNAME_AGENT="$OPTARG"
            ;;
        h)
            display_help
            ;;
        *)
            display_help
            ;;
    esac
done

# Set hostname agent to system hostname if not provided
if [ -z "$HOSTNAME_AGENT" ]; then
    HOSTNAME_AGENT=$(hostname)
fi

# Function to install Wazuh Agent
function install_wazuh_agent() {
    # Download the Wazuh Agent package
    wget https://packages.wazuh.com/4.x/apt/pool/main/w/wazuh-agent/wazuh-agent_4.10.1-1_amd64.deb

    # Install the Wazuh Agent
    sudo WAZUH_MANAGER="$WAZUH_MANAGER" WAZUH_AGENT_GROUP='Owlexa-Healthcare' WAZUH_AGENT_NAME="$HOSTNAME_AGENT" dpkg -i ./wazuh-agent_4.10.1-1_amd64.deb

    # Remove the downloaded .deb file
    rm -f ./wazuh-agent*.deb
}

# Function to enable and start Wazuh Agent service
function enable_service() {
    sudo systemctl enable wazuh-agent
    sudo systemctl start wazuh-agent
}

# Execute installation if requested
if $INSTALL; then
    install_wazuh_agent
fi

# Enable service if requested
if $ENABLE; then
    enable_service
fi
