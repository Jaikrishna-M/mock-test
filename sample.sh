#!/bin/bash

set -e

echo "Running on: $(hostname)"
echo "Updating system packages..."

# Detect OS
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$ID
else
    echo "Unable to detect OS"
    exit 1
fi

if [[ "$OS" == "ubuntu" || "$OS" == "debian" ]]; then
    sudo apt update
    sudo apt install -y nginx apache2
elif [[ "$OS" == "centos" || "$OS" == "rhel" || "$OS" == "fedora" ]]; then
    sudo yum install -y epel-release
    sudo yum install -y nginx httpd
    sudo systemctl enable nginx httpd
    sudo systemctl start nginx httpd
else
    echo "Unsupported OS: $OS"
    exit 1
fi

echo "Installation completed successfully!"
