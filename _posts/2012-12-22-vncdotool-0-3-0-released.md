---
title: vncdotool 0.3.0 released
author: marc
layout: post
permalink: /blog/2012/vncdotool-0-3-0-released
dsq_thread_id:
  - 1235121527
categories:
  - vncdotool
---
[vncdotool][1] is a command line VNC client. It an easy way automate interactions with virtual machines, KVMs, GUIs or other hardware devices. This release contains a couple new features and various compatibility and bug fixes.

The major feature is the ability to record and playback captured VNC sessions. This differs from other VNC recorders as it records a users&#8217; actions allowing them to be replayed against other servers, other tools create a movie for playback. To capture a session, start vncdotool in one of three record modes, connect to it using a standard VNC GUI client, do some work on the remote computer and then disconnect. Then use vncdo to repeat your session against any VNC server. Along, with this change the command line was changed in a backwards incompatible way, namely -d has been replaced by -s host:display|host::port and vncdotool should be called as vncdo.

Overall compatibility with VNC servers has improved thanks to bug reports and debugging from Jerry Kwan, Matias Suarez and Anthony DeRosa.

Full changes can be seen at https://github.com/sibson/vncdotool/blob/0.3.0/HISTORY.txt

Documentation for all features can be found at [pypi][1].  
Bugs can be filed at [Github][2].  
Debian packages are available at [Launchpad PPA][3]

 [1]: http://pypi.python.org/pypi/vncdotool
 [2]: https://github.com/sibson/vncdotool
 [3]: https://launchpad.net/~sibson/+archive/vncdotool