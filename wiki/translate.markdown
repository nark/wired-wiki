# Translating Wired

Like every well-designed Cocoa applications, Wired software for Mac can be localized in multiple languages. Historically, Wired was distributed in english (main language), french, german, italian and japanese by Zanka Software.

This document explains how to getting started with translation of Wired software. It takes Wired Client as a base example, however these instructions are also working with other Cocoa software of the suite like Wired Server and Wire Bot.

## Before Starting

### Resources

To organize localized resources, Xcode use bundle directories with ".lproj" extension, for Language Project I suppose. The name of these language directories is related to language itself: "en.lproj", "fr.lproj", "de.lproj", "it.lproj", etc. Each of these .lproj directories should contains translated copies of every file in the master language .lproj directories, here "en.lproj" because english is the main language.

In Wired Cocoa applications, several types of resource can be localized:

* Strings files (.strings) : they contain literal text strings directly used dynamically in the code
* Interface Builder files (.xib) : they are files used in Xcode to build the user interface (WYSIWYG-style)
* Rich Text Format (.rtf) : they are simple information files, mainly used here for credits.

### How to translate

They are several ways to translate a Cocoa application. In this case, I will introduce two complementary ways to achieve our localization.

#### Using Xcode

Xcode provides a very handy way to manage each language of a localized resources. It outlines them inside the file sidebar:

![Xcode Localized Resources Screenshot](img/translate_resources.png)

All you have to do is to browse these files in order to translate their content, as explained in details later in this document.

#### Using the Localization Suite

The Localization Suite provide an application named "Localization Manager.app" which is dedicated to internationalization of Cocoa applications. Localizers can focus on their work without having to know a little of Xcode:

![Localization Manager Screenshot](img/localization_manager.png)

Which is great, but also initiates an important issue. When you translate .xib files directly using Xcode, you display the result in real-time. Characters and expressions from different languages could have a significant effect on sizing and positioning of elements in the user interface, what you can not really experiment with Localization Manager, because you translate "blindly".

#### Mixing both of them

My recommended solution is to mix both Xcode and Localization Manager in order to have the best results. Xcode gives you the ability to edit .xib files comfortably, while the Localization Manager helps you to not miss a string.

#### Another good reason for using Xcode

It is strongly recommended to use Xcode because it provides you the ability to test your work and prevents from many errors. It is very important to constantly test your work during the localization process, because a translation issue can sometimes hide a bug.

### How to contribute

You know a little more about localization in Wired, but how to contribute ? I will explain how to share your work to be included in the next versions. Wired source code is hosted at GitHub which provides several features we will use in order to share and merge sources coming from many different translated projects.

#### Fork

GitHub gives you the ability to fork a project. In the open-source language, a "fork" is a clone of a project that takes another new direction. We will use this feature to benefit of another great one called "pull-requests".

#### Pull-requests

When you made a fork, you sometimes want to give back some piece of work as a contribution to the source code base of the leading project. GitHub provides this feature for free, based on Git merge abilities, and we will use it to work all together.

#### The workflow

I made a diagram to represent the workflow of the distribution of an application, from source code to binaries, going through testing and localization.

![Distribution Workflow](img/distribution_workflow.png)

Instructions detailed below explain how all this work actually. Continue reading.

## Getting Started

This example shows how to localize a Cocoa application of the Wired project, taking the french localization of Wired Client as an example. This process uses several tools (all free) you need in order to continue.

### Requirements

