# Install Packages for APNIC workshops
## Requirements
This script is designed to work on Ubuntu 20.04 LTS. It should be run under root (not suitable for a production environment).
## Actions Performed
* Update system packages
* Install GNS3-Server
* Install GNS3-GUI
* Install Docker
* Install Dynamips
* Install Dynagen
* Install uBridge
* Install VPCS
* Configure UFW [optional]
* Configure GNS3 [optional]
## Installation
Change to root user (if necessary) and clone Git repository:
```
sudo su - 
git clone https://github.com/githubapnic/Ubuntu_20.04.git
```
Enter the new directory, change variables , update permissions, and run install_packages.sh, answer the questions:
```
cd Ubuntu_20.04/installpackages
vi install_packages.sh
chmod 744 install_packages.sh
sudo ./install_packages.sh
```
