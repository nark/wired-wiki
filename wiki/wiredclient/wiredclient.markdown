# Wired Client for Mac OS X

*Note: This page is currently more a getting started, not the complete documentation for Wired Client on Mac OS X. It presents the basics to setup a connection and will be updated over time.*

Wired Client is a native Mac OS X client, designed using Cocoa. It features full support and compatibility with the Wired protocol and the Wired server, with an interface that is as ingenious as it is easy to use. 

### 1. Requirements

- Intel Macs 32 or 64 bits
- Mac OS X 10.6+ (10.8 supported)


### 2. Installation

To install Wired Client, download the latest version from [http://wired.read-write.fr/products/](http://wired.read-write.fr/products/). Unpack the archive, and drag the resulting file to any directory on the hard drive, for example, the Applications folder. 

![Client App Icon](img/client-app.jpg)

#### 2.1. Uninstallation

To uninstall Wired Client, delete the file from where you installed it. 

#### 2.2. Nightly Builds

In addition to the stable version, Read-Write.fr also distributes nightly builds of Wired Client. These builds, which are stampted as "Debug", provide a log console, are more verbose, and run against a differentiated preferences file (~/Library/Preferences/fr.read-write.WiredClientDebug.plist) to facilitate beta-testing. They also benefit of a dedicated software auto-update feed for your convenience. 

### 3. Connectiong To Servers

When opening, Wired Client shows you the Chat Window. On the left of this window you can see the Sidebar which organizes a set of available resources. 

![ServerList Screenshot](../img/overview.png)

* Bonjour Servers : local Wired servers available via Bonjour protocol

* Bookmark Servers : favorite servers you can save and manage

* Tracker Servers : trackers register Wired servers you can browse

Double-click on a server in the Sidebar to connect to it. You will see a Connect window appears, and if the connection succeeded, a new tab is added to the Chat Window.

This connect window is also accessed using "Connect" on the connection menu. Enter a server hostname, and any login information needed. Most server accept a blank login via a guest account. Hit "Connect" to start the connection. 

![Connect Screenshot](img/connect.png)

One connect window is displayed per connection. To cancel a connection, hit "Cancel" or just close the window. If you become disconnected from a server, you can select "Reconnect" from the connection menu to bring up the connect window again and reconnect to the server. 

To connect to a previously saved bookmark, select it from the bookmarks menu.