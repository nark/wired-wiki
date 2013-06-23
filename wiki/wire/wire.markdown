# Wire for UNIX

Wire is a command line client for Wired. It runs on various Unix compatible platforms, and has been tested to run on Mac OS X, Solaris, FreeBSD, OpenBSD and Linux. 

## Installation 

This installation guide describes how to install Wire in a generic way. You can find specific installation topics for operating systems [here](/howtos/install_howtos.html).

To install Wire, download the latest version from [http://wired.read-write.fr/products/](http://wired.read-write.fr/products/), and unpack the file:

	$ tar -xzf wire-latest.tar.gz 
	$ cd wire-X.X/

To build Wire, you first need to run the configure script. This figures out how to access libraries on your computer:

	$ ./configure

For most installations, this will work. If you get an error, it may be that a library is either installed at an unknown location or simply not installed at all. For example, Wire requires the OpenSSL libraries. These are usually delivered with the OS, but not always at the same place. If you know, for instance, that they are actually installed as /usr/local/ssl/, you can tell the configure script to look for them there:

	$ env CPPFLAGS="/usr/local/ssl/include" LDFLAGS="/usr/local/ssl/lib" \
	./configure

When configure has succeeded, you can build and install Wire:
	
	$ make
	$ make install

The first command compiles and links Wire, the second installs the program and its manual page. The default location is /usr/local/bin/wire, so you may need root privileges to run the second command. 

Note that GNU Make is required to build Wire. 

## Uninstallation 

To uninstall Wired Tracker, delete the directory into which you installed it:

	rm -r /usr/local/wired/

Also remove the man pages installed:

	rm /usr/local/man/man1/trackerdctl.1
	rm /usr/local/man/man5/trackerd.conf.5
	rm /usr/local/man/man8/trackerd.8


## Starting Wire 

After installation, Wire can be started:

	$ wire

When Wire starts up, it reads commands from the file ~/.wire/config. This is a good place to put some global defaults, like your nick name. The file can contain any Wire command, each command on its own line. The commands should not be prepended by "/", like they must be from inside the client:

	$ cat ~/.wire/config
	nick morris
	status @work

Now every time you start Wire, your nick and status will be set as indicated. 

Any other file you place in ~/.wire can be accessed like bookmarks:

	$ cat ~/.wire/myserver
	nick morris
	status @home
	open my.server.com
	$ wire myserver

Wire will now first load ~/.wire/config, like it always does, and then ~/.wire/myserver. The settings in the myserver bookmark will then override the previous ones. It will also connect to the server. 

## Windows 

Wire creates new windows in certain situations. To cycle windows, press Control-P for previous and Control-N for next. The close command closes the current window. Note that closing the main window is the same as exiting the program. 

## Commands 

Wire is controlled using special commands. While the client is running, these commands are input prepended by a slash:

	/nick morris

Without the slash, the input will be sent to the server as chat. 

Wire supports the following commands: 

TBD

ban	 Bans a user. The first argument is the user to ban, the second is the message to send.
Example: /ban morris get lost
See also: kick

broadcast	 Broadcast a message to all users.
Example: /broadcast restarting server

cd	 Changes the working directory.
Example: /cd /Uploads

charset	 Sets the character set that wire will convert all text from the server to. This string is passed directly to the iconv character conversion system. The default value is "ISO-8859-1".
Example: /charset UTF-8

clear	 Clears all output.
Example: /clear

clearnews	 Clears the news.
Example: /clearnews

close	 If in main window, disconnects from the current server. Otherwise, closes the wi ndow.
Example: /close

comment	 Sets a file comment. The first argument is the path, the second is the comment to set.
Example: /comment "/Uploads/a file.txt" uploaded by morris

get	 Downloads a file. If a transfer is already running, queue the download. Files are downloaded into the directory from which Wire was started.
Example: /get "/Uploads/a file.txt"

help	 Shows online help. If an argument is provided, shows online help for that command.
Example: /help, /help get

ignore	 Manage user ignores. Without arguments, shows the current list of ignores, identified by id. With an argument, adds a user to the list. No chat or messages are printed from users whose nicks match an entry in the ignore list.
Example: /ignore, /ignore morris
See also: unignore

info	 Gets user info on the user with the nick name provided.
Example: /info morris

kick	 Kicks a user. The first argument is the user to kick, the second is the message to send.
Example: /kick morris get lost
See also: ban

load	 Loads a bookmark with the name provided from ~/.wire/.
Example: /load myserver

log	 Saves a copy of the current output to the file provided.
Example: /log myserver.log

ls	 Lists the current directory, or if an argument is provided, the path.
Example: /ls, /ls /Uploads

me	 Sends the argument as action chat.
Example: /me is away

mkdir	 Creates a new directory.
Example: /mkdir /Uploads

msg	 Sends a private message to the user with the nick name in the first argument. The second argument is the message to send.
Wire will create a new window when sending or receiving a private message for every user. Typing text in these windows will send private messages to that user.
Example: /msg morris hey!

mv	 Moves or renames one path to another.
Example: /mv /Uploads "/Old Uploads"

news	 Shows the server news. A flag can be passed to set how many news entries to show, which is 10 by default. If "ALL" is specified rather than a number, the whole news is shown.
Example: /news, /news -20, /news -ALL

nick	 Sets the current nick name.
Example: /nick morris

open	 Opens a new connection to a server. The current connection is closed. Login and password can be set with the -l and -p flags.
Example: /open my.server.com, /open -l morris -p p4ssw0rd my.server.com:3000

ping	 Pings the server to determine latency.
Example: /ping

post	 Posts a new entry to the server news.
Example: /post check out /Uploads/a file.txt

put	 Uploads a file to the current working directory. If a transfer is already running, adds the upload to the transfer queue.
Example: /put ~/a\ file.txt

pwd	 Shows the current working directory.
Example: /pwd

quit	 Quits Wire.
Example: /quit

reply	 Like msg, but sends the message to the user who sent you a message last.
Example: /reply i agree

rm	 Deletes the path.
Example: /rm /Uploads

save	 Saves the current settings and connection as a bookmark in ~/.wire/.
Example: /save myserver

search	 Searches the files on the server and displays a list of results.
Example: /search .jpg

serverinfo	 Prints information about the current server.
Example: /serverinfo

start	 Starts a previously queued transfer by id.
Example: /start 1

stat	 Gets file info on the path.
Example: /stat /Uploads/a\ file.txt

status	 Sets the current status.
Example: /status away

stop	 Stops a running transfer by id.
Example: /stop 1

topic	 Without arguments, prints the current chat topic. With an argument, sets a new topic.
Example: /topic, /topic welcome to my.server.com

type	 Sets the folder type. The first argument is the path, the second is one of "folder", "uploads" and "dropbox", indicating the folder type.
Example: /type /Uploads uploads

unignore	 Removes an ignored user by id.
Example: /unignore 1

See also: ignore
uptime	 Shows current uptime statistics.
Example: /uptime

version	 Shows version information.
Example: /version

who	 Shows the user list.
Example: /who


## Character Sets 

Wire supports character set translation through iconv. All messages to and from the server are sent in Unicode, UTF-8, so any language should be usable. However, you may need to do some configuration before this is possible. 

By default, Wire translates the server's UTF-8 strings to and from ISO-8859-1 (ISO-Latin1), which is the most commonly used character set for Western European languages. To change this to another character set, for example, UTF-8 itself, you can run the command charset:

	/charset UTF-8

The argument is passed directly to iconv, and can be any character set supported by the library. Make sure your charset setting matches the character set configured in your terminal. 