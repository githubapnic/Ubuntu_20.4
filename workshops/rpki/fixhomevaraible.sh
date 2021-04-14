#!/bin/bash
# This script automates the setup of workshops on Ubuntu 18.04 LTS.
# Ensure the directories, credentials and ports specified in the variables below are 
# what you want.

# Credit: Script based on GNS3 installation script
# https://github.com/rhelshane/Install-GNS3-Server


# Declare variables
LOG_FILE="results.log"


# Ensure script is run as root user (not a super secure script)
function checkRoot()
{
  if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root."
    exit 1
  fi
}

# Ensure script is run on Ubuntu 18.04 (not a super secure script)
function checkUbuntu()
{
  if [[ $(lsb_release -rs) == "20.04" ]]; then
  date >> $LOG_FILE
  echo "###### Checking Ubuntu Version" | tee -a $LOG_FILE
  else
    echo "This script is for Ubuntu version 18.04. This is version $(lsb_release -rs)"
    exit 1
  fi
}


# Fix for Ubuntu 20.04 to keep $HOME variables
function keepHomeDirectory()
{
  # Take a backup of sudoers file and change the backup file.
  sudo cp /etc/sudoers /tmp/sudoers.bak
  echo 'Defaults env_keep += "HOME"' >> /tmp/sudoers.bak

  # Check syntax of the backup file to make sure it is correct.
  sudo visudo -cf /tmp/sudoers.bak
  if [ $? -eq 0 ]; then
    # Replace the sudoers file with the new only if syntax is correct.
    sudo cp /tmp/sudoers.bak /etc/sudoers
	rm /tmp/sudoers.bak
  else
    echo "Could not modify /etc/sudoers file. Please do this manually."
fi
}

# Run the functions 
checkRoot
checkUbuntu
keepHomeDirectory