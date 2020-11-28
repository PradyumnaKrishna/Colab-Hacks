#! /bin/bash

# Make Instance Ready for Remote Desktop or RDP

b='\033[1m'
r='\E[31m'
g='\E[32m'
c='\E[36m'
endc='\E[0m'
enda='\033[0m'

clear

# Branding

printf """$c$b
      _____      _       _         _    _            _  
     / ____|    | |     | |       | |  | |          | | 
    | |     ___ | | __ _| |__     | |__| | __ _  ___| | _____ 
    | |    / _ \| |/ _\` | '_ \    |  __  |/ _\` |/ __| |/ / __|
    | |___| (_) | | (_| | |_) |   | |  | | (_| | (__|   <\__ \\
     \_____\___/|_|\__,_|_.__/    |_|  |_|\__,_|\___|_|\_\___/ 

    $r  By Pradyumna Krishna © 2020 $c
      Github : https://github.com/PradyumnaKrishna/Colab-Hacks          
$endc$enda""";

sleep 5

# Used Two if else type statements, one is simple second is complex. So, don't get confused or fear by seeing complex if else statement '^^.

# Creation of user
printf "\n\nCreating user " >&2
if sudo useradd -m user &> /dev/null
then
  printf "\ruser created $endc$enda\n" >&2
else
  printf "\r$r$b Error Occured $endc$enda\n" >&2
  exit
fi

# Add user to sudo group
sudo adduser user sudo

# Set password of user to 'root'
echo 'user:root' | sudo chpasswd

# Change default shell from sh to bash
sed -i 's/\/bin\/sh/\/bin\/bash/g' /etc/passwd

# Initialisation of Installer
printf "\n\n$c$b    Loading Installer $endc$enda" >&2
if sudo apt-get update &> /dev/null
then
    printf "\r$g$b    Installer Loaded $endc$enda\n" >&2
else
    printf "\r$r$b    Error Occured $endc$enda\n" >&2
    exit
fi

# Installing Chrome Remote Desktop
printf "\n$g$b    Installing Chrome Remote Desktop $endc$enda" >&2
{
    wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
    sudo dpkg --install chrome-remote-desktop_current_amd64.deb
    sudo apt install --assume-yes --fix-broken
} &> /dev/null &&
printf "\r$c$b    Chrome Remote Desktop Installed $endc$enda\n" >&2 ||
{ printf "\r$r$b    Error Occured $endc$enda\n" >&2; exit; }

sleep 3

# Install Desktop Environment
printf "$g$b    Installing Desktop Environment $endc$enda" >&2
{
    sudo DEBIAN_FRONTEND=noninteractive \
        apt install --assume-yes xfce4 desktop-base
    sudo bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'  
    sudo apt install --assume-yes xscreensaver
    sudo systemctl disable lightdm.service
} &> /dev/null &&
printf "\r$c$b    Desktop Environment Installed $endc$enda\n" >&2 ||
{ printf "\r$r$b    Error Occured $endc$enda\n" >&2; exit; }

sleep 3

# Install Google Chrome
printf "$g$b    Installing Google Chrome $endc$enda" >&2
{
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg --install google-chrome-stable_current_amd64.deb
    sudo apt install --assume-yes --fix-broken
} &> /dev/null &&
printf "\r$c$b    Google Chrome Installed $endc$enda\n" >&2 ||
printf "\r$r$b    Error Occured $endc$enda\n" >&2

sleep 3

# Install other tools like nano
printf "$g$b    Installing other Tools $endc$enda" >&2
if sudo apt install nautilus nano -y &> /dev/null
then
    printf "\r$c$b    Other Tools Installed $endc$enda\n" >&2
else
    printf "\r$r$b    Error Occured $endc$enda\n" >&2
fi

sleep 3

printf "\n$g$b    Installation Completed $endc$enda\n\n" >&2

sleep 3

# Adding user to CRP group
sudo adduser user chrome-remote-desktop

# Finishing Work
printf '\nVisit http://remotedesktop.google.com/headless and Copy the command after authentication\n'
read -p "Give Command: " CRP
su - user -c """$CRP"""

printf "\n$c$b I hope everthing done correctly if mistakenly wrote wrong command or pin, Rerun the current box or run command 'su - user -c '<CRP Command Here>' $endc$enda\n" >&2
printf "\n$g$b Finished Succesfully$endc$enda"