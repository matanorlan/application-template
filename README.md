# Python Development Environment Setup

## Overview

This repository provides a script to set up a Python development environment. It installs dependencies, creates a virtual environment, and prepares your project for development on Linux systems (Ubuntu/Debian).

## Features

- Installs required packages.
- Creates a Python virtual environment.
- Generates a `requirements.txt` file.
- Supports VirtualBox (changeable to VMware/KVM).

## Prerequisites

- Linux-based OS (Ubuntu, Debian)
- Virtualization software (VirtualBox, VMware, or KVM)
- Python 3.x
- `sudo` privileges

## Usage

### 1. Clone the Repository
```bash
git clone https://github.com/your-username/application-template.git
cd application-template
```

### 2. Make the Script Executable
```bash
chmod +x setup.sh
```
### 3. Run the Setup Script
```bash
./setup.sh -d /path/to/your/project
```
Replace ``/path/to/your/project`` with your desired project directory.

## Project Structure
```plaintext
application-template/
├── setup.sh              # Shell script to set up the environment
├── requirements.txt      # Python dependencies
├── venv/                 # Virtual environment
└── README.md             # Documentation
```
## License
MIT License.
