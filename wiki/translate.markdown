# Translating Wired

Like every well-designed Cocoa applications, Wired software for Mac can be localized in multiple languages. Historically, Wired was distributed in english (main language), french, german, italian and japanese by Zanka Software.

This document explains how to getting started with translation of Wired software. It takes Wired Client as a base example, however these instructions are also work with other Cocoa software of the suite like Wired Serve and Wire Bot.

## Requirements

* Mac OS X 10.8+
* Xcode 4.6+
* Git (installed with Xcode command-line tools)
* A dictionary? ;-)

***IMPORTANT**: It is stronly recommended to use Xcode in order to manage translation resources into the project because it provides you the ability to test your work and prevents from many errors. It is very important to constantly test your work during the localization process, especially about .xib files, because languages characters and expressions could have a sigificant effect on UI sizing and positioning of elements.*

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

### Update localizaion resources

#### Strings files

#### XIB files

### Testing your work

### Sharing translated resources

### How to add a language 

If your target language is not already provided by the project, you can add it directly from Xcode.  This [post](http://stackoverflow.com/questions/5349066/how-to-localize-my-app-with-xcode-4) on StackOverflow.com explains how to do it.

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
* [Internationalize Your App on Apple.com](http://developer.apple.com/library/ios/#referencelibrary/GettingStarted/RoadMapiOS/chapters/InternationalizeYourApp/InternationalizeYourApp/InternationalizeYourApp.html)





