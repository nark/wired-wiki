# Wired Server for UNIX

Wired Server for Unix is the Wired server packaged as a portable Unix server daemon and distributed as a source tarball. A compiled version is included within Wired Server for Mac OS X. 

## Requirements 

To install the Wired server, you need the following prerequisites:

*	OpenSSL Library: [http://www.openssl.org/source/](http://www.openssl.org/source/)
	   
* 	libxml2: [http://xmlsoft.org/](http://xmlsoft.org/)
	   
* 	zlib: [http://zlib.net/](http://zlib.net/)

* 	git: [http://git-scm.com/](http://git-scm.com/)

These are usually distributed with operating systems. Have a look to this [page](../howtos/install_howtos.html) to maybe found a dedicated guide for your operating system.


## Installation 

To install Wired, download the latest version from [http://wired.read-write.fr/products/](http://wired.read-write.fr/products/), and unpack the file:

	$ tar -xvzf wired.tar.gz 
	$ cd wired/

To build Wired, you first need to run the configure script. This figures out how to access libraries on your computer:

	$ ./configure

For most installations, this will work. If you get an error, it may be that a library is either installed at an unknown location or simply not installed at all. For example, Wired requires the OpenSSL libraries. These are usually delivered with the OS, but not always at the same place. If you know, for instance, that they are actually installed as /usr/local/ssl/, you can tell the configure script to look for them there:

	$ env CPPFLAGS="/usr/local/ssl/include" LDFLAGS="/usr/local/ssl/lib" \
	./configure

By default, the configure script sets up the server for the user "wired" and the group "daemon". If you do not want a "wired" user, you can run configure like this:

	$ ./configure --with-user=USER --with-group=GROUP

And it will install as that user/group. The install scripts uses /usr/local as the default prefix, which means that Wired will end up in /usr/local/wired/, and man pages in /usr/local/man/. 

When configure has succeeded, you can build and install Wired:

	$ make
	$ make install

The first command compiles and links Wired, the second installs the program and its supports files and manual pages. You may need root privileges to run the second command. 

Note that GNU Make is required to build Wired Server. On BSD systems, this is usually installed as gmake. Then, run this instead:

	$ gmake
	$ gmake install


## Uninstallation 

To uninstall Wired, delete the directory into which you installed it:

	rm -r /usr/local/wired/

Also remove the man pages installed:

	rm /usr/local/man/man1/hl2wired.1
	rm /usr/local/man/man1/wiredctl.1
	rm /usr/local/man/man5/wired.conf.5
	rm /usr/local/man/man8/wired.8

## Configuration 

Wired comes with reasonable default settings, and can be launched immediately, but you may want to make some local changes first. The configuration file is by default placed at `wired/etc/wired.conf`, and is read at startup, or whenever Wired is reloaded. 

The config file is in a "value = key" format, one setting per line. Paths that do not begin with a / are taken to be relative the root path (-d flag).

### Server Settings

*	**name :** Name of the server.

	*Example: name = Wired Server*

*	**description :** A short description of the server.

	*Example: description = Wired Server*

*	**banner :** Path to an image file that will be sent to clients as the banner.
	PNG file format is recommended. Maximum image size is 200x32 pixels.

	*Example: banner = banner.png*

* 	**address :** A specific address to bind to, instead of binding to all available 	addresses. Can be specified more than once, for each address the server should 	listen on.

	*Example: address = 127.0.0.1*

*	**port :**	Port number to listen on.

	*Example: port = 4871*

*	**map port :**	Automatically map port using NAT-PMP or UPnP if available.

	*Example: map port = no*

*	**user :**	Name or id of the user that the server should operate as.

	*Example: user = wired*

*	**group :**	Name or id of the group that the server should operate as.

	*Example: group = daemon*
	
*	**force encryption :**	Ask the server to accept or not incoming connections that do not use an SSL 	encryption cipher.

	*Example: force encryption = true*

### Database Settings

*	**snapshot time :**	If set, snapshots database after this many seconds. Without 	it, snapshots will use the default value.

	*Example: snapshot time = 86400*

### Files Settings

*	**files :**	Path to the files directory.

	*Example: files = files*

*	**index time :** If set, indexes files after this many seconds. Without it, no
	automatic indexing takes place.

	*Example: index time = 14400*

### Transfers Settings

*	**total downloads :** Maximum number of downloads across all clients.

	*Example: total downloads = 10*

*	**total uploads :** Maximum number of uploads across all clients.

	*Example: total uploads = 10*

*	**total download speed :** Maximum total speed of downloads in bytes/sec.

	*Example: total download speed = 100000*

*	**total upload speed :** Maximum total speed of uploads in bytes/sec.

	*Example: total upload speed = 50000*

### Trackers Settings

*	**register :** If set, registers with all configured trackers.

	*Example: register = no*

*	**tracker :** A URL of a tracker to register with. The tracker is connected to at
	startup, and then periodically informed with status updates. The
	path of the URL is the category to register as. Can be specified more
	than once, for each tracker that the server should register with.

	*Example: tracker = wired://wired.zankasoftware.com/*

*	**ip :** IP address to send to the tracker. If this is not set, the tracker
	will automatically register the server as the originating IP address.
	Set this to your external address if you're on the same subnet as the
	tracker, and you're using private addresses behind a firewall.

	*Example: ip = 127.0.0.1*

*	**enable tracker :** If set, enables the tracker.

	*Example: enable tracker = no*

*	**category :** Categories that servers can register with on this tracker. Can be
	specified more than once, for each category. Use "/" to separate subcategories.

	*Example: category = Chat*

## Running Wired Server 

### Using wiredctl 

Wired runs as a daemon in the background and provides output only in the form of logs. Wired can most easily be controlled with the program wiredctl:

	$ wiredctl start
	$ wiredctl reload
	$ wiredctl stop

This starts the server, then reloads its configuration, and finally terminates it. The following commands are recognized by wiredctl:

	start	 	Starts the Wired daemon.

	stop	 	Stops the Wired daemon.

	restart	 	Restarts the Wired daemon. All connections will be lost.

	reload	 	Tells the Wired daemon to reload its configuration by sending it the 
				signal HUP.

	register	Tells the Wired daemon to register with all configured trackers by 
				sending it the 	signal USR1.

	index	 	Tells the Wired daemon to index its files by sending it the signal 
				USR2.

	config	 	Prints the current active configuration.

	configtest	Runs a configuration syntax test, to verify that the config file 
				will be accepted.

	status	 	Prints a status summary.

	help	 	Prints a quick command guide.


Additional argument flags passed with the start and restart commands are passed directly to the Wired daemon:

	$ wiredctl start -ll

Which will pass the flags "-ll" to the Wired daemon, increasing its level of log detail. 

A few default flags are always passed when using wiredctl. These can be edited directly in the wiredctl program, which is implemented as a shell script. The variables near the top of the file controls its functions. For instance:

	# Flags to pass to wired
	WIREDFLAGS="-d /usr/local/wired -ll -u"

This indicates that the above flags are always passed along when doing "wiredctl start". The flags can be edited at will. 

### Command Line Flags 

The following command line options are recognized by the Wired daemon. They can be passed directly on the command line, or via the wiredctl program.

	-D	 				Enables debug mode. The daemon will remain in the foreground, 
						and log messages will echo to standard error.

	-d server_root	 	Sets the server root path. Wired will attempt to locate its 
						required files under this directory, and chroot to it unless 
						-u is set. The default value is set to the path Wired was 
						initially installed as, so it will most often not need to 
						be set.

	-f config_file	 	Sets the path of the configuration file, relative to 
						server_root. The default value is "etc/wired.conf".

	-h	 				Displays a brief help message and exits.

	-i log_lines	 	When logging to a file using -L, limit the number of 
						lines the log may occupy to log_lines.

	-L log_file	 		Sets the path of the file that the daemon should log to. 
						If it is not set, Wired will instead log via syslog.

	-l	 				Increases the log level. Without it, logging is limited 
						to connects and disconnects. Used once, file transfers are 
						also logged. Used twice, the daemon will also log user 
						operations such as kicks, accounts edits, etc.

	-s syslog_facility	Sets the syslog facility to use for logging. See 
						syslog.conf for information on possible values. The 
						default value is "daemon".

	-t	 				Runs a configuration syntax test and exits.

	-u	 				By default, Wired will chroot to the server_root path. 
						The -u flag disables this behaviour. As a result of the 
						default secure behaviour, Wired cannot access any files 
						outside server_root.

	-v	 				Displays version information and exits.

### Support Files 

#### Server Database

Wired Server stores every of its data in the `database.sqlite3` file (accounts, boards, ban-list, etc.). This file is a sqlite 3 container which is automatically saved as `database.sqlite3.bak` following the desired snapshot time setup in the configuration file.

#### Wired Status

A status file for the daemon. It is written to periodically, and is used by wiredctl to display some statistics. The file is a series of numbers, separated by a space character: 

	time of startup
	number of online users
	total number of users
	number of active downloads
	total number of downloads
	number of active uploads
	total number of uploads
	number of bytes downloaded
	number of bytes uploaded
