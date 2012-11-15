# Migration How-To's

This page provides indications to help users to migrate their current Wired system to this new version. It is also an opportunity to give an update on operated changes et compatibility.

### How to migrate Wired Client<a id="1"></a>

The best way to migrate Wired Client is to export your personnal data from an old version (Zanka 2.0) to re-import them in the new version. You mainly have to export your Bookmarks which can be done using in the Bookmarks panel of the Preferences window. Maybe you also want to export your Tracker Bookmarks, also available in the Preferences window.

About everything else, it is definitely recommended to have a fresh start. Preferences file migration was disabled because it causes too many troubles. Do not try to use an old preferences file (*com.zanka.WiredClientDebugP7.plist*) renamed properly to run with the new version.

NOTE 1: This version of Wired Client currently uses a preferences file named as *fr.read-write.WiredClient.plist*.

NOTE 2: If you run the Debug version of Wired Client, the used preferences file name is *fr.read-write.WiredClientDebug.plist*.

### How to migrate Wired Server<a id="2"></a>

Wired Server versions distributed here provide migration support for Zanka Wired Server 2.0. It includes boards, users, groups and events. To perform the migration you must copy old server files to your new Wired Server directory, <b>before first start</b>. Relevant files are:

<pre>
Wired/banlist
Wired/banner.png
Wired/board/
Wired/etc/wired.conf
Wired/events/
Wired/groups
Wired/topic
Wired/users
</pre>

When copying wired.conf, be careful to not overwriting your current configuration settings.

NOTE: Migration from a Zanka Wired Server 1.3.x should work, but is totally untested yet.

### How to run several Wired Server on the same host<a id="3"></a>

You can run multiple Wired servers on the same host without any problem, regardless to the version (1.3.4, 2.0 from Zanka, or Read-Write). You must be careful to install them in different places on your file-system and listening on different ports. On Linux/BSD you must configure sources with a prefix path:

<pre> ./configure --prefix=/home/wired1 </pre>

Thus, you can install and run many server instances as you like (/home/wired13, /home/wired20a, /home/wired20b, etc.). To change the server port, have a look to "port" field in etc/wired.conf, this to avoid socket conflicts.

If you use a pre-builded version of Wired Server for Mac OS X, and that you don't want to compile any sources, a solution could be to install each Wired Server packages (regardless to the version) on different user accounts. Create several user accounts using System Preferences (wired13, wired20a, etc.) then login to each account to install server package independently, *for the current user only*. 

