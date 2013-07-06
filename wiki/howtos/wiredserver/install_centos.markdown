# How to install Wired Server on CentOS

This How-To explains how to compile and install a Wired Server on CentOS/RedHat Linux distribution. 

*NOTE: You have to be able to compile source code. `make`, `gcc` and `autotools` must be installed on your system.*

### Dependencies

* 	Install dev library for **Sqlite3**: 
	
		yum install sqlite-devel

* 	Install dev library for **OpenSSL**: 

		yum install openssl-devel

* 	Install dev library for **libxml2**: 

		yum install libxml2-devel

* 	Install **git** tool: 

		yum install git

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