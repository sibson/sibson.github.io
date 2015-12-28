---
title: vncdotool 0.8.0 Released
author: marc
layout: post
permalink: /blog/2013/vncdotool-0-8-0-released
dsq_thread_id:
  - 1615873100
categories:
  - vncdotool
---
vncdotool 0.8.0 is a command line VNC client, this release brings one major new feature, a couple of smaller ones and an experimental one.

The major feature is regional capture and expect. These allow you to focus on the important parts of the screens. An on going issue has been that some VNC Servers do not properly handle capitalization, to help work around this vncdotool now supports a --force-caps option which should provide better compatibility with those servers. The other minor feature is a &#8211;timeout option to allow scripts to be aborted if they are running for too long. 

One of the most requested features has been to be able to use vncdotool as a library. This release include experimental support for a library API. You can now use vncdotool from within your python scripts without needing to learn Twisted or rewrite your application to use a Twisted reactor. You can find more information about the API and other features on [Read the Docs][1]

vncdotool 0.8.0 is available on [PyPi][2] and [GitHub][3]

Finally, thank you to everyone who helped this release happen, in particular Will Coleman and Anthony DeRosa for their ideas and assistance debugging issue.

 [1]: http://vncdotool.readthedocs.org/en/latest/ "Read the Docs"
 [2]: https://pypi.python.org/pypi/vncdotool/0.8.0 "PyPi"
 [3]: https://github.com/sibson/vncdotool/releases/tag/0.8.0 "GitHub"
