# Translating Wired

Like every well-designed Cocoa applications, Wired software for Mac can be localized in multiple languages. Historically, Wired was distributed in english (main language), french, german, italian and japanese by Zanka Software.

This document explains how to getting started with translation of Wired software. It takes Wired Client as a base example, however these instructions are also work with other Cocoa software of the suite like Wired Serve and Wire Bot.

## Requirements

* Mac OS X 10.8+
* Xcode 4.6+
* Git (installed with Xcode command-line tools)
* A dictionary? ;-)

**IMPORTANT**: It is stronly recommended to use Xcode in order to manage translation resources into the project because it provides you the ability to test your work and prevents from many errors. It is very important to constantly test your work during the localization process, especially about .xib files, because languages characters and expressions could have a sigificant effect on UI sizing and positioning of objects.

## How it works

In Wired Cocoa applications, several types of resource can be localized:

* Strings files (.strings) : they contain litteral text strings directly used dynamically in the code
* Interface Builder files (.xib) : they are files used in Xcode to build the user interface (WYSIWYG-style)
* Rich Text Format (.rtf) : they are simple information files, mainly used here for credits.

Xcode provides a very handy way to manage each language of a localized resources. It outlines them inside the file resources:

![Translate Resources Screenshot](img/translate_resources.png)

So all you have to do is to browse these files in order to translate their content, as explained in details later in this document.

## How to getting started

### Compile Wired Client

Once you have Xcode, Git and all the requirements ready, you have to get sources and to compile the project by your own. Hopefully, Git and Xcode makes this very easy:

1. Open a terminal window and type:

		git clone https://github.com/nark/WiredClient.git WiredClient/
		
2. Once finished, move into the `WiredClient/` directory:

		cd WiredClient/
		
3. Initilize every dependencies (git will download submodules, it can take some time):

		git submodule update --init --recursive
		
4. Open `WiredClient.xcodeproj` with Xcode
5. Make sure that the `Wired Client > Mac 64-bit` scheme is selected in the toolbar then press the "Run" button. It will compile every dependencies and Wired Client will start automatically when finished.

![Scheme Screenshot](img/scheme.png)

### How to add a language 

If your target language is not already provided by the project, you can add it directly from Xcode. Select Wired Client project at the top of the Sidebar, then again, select Wired Client has a project and display the info panel. Here you can add localization resources:

![Add Localization to Project Screenshot](img/add_language.png)

If you need more information on the subject, this [post](http://stackoverflow.com/questions/5349066/how-to-localize-my-app-with-xcode-4) on StackOverflow.com explains many things.

*NOTE: Don't care if Xcode complains about already existing resources, just press OK, the job should be done even so.*

### Update localizaion resources

Now it's time for the real work. Fortunately Xcode makes it easy. I always starts by Strings files, but there is no matter if you start by the one or the other.

#### Strings files

Strings files are very simple key/value pair listing of text expressions. They are used by `NSLocalizedString`, the Cocoa function that dynamically choose the good resource for a target language. String keys always refer to the main language, here english. Each String entry is preceded by a comment, that is not needed but very useful for both programmers and translators to well communicate.

Here the english version of a String:

	/* Wired protocol error title */
	"Login Failed" = "Login Failed";
	
Now the corresponding french translation:

	/* Wired protocol error title */
	"Login Failed" = "L'authentification a échoué";
	
So it's very easy, **you only have to modify the second part of the expression** (after the equal character) with your desired language. Quotes are needed, obviously.

Sometimes you will see some formatting stuff like in this example:

	/* Transfer disconnected (transferred, size) */
	"Disconnected at %@ of %@" = "Disconnected at %1$@ of %2$@";
	
Expressions with `%` prefix refer to variables, dynamically filled at runtime. You don't have to care about this complicated syntax, you mainly have to update textual values. There are few rare cases where you want to change the formatting in order to use the common syntax of you desired language (i.e. time formatting). 

#### XIB files

XIB files are a little more complicated because you really have to put hands dirty. If you open a .xib file into the Xcode project, you will see the graphical user interface editor (formerly, Interface Builder). Like for every localized resources in Xcode, a .xib file can be outlined in order to show its multiple localization versions. So, be sure to modify the good version for your target language.

If you do not know the Xcode editor at all, I recommand you to have a look first. It provides many tools I wont describe here, but you can find some help in the [Apple documentation (Edit User Interface)](http://developer.apple.com/library/mac/#documentation/ToolsLanguages/Conceptual/Xcode_User_Guide/030-Edit_User_Interfaces/edit_user_interface.html).

There are no particular rules to follow when translating .xib file except the famous "follow [Apple Human Interface Guidelines](https://developer.apple.com/library/mac/#documentation/UserExperience/Conceptual/AppleHIGuidelines/Intro/Intro.html)". I retain two major topics that seem important to contribute smartly to this:

* Respect and follow Apple Human Interface Guidelines as much as possible. They offer a very good point of view on how to use and put together objects of the Cocoa interface.
* Respect developper choices and do not extends the UI with non-official stuffs. Try to stay as close as possible  to the original view.

If you have to resize or reposition interface objects, have a look to how things are aligned in others .xib files or other Cocoa applications. There is no better way to learn.

Sometimes you will find the <<do not localize\>\> keyword. It means that values inserted here will be dynamically loaded at runtime (from String files !).

### Testing your work

Testing your work is very easy. Just Run the project, this will compile Wired Client with lastest files you updated. Be careful to every nook and cranny because there is always something missing, always. :-)

As said above, testing your work continuously is very important in order to make sure you don't introduice errors in the program. I see three main kinds of common errors to check:

* Does the Xcode project compile properly ? Xcode make many check at compile time. It can find a forgotten quote in a string file, for example.
* Does I properly translate the original expression ? This is the hard part of art of translating software beacuse it can get very subjective. Hopefully you are not the first trying to translate "unexpectedly" in your natural language, it already exists thousand of stock phrases for most of our purpose. :-)
* Does the interface is free of every issue that could mislead the user ? Be sure that every text are visible and well positioned. Sometimes a little UI issue could have dramatical results.

### Sharing translated resources

I still need to make some test with ibtool, Git and branches to see if we could use all these stuffs in order to work together as a team without to much effort. TBD

In the meantime, contact us on the [official server](contacts.html#official) in order to share your work and to see it integrated to the next release.

## Requested languages

Every languages are welcome but some are primarily missing:

* Spanish
* Chinese
* Arabic
* Swedish
* Indian
* Portuguese

You are welcome to contribute. Join us on the [official server](contacts.html#official) or [GitHub.com](https://github.com/nark) if needed.


## Usefull Links

Following links are good references about Cocoa localization:

* [How to localize my app with Xcode 4 on StackOverflow.com](http://stackoverflow.com/questions/5349066/how-to-localize-my-app-with-xcode-4)
* [Internationalize Your App on Apple.com](http://developer.apple.com/library/ios/#referencelibrary/GettingStarted/RoadMapiOS/chapters/InternationalizeYourApp/InternationalizeYourApp/InternationalizeYourApp.html) (based on iOS, but it's almost the same for OSX)
* [Edit User Interface at Apple.com](http://developer.apple.com/library/mac/#documentation/ToolsLanguages/Conceptual/Xcode_User_Guide/030-Edit_User_Interfaces/edit_user_interface.html)
* [Apple Human Interface Guidelines](https://developer.apple.com/library/mac/#documentation/UserExperience/Conceptual/AppleHIGuidelines/Intro/Intro.html)




