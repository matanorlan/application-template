#!/usr/bin/env bash
######################################
# Author: Matan Orlan
# Purpose: script for Python development environment
# Date: 25/3/25 
# Version: 1
#####################################

set -e
set -o pipefail
set -u

# Help function to display usage
usage() {
  echo "Usage: $0 [-d <project_directory>] [-h]"
  echo ""
  echo "Options:"
  echo "  -d    Specify the project directory"
  echo "  -h    Show this help message"
  echo ""
  echo "This script sets up a Python virtual environment, installs dependencies, and prepares the project."
  echo ""
}

# Parse command-line options
while getopts "d:h" opt; do
  case "$opt" in
    d) project_dir="$OPTARG";;
    h) usage; exit 0;;
    *) echo "Invalid option: -$OPTARG" >&2; usage; exit 1;;
  esac
done

if [ -z "${project_dir:-}" ]; then
  echo "Error: You must specify a project directory with -d."
  usage
  exit 1
fi

# Update system packages
sudo apt update && echo "System package list updated."

# Function to install a package if not present
install_package() {
  if ! command -v "$1" &>/dev/null; then
    echo "Installing $1..."
    sudo apt install -y "$1"
    echo "$1 installed successfully."
  else
    echo "$1 is already installed."
  fi
}

# Install necessary packages
install_package "python3-venv"
install_package "python3-pip"
install_package "pipx"
install_package "makeself"
install_package "sqlite3"
install_package "virtualbox"  # Change to VMware/KVM if preferred

# Ensure project directory exists
mkdir -p "$project_dir"
cd "$project_dir"

echo "Initializing Python virtual environment..."
if [ ! -d "venv" ]; then
  python3 -m venv venv
  echo "Virtual environment created in $project_dir/venv."
fi

# Create requirements file if missing
if [ ! -f requirements.txt ]; then
  cat > requirements.txt <<EOF
flask
flask-sqlalchemy
flask-admin  # Alternative to flask-alchemyview
bootstrap-flask
quart
db-sqlite3
EOF
  echo "requirements.txt generated."
fi

# Activate virtual environment and install dependencies
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt

echo "Python environment setup completed successfully in $project_dir."