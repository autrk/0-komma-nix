#!/bin/bash

# Function to check if Nix is installed
check_nix_installed() {
  if command -v nix > /dev/null 2>&1; then
    return 0  # Nix is installed
  else
    return 1  # Nix is not installed
  fi
}

# Function to install Nix
install_nix() {
  echo "Installing Nix..."
  curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
  if [ $? -eq 0 ]; then
    echo "Nix installation completed successfully."
  else
    echo "Nix installation failed. Please check the output for errors."
    exit 1
  fi
}

# Function to prepare Home Manager configuration directory and symlinks
prepare_home_manager_config() {
  # Define the Home Manager config directory
  CONFIG_DIR="$HOME/.config/home-manager"
  
  # Create the config directory if it doesn't exist
  if [ ! -d "$CONFIG_DIR" ]; then
    echo "Creating Home Manager configuration directory at $CONFIG_DIR..."
    mkdir -p "$CONFIG_DIR"
  else
    echo "Home Manager configuration directory already exists at $CONFIG_DIR."
  fi

  # Create symbolic links for flake.nix and home.nix
  echo "Creating symbolic links for flake.nix and home.nix in $CONFIG_DIR..."
  ln -sf "$HOME/0-komma-nix/flake.nix" "$CONFIG_DIR/flake.nix"
  ln -sf "$HOME/0-komma-nix/home.nix" "$CONFIG_DIR/home.nix"
}

# Function to install Home Manager
install_home_manager() {
  echo "Installing Home Manager using the flake.nix file..."
  nix run home-manager/master -- init --switch --impure
  if [ $? -eq 0 ]; then
    echo "Home Manager installation completed successfully."
  else
    echo "Home Manager installation failed. Please check the output for errors."
    exit 1
  fi
}

# Main script execution
echo "Checking if Nix is already installed..."

if check_nix_installed; then
  echo "Nix is already installed on this system."
else
  echo "Nix is not installed on this system."
  install_nix
fi

# Prepare Home Manager configuration and install it
prepare_home_manager_config
install_home_manager

