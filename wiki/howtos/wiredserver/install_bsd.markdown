# How to install Wired Server on BSD

This How-To explains how to compile and install a Wired Server on BSD-like Linux distribution (FreeBSD, OpenBSD, etc.).



### Dependencies

* 	Install dev library for Sqlite3: 

		cd /usr/ports/databases/sqlite3 && make install clean

* 	Install dev library for libxml2: 

		cd /usr/ports/textproc/libxml2 && make install clean

* 	Install git tool: 

		cd /usr/ports/devel/git && make install clean

* 	Install unzip tool: 
	
		cd /usr/ports/archivers/unzip && make install clean

*NOTE: OpenSSL library should be already provided by the operating system.*

### Installation

*	Move to a location of your choice:

		cd /home/me/

* 	Download archive: 
	
		wget http://www.read-write.fr/wired/zip/wired.tar.gz

* 	Untar binary: 
		
		tar -zxvf wired.tar.gz

* 	Move to unarchived directory: 

		cd wired/

* 	Configure (use --prefix option to set wired root): 
	By default, Wired is installed in `/usr/local/`

		./configure --prefix=/home

* 	Compile: 

		gmake

* 	Install: 

		gmake install

### Running Wired

* 	Run using the shell helper: 

		/home/wired/wiredctl start