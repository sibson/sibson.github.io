---
title: 'HOWTO: Juniper Networks VPN 64bit 12.04 LTS with Host Checker'
author: marc
layout: post
permalink: /blog/2012/howto-juniper-networks-vpn-64bit-12-04-lts-with-host-checker
dsq_thread_id:
  - 1234652134
categories:
  - linux
tags:
  - linux
  - ubuntu
  - vpn
---
The Juniper VPN only officially supports Redhat and can be difficult to get working on Ubuntu. There are a number of great articles that cover how to work around it. Unfortunatly, none of them address using the Host Checker. This post will outline a setup that works with the Host checker while also reducing the time spent logging in and creating a VPN connection.

## Got Java?

First off, you&#8217;ll need Java. You&#8217;ll either need to use OpenJDK xor Sun Java, depending on which version of Ubuntu you are running. With either method you can point Firefox to [Java Plugin Test][1] to verify Java is working.

### 12.04 LTS Precise 

With Precise and newer Juniper VPN the OpenJDK and icedtea works fine

    sudo apt-get install icedtea6-plugin default-jdk

### Older Versions

For other older versions Ubuntu or Juniper VPN you will need the sun-java packages, don&#8217;t install both OpenJDK and Sun Java. Due to licensing changes Sun Java is longer available in the Ubuntu repositories, so you will need to add them from elsewhere.

    sudo add-apt-repository ppa:sun-java-community-team/sun-java6

Then edit /etc/apt/sources.list.d/sun-java-community-team-sun-java6-oneiric.list to point at maverick rather than your actual distribution. This allows you to pickup the older packages that are still available and works for oneric and hopefully natty. Now you can install with

    sudo apt-get update
    sudo apt-get install sun-java6-jre sun-java6-plugin sun-java6-fonts sun-java6-jdk

## Host Checker

You should now be able to go to https://yourvpn.example.com and log in. If you get a you are not authorized error then you need to setup Host Checker. Depending on you IT department they may want root access to your machine in order to create some files that Host Checker will use to verify your system. Unless you can shout them down you&#8217;ll have to let them take the machine away and do their black magic. Once they return your machine and you can successfully login you can unravel their secrets by grok the ~/.juniper\_network/dsHostChecker\_linux.log file to figure out which files they created.  
In future you can just copy these files onto a new machine rather than having to contact support again. Be sure to make a backup of them and their locations.

## VPN Tool

After logging in you should have a start Network Connect button, click it and it will create a xterm asking for either the root or sudo password, just close the window, as it has already downloaded the jar files you need. For the next step you will need some build tools. You can install them with

    sudo apt-get install python-dev build-essential gcc-multilib lib32z-dev

Then you will extract files from ncLinuxAll.jar which should be in ~/.juniper\_networks/network\_connect/. Some versions leave it in ~/.juniper\_networks so you may need to create the network\_connect directory and copy the jar file into it.

    cd ~/.juniper_networks/network_connect
    jar xf ~/.juniper_networks/ncLinuxApp.jar

Next up, create an executable you can run from the command line, it also means you don&#8217;t have an extra window hanging around your desktop.

    gcc -m32 -Wl,-rpath,`pwd` -o ncui libncui.so

Now fix the ownership and permissions on various files, so they can mess with resolv.conf. If they can&#8217;t access /etc/resolv.conf they don&#8217;t work, so if it doesn&#8217;t exist you will need to create it.

    sudo chown root:root ncsvc ncui
    sudo chmod 06711 ncsvc
    sudo chmod 4775 ncui
    sudo touch /etc/resolv.conf

Finally, get your VPN systems&#8217; SSL certificate  

    echo | openssl s_client -connect router.evertz.com:443 2>&1 | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' | openssl x509 -outform der > ssl.crt

At this point you have everything you need to connect to the VPN but we&#8217;re going to add a little extra gravy to make it easier to use. 

## Usability Tweaks

Create a new Toolbar bookmark in Firefox and set the location to `javascript:alert(document.cookie)`. I usually name it DSID but don&#8217;t let that limit your imagination. You can also assign a keyword to allow launch from the location bar. Now add the following snippet to your .bashrc and source it or launch a new terminal.

    vpn()
    {
        HOST=router.evertz.com
        CERT=~/.juniper_networks/network_connect/ssl.crt
        DSID=$1
        ~/.juniper_networks/network_connect/ncui -h $HOST -f $CERT -p "" -c DSID=$DSID
    }

With all that in place to create a VPN connection you

  1. Log in to http://yourvpn.example.com
  2. Click the DSID bookmark
  3. Copy the number following DSID=
  4. Run &#8220;vpn DSID&#8221;, by pasting the DSID

## References

A huge thanks to Paul D. Smith for providing the initial setup instructions,[mad-scientist.net][2], and support on the Ubuntu Forums. Juniper is finally starting to support Ubuntu but without his work we would have been without hope. If you don&#8217;t have Host Checker, you should try using his script. It makes things even easier.

Scott at [makefile.com][3] deserves a lot of credit for teasing the ncui command out for the jar files shipped by Juniper.

Finally, Joseph Henrich already pulled together much of this information in a post at [ctctlabs][4]. Hopefully, I&#8217;ve just filled in a few blanks for Host Checker.

Now you can get back to work.

 [1]: http://java.com/en/download/testjava.jsp "Java plugin test"
 [2]: http://mad-scientist.net/juniper.html "mad-scientist.net"
 [3]: http://makefile.com/.plan/2009/10/juniper-vpn-64-bit-linux-an-unsolved-mystery/ "makefile.com"
 [4]: http://www.ctctlabs.com/index.php/blog/detail/juniper_networks_network_connect_securid_and_64_bit_linux/ "ctctlabs"
