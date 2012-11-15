# Wired Server for Mac OS X

The Mac OS X version of Wired Server is a distribution made up by a Wired Server and a graphical control interface in the form of standalone Cocoa application. The server is built especially for Mac OS X and includes support for extras like Bonjour.

The application includes a regular Wired Server, and can thus also be configured entirely via the Terminal. The Wired Server part is installed into `~/Library/Wired`. 

It is important to know that Wired Server for Mac OS X runs several processes on your system:

* **wired:** UNIX core server program
* **Wired Server.app:** A standalone Cocoa application to manage the server process and settings
* **Wired Server Helper.app:** A status menu application for a better integration 

## [I. Requirements](#Requirements)

* Intel-based Mac
* Mac OS X 10.6 Snow Leopard
* 15 MB of disk space

## [II. Installation](#Installation)

It is strongly recommanded to install Wired Server on a clean operating system, especially cleared of old versions of Wired Server.

1. Download latest Wired Server for Mac OS X [here](http://www.read-write.fr/wired/zip/WiredServer.zip).
2. Unarchive the package and drop `Wired Server.app` into your `/Applications` directory.
3. Open `Wired Server.app` and click the *Install* button of the *General* panel.
4. When finished, click on the *Start* button to launch your new Wired Server 2.0.
5. Try to connect with Wired Client at `localhost` with `admin` login and without password.

![wired server mac 1](img/wiredservermac1.png)

If you experiment any trouble, please check the [Troubleshootings](#Troubleshootings) section to maybe found a clue for your issue. 

## [III. Uninstallation](#Uninstallation)

Uninstalling Wired Server entirely will delete the server database and all configuration files. It is recommended to export your data before uninstalling. For that, have a look to the [Import/Export](#Import/Export) section.

1. Open `Wired Server.app` and click the *Uninstall* button of the *General* panel.
2. When finished, qui the application and move it to the `Trash`.

![wired server mac 2](img/wiredservermac2.png)

**NOTE:** If you enabled the status menu, it's recommended to disable it from the `Wired Server.app` user interface before moving Wired Server to the `Trash`.

## [IV. Settings](#Settings)

Wired Server for Mac OS X provides controls to manage server settings and features. Several of these features are regrouped into several panels.

### General

![wired server mac 1](img/wiredservermac1.png)

The *General* panel gives an overview of the server status and minimal controls to manage the server process. 

* **Install/Uninstall** : Use this button to install or uninstall the Wired Server UNIX core. It will be installed in `~/Library/Wired` of your current user account. Use the little arrow button to reveal this place in Finder.
* **Start/Stop** : Use this button to start or stop the Wired Server process.
* **Launch Wired Automatically** : Enable it to install a *LaunchDaemon* plist on your system, asking for Wired Server to be launched at system startup (`launchd`). 
* **Enable Status Menu** : Enable the status menu into the Finder menu bar.

![wired server mac 1.1](img/wiredservermac1.1.png)

### Network

![wired server mac 3](img/wiredservermac3.png)

The *Network* panel provides server port settings, port status and port mapping.

* **Port Status** : The port status helps you to check the availability of your Wired server from the outside using a Perl web service (port can be closed, open or filtered). 
* **Listening Port** : Choose here the port you want Wired Server to listen on. You must restart the server after changing port.
* **Map Port Automatically** : Enable it to automatically map port using NAT-PMP or UPnP if your router/gateway supports it.

### Files

![wired server mac 4](img/wiredservermac4.png)

Here you can manage shared files that are available to connected and authorized clients.

* **Files Folder** : Choose the place on your file system that Wired Server will index as its files directory.
* **Index Time** : Set the time interval that the server use to reindex file regularly.
* **Reindex** : Use the Reindex button to index server files manually.

### Advanced

![wired server mac 5](img/wiredservermac5.png)

* **Admin Account Status** : Display the status of the user account named as "admin".
* **Set Password for "admin"** : Change the password of the "admin" account in the database.
* **Create a new "admin" User** : Create a new "admin" account into the database.
* **Automatically Prune Events** : Automatically prune server events from the database after the selected time (none, daily, weekly, monthlt or yearly)
* **Activate Database Snapshots** : Ask the server to make a snapshot of the database after the selected interval (stored as `~/Library/Wired/database.sqlite3.bak`).
* **Make a snapshop every** : Time interval used by server to perform snapshots.

### Logs

![wired server mac 6](img/wiredservermac6.png)

* **Open Logs** : Click this button to open Wired Server log file with `Console.app`.

### Update

![wired server mac 7](img/wiredservermac7.png)

* **Check for Update at Launch** : The application will check for new available version at launch.
* **Autmatically Download New Updates** : The application will autmatically download new available version.
* **Check for Updates** : Use this button to check for new available version manually.

### [Import/Export](#Import/Export)

Wired Server for Mac OS X supports import and export of the server configuration and database in a single archive file, to facilitate migration process. 

* **Menu > File > Export Settings…** : (TBD)
* **Menu > File > Import Settings…** : (TBD)

### Administrate from Wired Client

 (TBD)

## [V. Migration](#Migration)

If you are currently using an older version of Wired Server and you want to migrate to this new version, have a look to this [how-to](../howtos/migration_howtos.html).

## [VI. Troubleshootings](#Troubleshootings)

* Two Wired Server instances running on the same port (TBD)

* Wired Server run as a ghost (TBD)

* I can't upload files, post in boards, etc. (TBD)