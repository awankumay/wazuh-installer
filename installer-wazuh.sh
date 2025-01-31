#!/bin/bash

# Function to display help
function display_help() {
    echo "Usage: $0 [-i] [-e]"
    echo
    echo "   -i     Install Wazuh Agent"
    echo "   -e     Enable and start Wazuh Agent service"
    echo "   -h     Display this help message"
    exit 1
}

# Check if no arguments were provided
if [ $# -eq 0 ]; then
    display_help
fi

# Variables
INSTALL=false
ENABLE=false

# Parse command line options
while getopts "ieh" opt; do
    case $opt in
        i)
            INSTALL=true
            ;;
        e)
            ENABLE=true
            ;;
        h)
            display_help
            ;;
        *)
            display_help
            ;;
    esac
done

# Function to install Wazuh Agent
function install_wazuh_agent() {
    read -p "Server Wazuh: " WAZUH_MANAGER
    read -p "Hostname Agent (leave empty to use system hostname): " HOSTNAME_AGENT

    if [ -z "$HOSTNAME_AGENT" ]; then
        HOSTNAME_AGENT=$(hostname)
    fi

    wget https://packages.wazuh.com/4.x/apt/pool/main/w/wazuh-agent/wazuh-agent_4.10.1-1_amd64.deb
    sudo WAZUH_MANAGER="$WAZUH_MANAGER" WAZUH_AGENT_GROUP='Owlexa-Healthcare' WAZUH_AGENT_NAME="$HOSTNAME_AGENT" dpkg -i ./wazuh-agent_4.10.1-1_amd64.deb

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
