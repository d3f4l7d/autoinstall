## Introduction
This repository will give you "lazy" way to install some fundamental programs for my Arch Linux basic usage. Those codes below will automatically install some softwares by just executing codes. These code will automatically install these programs below:

| #  | softwares in `helloworld.sh` |
| -- | ---------------------------- |
| 01 | zsh |
| 02 | nvim (NvChad) |
| 03 | python |
| 04 | haskell |
| 05 | arduino-cli |
| 06 | cdparanoia |
| 07 | android-tools |
| 08 | ddgr |

| #  | softwares in `finallyyoushouldusegui.sh`|
| -- | --------------------------------------- |
| 01 | xfce4 |
| 02 | gvfs |
| 03 | bluetooth |
| 04 | ibus |
| 05 | libreoffice |
| 06 | inkscape |
| 07 | EB-Garamond |
| 08 | freecad |
| 09 | kicad |

> [!WARNING]
> password will be needed for some steps in finallyyoushouldusegui.sh (around LO step). So, type it when that happens. 

## Code Usage
Just execute like below. Replace my username d3f4l7d or d3f4l7 to your username.
```
chmod +x <your preferred one>.sh
```
And then...
For CLI lovers,
```
./helloworld.sh 2>&1 | tee helloworld_stdouterr.txt
```
For ML lovers,
```
./nvidiainstall.sh 2>&1 | tee nvidiainstall_stdouterr.txt
```
For GUI users,
```
./finallyyoushouldusegui.sh 2>&1 | tee finallyyoushouldusegui_stdouterr.txt
```
Enjoy it 👽

<!--
## Jekyll man
To generate a completely new website, execute like the below.
```
jekyll new ~/.config/<yoursitename>
```
cd to the website dir.
```
cd ~/.config/<yoursitename>
```
Then, activate it as a localhost server.
```
bundle exec jekyll serve
```
To access your server, click the below in the console log.
```
Click or access http://localhost:4000
```
Deploy your website with your preffered service (I love Github pages BTW).
-->
## License
MIT License - see [LICENSE](/LICENSE) for more details.
