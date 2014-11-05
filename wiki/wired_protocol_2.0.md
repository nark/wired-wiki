# Wired Protocol 2.0

## Current Status

This memo provides information for the Internet community. It describes an Internet protocol. Distribution of this memo is unlimited.
   
## Informations

* **Read-Write.fr**	
* **Version:** 1
* **Last release date:** April 2014
* **Author:** Rafaël Warnault

## Copyright Notice

* Copyright (C) Rafaël Warnault 2012-2014. All Rights Reserved.
   
## Introduction

### Generalities

The Wired protocol is an application-level protocol for real time chat, messaging and file transfers. It is based on the client-server model (TCP), with many clients connected to one and the same server, allowing both public and private messaging. It aims to unify messaging and file transfer features in a single standard. 

### Brief history

The Wired Protocol 1.0 was created by Axel Andersson in 2004 and was released as several RFCs. These documents are not more available because of the recent renew of the zankasoftware.com domain. I have a copy, so I will put them online later, for reference. 

Wired was designed as a Bulletin Board System (1), taking over from discontinued software of the same kind (Hotline, Carracho, KDX). Also, from the RFC 1.x :

> The Wired protocol is an application-level protocol for file transfers and user interaction. It is intended to fill a gap among Internet class protocols that either provide transfer services or chat services, usually mutually exclusively. Wired joins these two types together to provide a complete user experience. — **Axel Andersson, Wired Protocol 1.1**

The Wired Protocol was implemented in a software suite, also developed and maintained by Axel Andersson. The Wired library (libwired) is a complete implementation of the Wired Protocol 1.x specification, and a set of tools and other data structures, and portable abstractions for many OS services, like threads, sockets, files, etc. libwired is written in ANSI-C as a portable UNIX library, based on the well-know autotools build system. ... All the original code is licensed under BSD license.

Unfortunately, Axel Andersson stopped the development of the Wired project around 2011. Few years earlier, he started to develop a new version of the Wired protocol, identified as "2.0". The protocol 1.x was text-based, and the specification was not enough scalable to easily handle new features, while efficiently maintaining the backward-compatibility. The 2.0 version of the protocol fixed this main issue and added new lovely features like "Boards". Axel led the project to a very promising beta state, but has not concluded.

