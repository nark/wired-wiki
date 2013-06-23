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

In addition to the stable version, Read-Write.fr also distributes nightly builds of Wired Client. These builds, which are stampted as "Debug", provide a log console, are more verbose, and run against a differentiated preferences file (`~/Library/Preferences/fr.read-write.WiredClientDebug.plist`) to facilitate beta-testing. They also benefit of a dedicated software auto-update feed for your convenience. 

### 3. Connect to a Servers

Double-click on a server in the Sidebar on the left to connect to it. You will see a Connect window appears, and if the connection succeeded, a new tab is added to the Chat Window.

This connect window is also accessed using "Connect" on the connection menu (cmd + K). Enter a server hostname, and any login information needed. Most server accept a blank login via a guest account. Hit "Connect" to start the connection. 

![Connect Screenshot](img/connect.png)

One connect window is displayed per connection. To cancel a connection, hit "Cancel" or just close the window. If you become disconnected from a server, you can select "Reconnect" from the connection menu to bring up the connect window again and reconnect to the server. 

To connect to a previously saved bookmark, select it from the bookmarks menu or double-click it in the Sidebar.

### 4. The Main Window

Wired Client uses the Chat Window as the main window. The Chat Window regroups every resources and every features, organized around public chats bound to multiple connections.

![ServerList Screenshot](../img/overview.png)

#### The Toolbar 

You can found a toolbar at the top of the window that provides many Wired features like *Boards*, *Messages*, *Files*, *Transfers*, *Settings*, etc.

*Messages* and *Boards* toolbar items can show a numeric badge with the number of unread objects. The *Transfers* toolbar item can display the number of unfinished transfers.

The toolbar has the particularity to host the server *Banner* image. Clicking on the banner show you the server info panel.

![Server Info Screenshot](img/server_info.png)

You can customize the toolbar using menu *View > Customize Toolbar…*

####  The Tabbar
 
This window uses a tabbar in order to organize connections to Wired servers. In this document we often will use terms like "selected server" or "current connection" which refer to the server associated with the tab currently selected in the tabbar.

Tabbar items show colored notification bubbles to notify some events:

* Regular chat: user talking in the public chat
* Other events setup to be posted in the chat *(See Preferences > Events)*
* Enabled Chat Highlights *(See Preferences > Chat > Highlights)*

*NOTE: The color of the notification bubble matches the color of the colesponding resource setup in you current theme. (See Preferences > Themes)*

Tabbar items also show a numeric badge with unread messages and board posts combined for the current connection.

*NOTE: The tabbar is only visible when you have several servers connected at the same time.*

####  The Sidebar

The Sidebar on the left provides Wired resources:

* Bonjour Servers : local Wired servers available via Bonjour protocol
* Bookmark Servers : favorite servers you can save and manage
* Tracker Servers : trackers register Wired servers you can browse and connect

![Sidebar Screenshot](img/serverlist.png)

#### The User List

#### The Public Chat

### 5. Boards

![Boards Screenshot](img/boards.png)

### 6. Messages

![Messages Screenshot](img/messages.png)

### 7. Files

![Files Screenshot](img/files.png)

### 8. Transfers

![Transfers Screenshot](img/transfers.png)

### 9. Settings

![Settings Screenshot](img/settings.png)

### 10. Chat History

![Chat History Screenshot](img/chat_history.png)

### 11. Preferences

![Preferences Screenshot](img/preferences.png)
