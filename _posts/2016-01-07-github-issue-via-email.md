---
title: Submit Issues to GitHub Projects via Email 
author: marc
layout: post
categories:
  - development
---
Transcribing communications from users into issues probably isn’t in anyone’s top ten favourite things to do.
While the messages mean someone cares enough about your project to take the time to let you know about a problem they are having, it can be time consuming to convert them into [GitHub](https://github.com) issues.

[ghinbox](https://github.com/sibson/ghinbox) tries to make your life a little easier by allowing you to create new issues against any of your GitHub repositories simply by sending an email.
As many tools send notifications from email you can simply forward them to ghinbox and it will take care of the rest.
You could even configure your other systems to send notification emails directly to ghinbox
That includes your users, by setting up a custom email address and providing it to them, they’ll be able to create issues by sending an email too.
They can event create issues against private repositories, because ghinbox holds the credentials not the users.
Best of all you can quickly and easily deploy a low volume instance of ghinbox on [Heroku](https://heroku.com) for free.

ghinbox is Open Source under the [MIT License](https://opensource.org/licenses/MIT) and is available on [GitHub](https://github.com/sibson/ghinbox). 
Hopefully, it’s useful and if you want to take it for a no risk test drive checkout the [sample repository](https://github.com/sibson/ghinbox-sample).
