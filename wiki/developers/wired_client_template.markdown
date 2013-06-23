# Make templates for Wired Client

## About Templates

### Webkit-Based

Wired Client uses the [WebKit](http://www.webkit.org) framework provided by Apple to render several views of the interface like Chats, Boards and Messages. This allows a very hight level of user interface customization, and in order to make it easy to enhance, Wired Client provides a templates system.

### Templates are Bundles

Wired Client templates are based on the [Apple bundles Architecture](http://developer.apple.com/library/mac/#documentation/CoreFoundation/Conceptual/CFBundles/AboutBundles/AboutBundles.html). Each template is a bundle file with a **.WiredTemplate** file extention which mainly contains HTML, CSS and graphical resources. 

### Where are Templates

Wired Client stores templates at two different locations. The first one is related to private templates that Wired Client embedded out-of-the-box. You can found them into the "Wired Client.app" bundle at the following path:

	Wired Client.app/Contents/Resources/Templates/
	
Natively, Wired Client currently provides three templates:

- Basic.WiredTemplate
- Hacker.WiredTemplate
- Neo.WiredTemplate

Wired Client also offers support for public templates, that are installed at the following location:

	~/Library/Application Support/Wired Client/Templates/
	
You have to manage (install/uninstall) public templates from the "Preferences" window of Wired Client to make them running properly. Select "Themes" into the toolbar, then select a theme of your choice into the sidebar on the left. In the right view, click on the "Templates" popup menu then chose "Manage Templates…".

![Dev Wired Client Manage Templates](img/dev_wired_client_manage_templates.png)

## Getting Started

The best way to make a new Wired Template is probably to duplicate an already existing one and to modify it afterwards. The following will explains the several points to observe in order to make a new Wired Client template based on a duplicate.

### Architecture of a Template

Here I take the example of a "Basic" template. Assume that **every of these files are required:**

	Basic.WiredTemplate/
					Contents/
						Info.plist
						Resources/
							en.lproj/
								InfoPlist.strings
							htdocs/
								BoardPost.html
								BoardReply.html
								Boards.html
								Chat.html
								ChatEvent.html
								ChatMessage.html
								css/
									boards.css
									chat.css
									default_boards.css
									default_chat.css
									default_messages.css
									messages.css
								img/
								Message.html
								Messages.html
								MessageStatus.html
							
- **Info.plist:** This file contains required information to power the bundle. When you duplicate a bundle **you must modify the CFBundleIdentifier**, and it is the only field you usually have to modify in this file.
	 
	<pre>&lt;?xml version="1.0" encoding="UTF-8"?&gt;
	&lt;!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd"&gt;
	&lt;plist version="1.0"&gt;
	&lt;dict&gt;
		&lt;key&gt;BuildMachineOSBuild&lt;/key&gt;
		&lt;string&gt;12B19&lt;/string&gt;
		&lt;key&gt;CFBundleDevelopmentRegion&lt;/key&gt;
		&lt;string&gt;English&lt;/string&gt;
		&lt;key&gt;CFBundleIdentifier&lt;/key&gt;
		&lt;string&gt;fr.read-write.Basic&lt;/string&gt;
		&lt;key&gt;CFBundleInfoDictionaryVersion&lt;/key&gt;
		&lt;string&gt;6.0&lt;/string&gt;
		&lt;key&gt;CFBundleName&lt;/key&gt;
		&lt;string&gt;Basic&lt;/string&gt;
		&lt;key&gt;CFBundlePackageType&lt;/key&gt;
		&lt;string&gt;BNDL&lt;/string&gt;
		&lt;key&gt;CFBundleShortVersionString&lt;/key&gt;
		&lt;string&gt;1.0&lt;/string&gt;
		&lt;key&gt;CFBundleSignature&lt;/key&gt;
		&lt;string&gt;????&lt;/string&gt;
		&lt;key&gt;CFBundleVersion&lt;/key&gt;
		&lt;string&gt;1&lt;/string&gt;
		&lt;key&gt;DTCompiler&lt;/key&gt;
		&lt;string&gt;com.apple.compilers.llvm.clang.1_0&lt;/string&gt;
		&lt;key&gt;DTPlatformBuild&lt;/key&gt;
		&lt;string&gt;4G144l&lt;/string&gt;
		&lt;key&gt;DTPlatformVersion&lt;/key&gt;
		&lt;string&gt;GM&lt;/string&gt;
		&lt;key&gt;DTSDKBuild&lt;/key&gt;
		&lt;string&gt;11E52&lt;/string&gt;
		&lt;key&gt;DTSDKName&lt;/key&gt;
		&lt;string&gt;macosx10.7&lt;/string&gt;
		&lt;key&gt;DTXcode&lt;/key&gt;
		&lt;string&gt;0450&lt;/string&gt;
		&lt;key&gt;DTXcodeBuild&lt;/key&gt;
		&lt;string&gt;4G144l&lt;/string&gt;
		&lt;key&gt;NSHumanReadableCopyright&lt;/key&gt;
		&lt;string&gt;Copyright © 2012 Read-Write.fr. All rights reserved.&lt;/string&gt;
	&lt;/dict&gt;
	&lt;/plist&gt;</pre>
 
- **htdocs:** This directory is the root for WebKit to display a web-based view. It contains every HTML, CSS and graphical resources the template needs.


### How it works ?

Templates defines the style of the view. Each theme uses a template to render the view using theme's custom parameters (fonts, colors, etc.) into a Cocoa [WebView](http://developer.apple.com/library/mac/#documentation/Cocoa/Reference/WebKit/Classes/WebView_Class/Reference/Reference.html) object. 

### HTML Resources

HTML files are the most sensitive because they define the structure of the view. And 


#### Chat HTML Files

- Chat.html
- ChatEvent.html
- ChatMessage.html

#### Messages HTML Files

- Message.html
- Messages.html
- MessageStatus.html

#### Boards HTML Files

- BoardPost.html
- BoardReply.html
- Boards.html


### CSS Resources

### Other Resources

You can 


## Templates Limitations

Unfortunately, Javascript is not currently allowed in templates for security concerns. Fortunately, WebKit brilliantly supports HTML5 and CSS3 specifications which already offer a very large set of advanced tools.

Nothing is done regarding teamplates backward/forward compatibility accross future versions of Wired Client. Be reassured, it is planned to found a way to manage this properly, and the current "API" is not supposed to change dramatically in the near future.

