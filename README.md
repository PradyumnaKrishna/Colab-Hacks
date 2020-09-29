<img src="https://raw.githubusercontent.com/PradyumnaKrishna/PradyumnaKrishna/master/logo.svg" align="right" height="50" width="50"/>

# Colab Hacks [![Warning][Warning]](#warning---this-repo-is-against-google-colab-policy)

## [Colab RDP](Colab%20RDP/Colab%20RDP.ipynb) &nbsp;&nbsp; <a href="https://colab.research.google.com/github/PradyumnaKrishna/Colab-Hacks/blob/master/Colab%20RDP/Colab%20RDP.ipynb" target="_parent"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/></a>

 - Create a **NGROK** Account to configure tunnel
 - Don't use username : `root`
 - **SSH** to Colab Instance using command provided
 - Use this **[script](https://github.com/PradyumnaKrishna/Colab-Hacks/raw/master/Colab%20RDP/install.sh)** for configure Colab via SSH
 - Use the commands

       sudo chmod +x install.sh
       sudo ./install.sh
 - Authenticate Through [Remote Desktop Headless](http://remotedesktop.google.com/headless)<br> Dont Download any file simply proceed directly to authenticate button. When you got a command copy and paste it to SSH terminal and complete the process by setting up a Pin.
 - Now, Visit Remote Desktop at http://remotedesktop.google.com/headless to access your instance

<br />

## [Colab SSH](Colab%20SSH/Colab%20SSH.ipynb) &nbsp;&nbsp; <a href="https://colab.research.google.com/github/PradyumnaKrishna/Colab-Hacks/blob/master/Colab%20SSH.ipynb" target="_parent"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/></a>

 - Requires an **NGROK** account to execute this notebook
 - Enter the Required ngrok token when asked
 - Run the command after sucessfully executing the Notbook

       ssh root@0.tcp.ngrok.io -p <givenport>
<br />

## [Torrent Downloader](Torrent%20Downloader/Torrent%20Downloader.ipynb) &nbsp;&nbsp; <a href="https://colab.research.google.com/github/PradyumnaKrishna/Colab-Hacks/blob/master/Torrent%20Downloader.ipynb" target="_parent"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/></a>

 - Requires Google Drive authentication
 - Have both ways adding torrent via torrent file or using magnet link
 - **Note :** You can download any file and store it at google drive using command `wget <link>` and move it to the `/content/drive/My\ Drive/` location 

<br />

### Support our Repository
Support our Repository by Star and sharing it

### <span style="color: red;">Warning - This Repo is Against Google Colab Policy</span>

#### Use it on your own Risk
> **Why are hardware resources such as T4 GPUs not available to me?**
The best available hardware is prioritized for users who use Colaboratory interactively rather than for long-running computations. Users who use Colaboratory for long-running computations may be temporarily restricted in the type of hardware made available to them, and/or the duration that the hardware can be used for. We encourage users with high computational needs to use Colaboratory’s UI with a local runtime.
Please note that using Colaboratory for cryptocurrency mining is disallowed entirely, and may result in being banned from using Colab altogether.

<sub>Source: https://research.google.com/colaboratory/faq.html</sub>

[Warning]:   https://img.shields.io/badge/-Warning-red