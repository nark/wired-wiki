# How to install Wired Server on Debian/Ubuntu

This How-To explains how to compile and install a Wired Server on Debian/Ubuntu Linux distribution. 

### Dependencies

* 	Install minimal development tools (including GCC): 

		apt-get install build-essential

* 	Install dev library for **Sqlite3**: 
	
		apt-get install libsqlite3-dev

* 	Install dev library for **OpenSSL**: 

		apt-get install libssl-dev

* 	Install dev library for **libxml2**: 

		apt-get install libxml2-dev

* 	Install **git** tool: 

		apt-get install git

### Installation

* 	Download archive: 

		wget http://switch.dl.sourceforge.net/project/wired2/wired/wired.tar.gz

* 	Untar binary: 

		tar -zxvf wired.tar.gz

* 	Move to unarchived directory: 

		cd wired

* 	Configure (use --prefix option to set wired root): 
	By default, Wired is installed in `/usr/local/`

		./configure --prefix=/home

* 	Compile: 

		make

* 	Install: 

		make install

### Running Wired

* 	Run using the shell helper: 

		/home/wired/wiredctl start