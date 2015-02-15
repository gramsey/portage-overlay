# WombleGoneBad's gentoo portage overlay

## ibus-libpinyin
### Description
This adds the "Intelligent Pinyin" input method to ibus. 
This is *not* simply a re-hash of ibus-pinyin, this is a different upstream source.
The main technical difference is that it uses 'libpinyin'. 
The main practical difference is that in my opinion it is vastly superior from and end user experience point of view. 
It is also arguably much better supported upstream, and other major distros are switching to it (away from ibus-pinyin).
e.g. if you put in 'nihao' you actually get the characters you would expect.
I use this myself as i find ibus-pinyin virtually unusable. 
### Progress
Currently i have a working ebuild tested on x86_64, i use this myself on a regular basis, so i know it works. 
However it is still very green, and its possible i may have missed a dependancy or something, so don't be surprised if you have an issue. 
Currently it requires python 2.7, but in future i plan to add the python3 patches so it will also directly support the current python 3


## youtube-viewer
### Description
This is a way to search and view you-tube videos using mplayer. This is lacking a permanent maintainer, so I plan to create my own 
maintained version of this ebuild, and add it here.
#### Progress
Not ready - DO NOT USE!