Fortunately, sources remained available on the net. Taking the lead of the project was not easy, as explained in this [article](http://www.read-write.fr/blog/blog/2011/12/01/wired-disaster/). But today Wired 2.0 rocks again, and I am working on the 2.1 version of the protocol. It is time to write a better documentation about it. 

### About

This document aims to explain and to document how the Wired Protocol 2.0 is defined and implemented. This document is the result of a personal research work in the context of continuing an existing open-source project. 

## Wired 2.0

### A message protocol

Like many network protocols, the Wired protocol uses an organized set of **messages** to make several computers communicating together. The communication logic is defined by **transactions** that expose what messages and how these messages have to be used by the implementation. Messages are composed of **fields** which represent data items and their types. The protocol also provides **boardcasts**, that are messages sent to every connected users without distinction.

### A XML-based protocol

The Wired Protocl 2.0 is XML-based. Every data types and structures, fields, messages and transactions are defined in a bunch of XML files. This allows a very granulated control of the communication and a very precise management of scalability in a backward-compatible way. 

#### XML-Schema based

The Wired Protocol 2.0 specification is based on XML Shema (2). Every XML data structures are defined in a XSD file:

	<?xml version="1.0" encoding="UTF-8"?>
		<xs:schema xmlns:p7="http://www.zankasoftware.com/P7/Specification"
			   xmlns:xs="http://www.w3.org/2001/XMLSchema"
			   targetNamespace="http://www.zankasoftware.com/P7/Specification"
			   elementFormDefault="qualified"
			   attributeFormDefault="unqualified">
		<xs:element name="documentation" type="p7:documentation" />
		<xs:element name="type" type="p7:type" />
		<xs:element name="field" type="p7:field" />
		<xs:element name="enum" type="p7:enum" />
		<xs:element name="collection" type="p7:collection" />
		<xs:element name="member" type="p7:member" />
		<xs:element name="message" type="p7:message" />
		<xs:element name="parameter" type="p7:parameter" />
		<xs:element name="transaction" type="p7:transaction" />
		<xs:element name="reply" type="p7:reply" />
		<xs:element name="or" type="p7:or" />
		<xs:element name="and" type="p7:and" />
		<xs:element name="broadcast" type="p7:broadcast" />
	
		<xs:simpleType name="use">
			<xs:restriction base="xs:string">
				<xs:enumeration value="optional" />
				<xs:enumeration value="required" />
			</xs:restriction>
		</xs:simpleType>
	
		[...]
		
	</xs:schema>

Have a look to this [link](http://wired.read-write.fr/html/p7-specification.xsd) for the entire XSD file.

The XSD file is used by the "Wired" specification XML file in order to define data types, fields, messages and transactions needed by the protocol. Have a look to the header of the `wired.xml` file:

	<?xml version="1.0" encoding="UTF-8"?>
	<p7:protocol xmlns:p7="http://www.read-write.fr/wired/html/wired.html"
			 	 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
			 	 xsi:schemaLocation="http://www.read-write.fr/wired/html/p7-specification.xsd"
			 	 name="Wired"
			 	 version="2.0b55">

The first element says that the file is an UTF-8 encoded XML (1.0) file. Easy. The second element define the Wired protocol by linking the `p7-specification.xsd` schema. It also defines some protocol attributes like its name and its version.

#### A quick tour of the XML specification

The Wired 2.0 specification defines a set of objects and behaviors that will be used to standardize the implementation. Every available elements used by the specification are declared as `xs:element` or `xs:*Type` in the XSD file (type, field, enum, message, broadcast, etc.). 

##### The *field* element

The field element represents a data item of a message. Each field has an unique name and an unique id. As well as a type and a version:

	<p7:field name="wired.user.nick" type="string" id="3002" version="2.0">Nark</p7:field>
	
List of available field types:

	<xs:enumeration value="bool" />
	<xs:enumeration value="enum" />
	<xs:enumeration value="int32" />
	<xs:enumeration value="uint32" />
	<xs:enumeration value="int64" />
	<xs:enumeration value="uint64" />
	<xs:enumeration value="double" />
	<xs:enumeration value="string" />
	<xs:enumeration value="uuid" />
	<xs:enumeration value="date" />
	<xs:enumeration value="data" />
	<xs:enumeration value="oobdata" />
	<xs:enumeration value="list" />
	
So, the field element is the tiniest data element used by the Wired 2.0 specification. Messages are composed by a set of fields that mimic a key/value dictionary, where the `name` of the field is used as a key to retrieve the value of the XML node. The `type` attribute defines the data type of the value, this to facilitate the standardisation of standard data type equivalencies into the implementation. 
	
##### The *message* element

The message element is composed of one or more field parameters. A message is identified with an unique name and an unique id. Here the definition of the login message:

	<p7:message name="wired.send_login" id="2004" version="2.0">
		<p7:documentation>
			Login message.
		</p7:documentation>
		<p7:parameter field="wired.transaction" version="2.0" />
		<p7:parameter field="wired.user.login" use="required" version="2.0" />
		<p7:parameter field="wired.user.password" use="required" version="2.0" />
	</p7:message>

##### The *transaction* element

A transaction is a conditionnal structure which defines the order and the logic of replies in transactions between server and clients. There are used by the implementation to organize the control of messages and the handling of replies.

A transaction is identified by the name of a `message` of the specification. It takes an `originator` parameter that defines which entity, from the client or the server, should be the initiator of the message.

	<p7:transaction message="wired.user.get_users" originator="client" use="optional" version="2.0">
	    <p7:or>
	        <p7:and>
	            <p7:reply message="wired.user.user_list" count="+" use="required" />
	            <p7:reply message="wired.user.user_list.done" count="1" use="required" />
	        </p7:and>
	        <p7:reply message="wired.error" count="1" use="required" />
	    </p7:or>
	</p7:transaction>

This transaction is used when a `client` will request the user list on the server, using the `wired.user.get_users` message. 

Expected replies are `wired.user.user_list` **and** `wired.user.user_list.done` messages in case of success, **or** a `wired.error` message in case of success.

##### The *broadcast* element

TBD

As it is only XML and that the terminology of the specification in this format is already well organized, this document will not detail this aspect further. You are prompted to visit the [Wired 2.0 Specification website](http://wired.read-write.fr/html/wired.html) for more informations.

### Networking

#### Serialization

The Wired 2.0 protocol is XML-based, but not only. It currently supports two data serialization modes to transmit data over the network.

* **XML**: XML data encoded as UTF-8 is the default format (Wired Server does not accept this kind of format by default, see `etc/wired.conf` in the wired package). Currently this format do not allows compression and encrytion of communications, but has the benefit of being very simple: just send and receive pieces of XML.
* **Binary**: The binary serialization process is a little more complicated, but it offers a widely portable and very efficient way to format data (taking care of endianness (3)). Data are directly written using a buffer at the byte level. A message is represented as an organized sequence of bytes. 

The binary serialization process relies on the XSD file described above, in order to properly handle the type and the length of data. Below a list of the specification data types with corresponding length:
	
	| TYPE		| LENGTH |
	----------------------
	| bool		|	1 	 |
	| enum		|	4 	 |
	| int32 	|	4 	 |
	| uint32 	|	4 	 |
	| int64 	|	4 	 |
	| uint64 	|	4 	 |
	| double	| 	4 	 |
	| string	| 	* 	 |
	| uuid 		| 	16 	 |
	| date		| 	8 	 |
	| data		| 	* 	 |
	| oobdata	| 	8 	 |
	
	* type with undefined length

The binary data representation below is a capture of the first message received by the client when initiating a connection:

	00 00 00 02 	...2	# message with id 2
	00 00 00 01 	...1	# field with id 1
	00 00 00 04 	...4	# length of field 1
	31 2E 30 00 	1.0.	# data of field 1
	00 00 00 02 	...2	# field with id 2 
	00 00 00 06 	...6	# length of field 2
	57 69 72 65 	Wire	# data of field 2
	64  			d...	#
	00 00 00 03  	...3	# field with id 3
	00 00 00 07 	...7	# length of field 3
	32 2E 30 62 	2.0b	# data of field 3
	35 35 		 	55..    #
	00 00 00 04 	...4 	# etc.
	
The corresponding message in XML format looks like:

	<p7:message name="p7.handshake.server_handshake" id="2">
        <p7:parameter field="p7.handshake.version" use="required">1.0</p7:parameter>
        <p7:parameter field="p7.handshake.protocol.name" use="required">Wired</p7:parameter>
        <p7:parameter field="p7.handshake.protocol.version" use="required">2.0b55</p7:parameter>
        
        [...]
        
    </p7:message>
	
The XML-based nature of the specification makes complete sense here, because it offers the ability to efficiently create, validate and format large sets of complex data. Working at the data level makes it also easier to use compression and encryption.

Also having a look to the following source files can help to understand how data types are packed to raw hexadecimal data, and how these packed data are unpacked in standard types by the implementation:

* **In C (libwired)**: [https://github.com/nark/libwired/blob/master/libwired/p7/wi-p7-message.c#L233](https://github.com/nark/libwired/blob/master/libwired/p7/wi-p7-message.c#L233)
* **In Ruby (wired-ruby)**: [https://github.com/nark/wired-ruby/blob/master/lib/wired/message.rb#L41](https://github.com/nark/wired-ruby/blob/master/lib/wired/message.rb#L41)


#### Compression

TBD

#### Encryption

The Wired 2.0 protocol provides encryption over the network when binary serialization mode is enabled. The protocol relies on SSL/TLS features to encrypt data, but it uses its own hybrid cryptography model, which directly relies on user credentials. 

1. The client sends handshake informations: versions, supported ciphers, compression, etc.
2. The server replies its own handshake informations: versions, supported ciphers, compression, etc.
3. The client acknowledge the reception of server handshake
3. The server sends a copy of its asymmetric public key to the client
4. The client creates a random symmetric session key and an initialization vector (IV), along with user login and password, and sends them encrypted using the server public key.
5. The server decrypt the symmetric session key using its asymmetic private key

So, the Wired 2.0 protocol connection sequence is very similar to SSH, except that instead of using an asymmetric key on the client side, it uses the login and password credentials of the user.

To understand this in detail, we have to look at the Wired 2.0 supported ciphers :

* p7.handshake.encryption.rsa_aes128_sha1
* p7.handshake.encryption.rsa_aes192_sha1
* p7.handshake.encryption.rsa_aes256_sha1
* p7.handshake.encryption.rsa_bf128_sha1
* p7.handshake.encryption.rsa_3des192_sha1

**NB : This values are exposed later in the Connection section**




The client and server will exchange their public keys and keep their private keys secret. Thus, the client will encrypt its message with it's  that only the server can 

the server will be alble to decrypt client messages and the client to decrypt the server messages.

#### Checksum

The data checksum ensure the integrity of data received from the network. 

### Connection



#### Handshake

To secure 

	<?xml version="1.0" encoding="UTF-8"?>
	<p7:protocol xmlns:p7="http://www.zankasoftware.com/P7/Specification"
				 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
				 xsi:schemaLocation="http://www.zankasoftware.com/P7/Specification p7-specification.xsd"
				 name="P7" version="1.0">
		<p7:types>
			<p7:type name="bool" id="1" size="1" />
			<p7:type name="enum" id="2" size="4" />
			<p7:type name="int32" id="3" size="4" />
			<p7:type name="uint32" id="4" size="4" />
			<p7:type name="int64" id="5" size="8" />
			<p7:type name="uint64" id="6" size="8" />
			<p7:type name="double" id="7" size="8" />
			<p7:type name="string" id="8" />
			<p7:type name="uuid" id="9" size="16" />
			<p7:type name="date" id="10" size="8" />
			<p7:type name="data" id="11" />
			<p7:type name="oobdata" id="12" size="8" />
			<p7:type name="list" id="13" />
		</p7:types>

		<p7:fields>
			<p7:field name="p7.handshake.version" type="string" id="1" />
			<p7:field name="p7.handshake.protocol.name" type="string" id="2" />
			<p7:field name="p7.handshake.protocol.version" type="string" id="3" />
			<p7:field name="p7.handshake.compression" type="enum" id="4">
				<p7:enum name="p7.handshake.compression.deflate" value="0" />
			</p7:field>
			<p7:field name="p7.handshake.encryption" type="enum" id="5">
				<p7:enum name="p7.handshake.encryption.rsa_aes128_sha1" value="0" />
				<p7:enum name="p7.handshake.encryption.rsa_aes192_sha1" value="1" />
				<p7:enum name="p7.handshake.encryption.rsa_aes256_sha1" value="2" />
				<p7:enum name="p7.handshake.encryption.rsa_bf128_sha1" value="3" />
				<p7:enum name="p7.handshake.encryption.rsa_3des192_sha1" value="4" />
			</p7:field>
			<p7:field name="p7.handshake.checksum" type="enum" id="6">
				<p7:enum name="p7.handshake.checksum.sha1" value="0" />
			</p7:field>
			<p7:field name="p7.handshake.compatibility_check" type="bool" id="7" />

			<p7:field name="p7.encryption.public_key" id="9" type="data" />
			<p7:field name="p7.encryption.cipher.key" id="10" type="data" />
			<p7:field name="p7.encryption.cipher.iv" id="11" type="data" />
			<p7:field name="p7.encryption.username" id="12" type="data" />
			<p7:field name="p7.encryption.client_password" id="13" type="data" />
			<p7:field name="p7.encryption.server_password" id="14" type="data" />

			<p7:field name="p7.compatibility_check.specification" id="15" type="string" />
			<p7:field name="p7.compatibility_check.status" id="16" type="bool" />
		</p7:fields>

		<p7:messages>
			<p7:message name="p7.handshake.client_handshake" id="1">
				<p7:parameter field="p7.handshake.version" use="required" />
				<p7:parameter field="p7.handshake.protocol.name" use="required" />
				<p7:parameter field="p7.handshake.protocol.version" use="required" />
				<p7:parameter field="p7.handshake.encryption" />
				<p7:parameter field="p7.handshake.compression" />
				<p7:parameter field="p7.handshake.checksum" />
			</p7:message>

			<p7:message name="p7.handshake.server_handshake" id="2">
				<p7:parameter field="p7.handshake.version" use="required" />
				<p7:parameter field="p7.handshake.protocol.name" use="required" />
				<p7:parameter field="p7.handshake.protocol.version" use="required" />
				<p7:parameter field="p7.handshake.encryption" />
				<p7:parameter field="p7.handshake.compression" />
				<p7:parameter field="p7.handshake.checksum" />
				<p7:parameter field="p7.handshake.compatibility_check" />
			</p7:message>

			<p7:message name="p7.handshake.acknowledge" id="3">
				<p7:parameter field="p7.handshake.compatibility_check" />
			</p7:message>

			<p7:message name="p7.encryption.server_key" id="4">
				<p7:parameter field="p7.encryption.public_key" use="required" />
			</p7:message>

			<p7:message name="p7.encryption.client_key" id="5">
				<p7:parameter field="p7.encryption.cipher.key" use="required" />
				<p7:parameter field="p7.encryption.cipher.iv" />
				<p7:parameter field="p7.encryption.username" use="required" />
				<p7:parameter field="p7.encryption.client_password" use="required" />
			</p7:message>

			<p7:message name="p7.encryption.acknowledge" id="6">
				<p7:parameter field="p7.encryption.server_password" use="required" />
			</p7:message>

			<p7:message name="p7.encryption.authentication_error" id="7" />

			<p7:message name="p7.compatibility_check.specification" id="8">
				<p7:parameter field="p7.compatibility_check.specification" use="required" />
			</p7:message>
			"
			<p7:message name="p7.compatibility_check.status" id="9">
				<p7:parameter field="p7.compatibility_check.status" use="required" />
			</p7:message>
		</p7:messages>

		<p7:transactions>
			<p7:transaction message="p7.handshake.client_handshake" originator="client" use="required">
				<p7:reply message="p7.handshake.server_handshake" count="1" use="required" />
			</p7:transaction>

			<p7:transaction message="p7.handshake.server_handshake" originator="server" use="required">
				<p7:reply message="p7.handshake.acknowledge" count="1" use="required" />
			</p7:transaction>

			<p7:transaction message="p7.encryption.server_key" originator="server" use="required">
				<p7:reply message="p7.encryption.client_key" count="1" use="required" />
			</p7:transaction>

			<p7:transaction message="p7.encryption.client_key" originator="client" use="required">
				<p7:or>
					<p7:reply message="p7.encryption.acknowledge" count="1" use="required" />
					<p7:reply message="p7.encryption.authentication_error" count="1" use="required" />
				</p7:or>
			</p7:transaction>

			<p7:transaction message="p7.compatibility_check.specification" originator="both" use="required">
				<p7:reply message="p7.compatibility_check.status" count="1" use="required" />
			</p7:transaction>
		</p7:transactions>
	</p7:protocol>
		

## References

1. Bulettin Board Systems
2. [W3C : XML Schema Part 1](http://www.w3.org/TR/xmlschema-1/)
3. http://www.yolinux.com/TUTORIALS/Endian-Byte-Order.html