* Mac OS X 10.8+
* Xcode 4.6+: [https://itunes.apple.com/fr/app/xcode/id497799835?mt=12](https://itunes.apple.com/fr/app/xcode/id497799835?mt=12)
* Localization Suite: [http://www.loc-suite.org](http://www.loc-suite.org)
* Git (provided with Xcode command-line tools)
* A dictionary? ;-)

### Compile Wired Client

1. Sign in to GitHub (or create an account if not already done)

2. Go to [https://github.com/nark/WiredClient](https://github.com/nark/WiredClient) and "fork" the WiredClient repository. This will take few minutes. 

3. Next, go to the page of your newly forked WiredClient repository: *https://github.com/xxx/WiredClient*. Here, I recommend to have a look to repository *Settings* in order to rename it, in my case as "WiredClient-FR".

4. Now locally clone your forked repo (note the new URL after rename): 

		$ git clone https://github.com/xxx/WiredClient-FR WiredClient-FR/
		
5. Move to the cloned directory:

		$ cd WiredClient-FR/
		
6. Clone every dependencies (git submodules), this will take a few minutes:

		$ git submodule update --init --recursive
		
7. At this step, you can compile your own Wired Client.app. Open `WiredClient.xcodeproj` with Xcode.

9. Make sure that the `Wired Client > Mac 64-bit` scheme is selected in the toolbar then press the "Run" button. It will compile every dependencies and Wired Client will start automatically when finished.

![Scheme Screenshot](img/scheme.png)

**NOTE:** This version of the client is a debug version. See "2.2. Nightly Builds" section of [this page](/wiredclient/wiredclient).

### How to add a language 

#### With Xcode

If your target language is not already provided by the project, you can add it directly from Xcode. Select Wired Client project at the top of the Sidebar, then again, select Wired Client has a project and display the info panel. Here you can add localization resources:

![Add Localization to Project Screenshot](img/add_language.png)

If you need more information on the subject, this [post](http://stackoverflow.com/questions/5349066/how-to-localize-my-app-with-xcode-4) on StackOverflow.com explains many things.

*NOTE: Don't care if Xcode complains about already existing resources, just press OK, the job should be done even so.*

#### With Localization Manager

You can also add a language from Localization Manager. TBD

### Update localization resources

Now it's time for the real work. Fortunately our tools make it easy. I always starts by Strings files, but there is no matter if you start by the one or the other.

#### Strings files

##### With Xcode

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

##### With Localization Manager

TBD

#### XIB files

XIB files are a little more complicated because you really have to put hands dirty. If you open a .xib file into the Xcode project, you will see the graphical user interface editor (formerly, Interface Builder). Like for every localized resources in Xcode, a .xib file can be outlined in order to show its multiple localization versions. So, be sure to modify the good version for your target language.

##### With Xcode

If you do not know the Xcode editor at all, I recommend you to have a look first. It provides many tools I wont describe here, but you can find some help in the [Apple documentation (Edit User Interface)](http://developer.apple.com/library/mac/#documentation/ToolsLanguages/Conceptual/Xcode_User_Guide/030-Edit_User_Interfaces/edit_user_interface.html).

There are no particular rules to follow when translating .xib file except the famous "follow [Apple Human Interface Guidelines](https://developer.apple.com/library/mac/#documentation/UserExperience/Conceptual/AppleHIGuidelines/Intro/Intro.html)". I retain two major topics that seem important to contribute smartly to this:

* Respect and follow Apple Human Interface Guidelines as much as possible. They offer a very good point of view on how to use and put together objects of the Cocoa interface.
* Respect developer choices and do not extends the UI with non-official stuffs. Try to stay as close as possible  to the original view.

If you have to resize or reposition interface objects, have a look to how things are aligned in others .xib files or other Cocoa applications. There is no better way to learn.

Sometimes you will find the <<do not localize\>\> keyword. It means that values inserted here will be dynamically loaded at runtime (from String files !).

##### With Localization Manager

TBD

### Testing your work

Testing your work is very easy. Just Run the project into Xcode, this will compile Wired Client with latest files you updated. Be careful to every nook and cranny because there is always something missing, always. :-)

As said above, testing your work continuously is very important in order to make sure you don't introduce errors in the program. I see three main kinds of common errors to check:

* Does the Xcode project compile properly ? Xcode make many check at compile time. It can find a forgotten quote in a string file, for example.
* Does I properly translate the original expression ? This is the hard part of art of translating software because it can get very subjective. Hopefully you are not the first trying to translate "unexpectedly" in your natural language, it already exists thousand of stock phrases for most of our purpose. :-)
* Does the interface is free of every issue that could mislead the user ? Be sure that every text are visible and well positioned. Sometimes a little UI issue could have dramatical results.

### Sharing translated resources

When your work is done, you have to use Git in order to first publish your code on your own forked repository, then GitHub to send a pull-request to the original repository, here [https://github.com/nark/WiredClient](https://github.com/nark/WiredClient).

Here we will use four Git commands to publish trasnlated files to your remote repository on GitHub:

* `git status`: display a list of modified files. Very handy to monitor files state.
* `git add <file>`: this command will add files for the next commit
* `git commit -m <message>`: create a new commit with a message with details of your changes
* `git push`: send changes to your remote repository

#### Status, add, commit and push

1. Be sure you are in your cloned directory:

		$ cd WiredClient-FR/

2. Ask Git to display modified files:

		$ git status
		
		# On branch master
		# Changes not staged for commit:
		#   (use "git add <file>..." to update what will be committed)
		#   (use "git checkout -- <file>..." to discard changes in working directory)
		#
		#	modified:   WiredClient.ldb/Contents.plist
		#	modified:   WiredClient.ldb/nark.locuser
		#	modified:   fr.lproj/Administration.xib
		#	modified:   fr.lproj/Connect.xib
		#	modified:   fr.lproj/Console.xib
		#	modified:   fr.lproj/Error.xib
		#	modified:   fr.lproj/FileInfo.xib
		#	modified:   fr.lproj/Files.xib
		#	modified:   fr.lproj/History.xib
		#	modified:   fr.lproj/MainMenu.xib
		#	modified:   fr.lproj/Messages.xib
		#	modified:   fr.lproj/Preferences.xib
		#	modified:   fr.lproj/PrivateChatInvitation.xib
		#	modified:   fr.lproj/PublicChat.xib
		#	modified:   fr.lproj/SaveChat.xib
		#	modified:   fr.lproj/ServerInfo.xib
		#	modified:   fr.lproj/TrackerServerInfo.xib
		#	modified:   fr.lproj/Transfers.xib

		#
		no changes added to commit (use "git add" and/or "git commit -a")
		
3. In our case, we only want to add "fr.lproj" related files:

		$ git add fr.lproj/*
		
	This step is very important because it is here you choose what files that will be merged with the master repository. Be carefull to exactly add relevant files, this to avoid potential conflicts.
		
4. Add a commit message to keep a trace of your changes:

		$ git commit -m "Updated xib files for version 2.0.3 (286)"
		
5. Push your sources to your own repository on GitHub:

		$ git push
		
#### Send a pull-request
		
1. Go to your pull-requests page on GitHub: *https://github.com/xxx/WiredClient/pulls* and click to the green "New Pull Request" button, and follow instructions to complete the process.
2. I will receive your pull-request and merge files of your target language with the master repository. 
3. You should receive an email when merge is done. 

Also, you can connect to the [official server](contacts.html#official) to ask us some questions and share your thought. 

Of course, you will be openly credited for your work in applications About window.

## Requested languages

Every languages are welcome but some are primarily missing:

* Spanish
* Chinese
* Arabic
* Swedish
* Indian
* Portuguese

You are welcome to contribute. Join us on the [official server](contacts.html#official) or [GitHub.com](https://github.com/nark) if needed.

## Useful Links

Following links are good references about Cocoa localization:

* [How to localize my app with Xcode 4 on StackOverflow.com](http://stackoverflow.com/questions/5349066/how-to-localize-my-app-with-xcode-4)
* [Localization Suite Website](http://www.loc-suite.org)
* [Internationalize Your App on Apple.com](http://developer.apple.com/library/ios/#referencelibrary/GettingStarted/RoadMapiOS/chapters/InternationalizeYourApp/InternationalizeYourApp/InternationalizeYourApp.html) (based on iOS, but it's almost the same for OSX)
* [Edit User Interface at Apple.com](http://developer.apple.com/library/mac/#documentation/ToolsLanguages/Conceptual/Xcode_User_Guide/030-Edit_User_Interfaces/edit_user_interface.html)
* [Apple Human Interface Guidelines](https://developer.apple.com/library/mac/#documentation/UserExperience/Conceptual/AppleHIGuidelines/Intro/Intro.html)
* [Using Pull-Request by GitHub.com](https://help.github.com/articles/using-pull-requests)




