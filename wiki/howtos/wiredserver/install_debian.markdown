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
		
### Configure 

Before launching wired on a Debian-based system, it is recommended to configure and to secure the environment.

 

1. Crée un utilisateur ordinaire en utilisant la commande adduser, exemple:

		adduser <non du l'utilisateur> 
		
		(ex: adduser toto)

	Par défaut le dossier wired ce trouve en utilisateur root et group daemon ce qui signifie 	que le propriétaire est root et non l'utilisateur ordinaire.

2. Pour changer cela faire utiliser la commande chown 

		chown -R utilisateur ordinaire:daemon /home/wired 
		
		(ex: chown -R toto:daemon /home/wired)

	Le dossier wired appartient maintenant à l'utilisateur ordinaire

3. Il ne reste plus modifier le fichier `wired.conf` qui ce trouve dans le dossier `/home/wired/etc/`

		nano /home/wired/etc/wired.conf

	Modifier la ligne 

		# Name or id of the user that the server should operate as.
		# (default "wired")	
		user = mettre le nom de l'utilisateur ordinaire (ex : toto)

	Dans le wired.conf pouvez aussi modifier le nom du serveur, la description, le port du serveur, etc....

4. connectez vous ensuite en utilisateur ordinaire est lancer wired serveur 

		/home/wired/wiredctl start

Utiliser ensuite wired client utilisateur par défaut (admin/sans mot de passe)

### Running Wired

* 	Run using the shell helper: 

		/home/wired/wiredctl start