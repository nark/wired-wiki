# How to install Wired Server (UNIX) on Mac OSX 

This How-To explains how to compile and install a Wired Server from sources on Mac OS X system.

## Install Xcode

You will have to compile the Wired Server source code, so you need to have developer tools installed on your system:

* [https://itunes.apple.com/fr/app/xcode/id497799835](https://itunes.apple.com/fr/app/xcode/id497799835)
* [https://developer.apple.com/xcode/](https://itunes.apple.com/fr/app/xcode/id497799835)

Once installed, you have to download and install Xcode additional components named "Command Line Tools". You will find how into **Xcode.app > Preferences > Downloads**.

<!--

## Install Homebrew

Homebrew is a software package manager (Like Macports) we will use to install some dependencies required to compile Wired Server source code.

Open a Terminal window and type:
	
	ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
	
This will automatically download and install Homebrew for you. 

Source: http://mxcl.github.com/homebrew/


## Install Prerequisites

### SQLite 3

### libxml 2

-->

## Install Wired Server

1. Download Wired tarball:

		curl -O http://switch.dl.sourceforge.net/project/wired2/wired/wired.tar.gz

2. Deflate the archive:

		tar -xvzf wired.tar.gz
		
3. Move into Wired sources directory:

		cd wired/
		
4. Configure Wired Server package for your operating system:

		./configure
		
	By default, Wired Server directory is installed into `/usr/local/`. Also by default, Wired Server will be configured to run with your current user in the 'daemon' group.
	You can use a custom path by using the `--prefix` option:
	
		./configure --prefix=/usr/local/wired2
		
5. Compile Wired Server package:

		make
		
6. Install Wired Server binaries on your system (using prefix is specified):

		sudo make install
		
	And type your administrator password.

7. Start your newly installed Wired Server:

		/usr/local/wired/wiredctl start
		
	If you used a custom prefix:
		
		/usr/local/wired2/wired/wiredctl start
		
	Use the following command to stop it:
		
		/usr/local/wired/wiredctl stop
		
	Run `/usr/local/wired/wiredctl help` to get the list of supported commands.
		
## Install LaunchAdgent

Maybe you would like to launch Wired Server as a service at session login. On Mac OS X, you have to use what is called a **LaunchAdgent**. Actually, an agent is a p-list file which describes a job for the system to handle and execute.

Assume that we installed Wired Server with a custom prefix like this: `/usr/local/wired2`. The following example show you how to start Wired Server at session login:

1. Open a Terminal window and type:

		touch ~/Library/LaunchAgents/fr.read-write.wired2.plist && open -a TextEdit ~/Library/LaunchAgents/fr.read-write.wired2.plist

2. TextEdit.app should open. Copy/Paste the following content:

		<?xml version="1.0" encoding="UTF-8"?>
		<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/	DTDs/PropertyList-1.0.dtd">
		<plist version="1.0">
			<dict>
				<key>Disabled</key>
				<false/>
				<key>Label</key>
				<string>fr.read-write.wired2</string>
				<key>KeepAlive</key>
				<true/>
				<key>OnDemand</key>
				<false/>
				<key>ProgramArguments</key>
				<array>
					<string>/usr/local/wired2/wired/wired</string>
					<string>-x</string>
					<string>-d</string>
					<string>/usr/local/wired2/wired/</string>
					<string>-l</string>
					<string>-L</string>
					<string>/usr/local/wired2/wired/wired.log</string>
					<string>-i</string>
					<string>1000</string>
				</array>
				<key>RunAtLoad</key>
				<true/>
				<key>WorkingDirectory</key>
				<string>/usr/local/wired2/wired/</string>
			</dict>
		</plist>

3. Save and close the file.
4. Now you have to ask launchd to load your newly created agent. In a Terminal:

		launchctl load ~/Library/LaunchAgents/fr.read-write.wired2.plist
	
	This will register the job from launchd and start Wired Server. Close your session then login again to test it.
	
	Use the following command to stop it:
	
		launchctl unload ~/Library/LaunchAgents/fr.read-write.wired2.plist
		
## Use Case

We can easily imagine to run several Wired Server instances on the same user session. These explanations are also valid for old versions of Wired Server provided by Zanka Software (1.3.x, 2.0). 