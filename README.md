# kcomp
***
A Simple Script to Re-Enable the KWin OGL compositor!
***
## Why?
Many people use KDE/KWin, most of them running a system with `systemd` rather than `runit`
\
A bug exists when using a login mannager, a bug almost hard coded into the operation of `runit`
\
Upon shutdown `runit` starts the `/etc/runit/3` script, which begings shutdown,
\
The way inwhich `runit` closes the running services, creates said bug
***
# Line 15
> `/etc/runit/3`

> `sv force-stop /var/service/*` 

This exact line (Line 15) is responsible for said bug,
\
Inwhich all running services (currently active `runit` services can be found in `/var/service/`)
\
Are killed as soon as `/etc/runit/3` is run (Or Basic shutdown is excuted)
\
Thus killing a running login mannager,
\
If the current WM is KWin, KWin sees this as a crash, and, blames said crash on OpenGl 100% of the time
\
Disabling the compositor, rendering desktop effects (a very big part of KDE) completely broken
\
One can re-enable the compositor by hand, but this takes time, upon every boot up, one would have to open settings, re-enable the compositor, and then run `kwin_x11 --replace &`
\
This is quite annoying, upon every boot-up/crash re-enabling the compositor, but thankfully, we can make a simple script, to fix said issue!
***
# Repair
### ~ Runit
`runit` hasn't recived any *main-stream* updates since 2014,
\
Users can update from the stable release to the development release from the [github repo](https://github.com/madscientist42/runit)
\
But this seems like alot of work to fix a simple bug, that may still be present
\
And frankly, I make simple shell scripts, I'd rather not mess with the init service of my PC
\
So fixing `runit` doesn't seem like the correct way to do things here
***
# Repair
### ~ DIY Script
*If* I could figure *how* KWin (re-)enables the compositor, I could easily create a simple shell script that does this, upon each boot up, ***automaticly!***
\
And Thus my search begins!
***
### ~ [mail-archive.com](https://www.mail-archive.com/kde-bugs-dist@kde.org/msg385114.html)
I've found it!
\
A email retaining to a bug from `Thu, 12 Sep 2019`
![FOUND IT]()
