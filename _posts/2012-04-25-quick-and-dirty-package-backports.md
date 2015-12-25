---
title: Quick and Dirty Package Backports
author: marc
layout: post
permalink: /blog/2012/quick-and-dirty-package-backports
dsq_thread_id:
  - 1239810624
categories:
  - linux
tags:
  - linux
  - ubuntu
---
Need a newer version of a Debian/Ubuntu/Mint package than what is available in the repositories for your distribution? It always happens that production machines are stuck on old versions but you need some great new feature only available in newer distributions packages. Frustration level high, but there is good news because you can backport the package. 

If you are lucky then an official backport will already be available at http://packages.ubuntu.com/distro-backports or http://backports.debian.org. If not then its time to start hunting through https://launchpad.net/ubuntu/+ppas. The quality of PPAs varies greatly, so use some judgement before installing software from unknown sources. If your still rolling snake eyes, then you can search for a newer version on http://packages.ubuntu.org/packagename or http://packages.debian.org/packagename. If you still haven&#8217;t found a newer version then you&#8217;ll need to update the package, which is a whole other beast and not covered here, sorry.

After you have found a source package, you are ready to rebuild it for your distribution. You could setup a PPA, use prevu or some other method but you&#8217;re looking for a quick fix and don&#8217;t want to deal with getting them configured. For this method all you need is a machine running the target distribution, preferably not the production machine. A freshly minted VM would be perfect.

Once you have your machine you will need to install the build tools

`sudo apt-get install build-essential devscripts`

You will also need to grab the source package files which consist of package.dsc, package-orig.tar.gz, package-diff.tar.gz and perhaps a patches.tar.gz. Now you can run the following commands to extract and build the backport

`dpkg-source -x package.dsc<br />
    cd package-version<br />
    dch -l mybp1 -D lucid "backport 1 of package for lucid"<br />
    dpkg-buildpackage -uc -b`

The dch command will update the Debian changelog and thus the built deb will have mybp1 contained in its version identification. Once the package is built you can copy it to your machine and install it. If the new package needs updated dependencies you will need to repeat the above steps for each of them.