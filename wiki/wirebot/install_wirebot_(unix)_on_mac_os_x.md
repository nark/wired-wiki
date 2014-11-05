# Install wirebot (UNIX) on Mac OS X

These instructions are tested on Mac OS X 10.8, they could differ with earlier versions.

1. Install Xcode (from App Store) and Command-Line Tools ([link](http://stackoverflow.com/questions/9329243/xcode-4-4-command-line-tools))
2. Install Homebrew ([link](http://brew.sh))
3. Install GNU readline library:

		brew install readline

4. Clone sources from repository:

		git clone https://github.com/nark/wirebot.git
		
5. Move into the cloned directory:

		cd wirebot/
		
6. Init dependencies:

		git submodule updtae --init --recursive
		
7. Configure (with readline paths):

		env CPPFLAGS="-I/usr/local/opt/readline/include" LDFLAGS="-L/usr/local/opt/readline/lib" ./configure
		
8. Compile sources:

		make

9. Install binary, with permissions:

		sudo make install
		
