#ONScripter page
ONScripter(O-N-Scripter)is a program that interprets and executes scripts written for [NScripter](http://www.nscripter.com/) in its own way. You can use the exact same game data to play games on Windows, Android, iOS, etc.

Please report to [Bug Tracking System](http://onscripter.osdn.jp/cgi-bin/kagemai/guest.cgi?project=onscripter&action=top) for available platforms, bug reports, feature requests and patches at any time. Please uncheck the box in the middle of the options field before submitting your report. You may send your reports directly to the email address at the bottom of this page.
##Get
Android:[Google Play](https://play.google.com/store/apps/details?id=jp.ogapee.onscripter.release)
macOS:[Homebrew](https://github.com/Homebrew/homebrew-core/tree/master/Formula/onscripter.rb)
Others please clone this github repository and run ``make -f Makefile.xxx``.

ONScripter-EN is a variant of ONScripter extended by Uncle Mion san to better handle English scripts. It supports more NScripter commands and seems to handle conventional Japanese scripts without problems.
##Features
- You can load and save save files that are compatible with the latest NScripter (2011/12/15). Please see How to play on different platforms at the same time.
- All operations can be done from the keyboard. Of course, you can also use the mouse.
- You can change CD Audio playback to music file (MP3, Ogg) playback.
- It has been reported that ONScripter runs on Windows, Linux, MacOS X, MacOS 9, Android(1.6 or later), iPhone, iPad, PSP, Zaurus (SL-5500,SL-A300,SL-B500,SL-C700), FreeBSD, Solaris(on SPARC), Tru64 UNIX, OS/2Warp, iPod, PocketPC, Playstation3, Wii, GP2X, NetWalker and Dreamcast. It should work on other platforms as well if Requirements are satisfied.
- Since not all commands and specifications are implemented, some games may behave strangely. In that case, please report to the bug tracking system above.
##ToDo
- **Lua support**
- Apply "windoweffect" when "windowerase" is performed on mouse right click
- Store the image obtained by "bgcopy" when storing save files
- Deal with the case where shadow of characters is overlapped to other characters
- "english" command support to handle an English script
- Verify "existspbtn" which is implemented as "spbtn"
- Clean up of code
##Keyboard shortcut
All operations including mouse operations can be performed by keyboard short-cuts, though the shortcut keys defined in the script have higher priority.
``space``:Same as mouse left click, except it behaves as if the area outside the button is clicked even if the mouse cursor is just on a button.
``return``:Same as mouse left click.
``escape``:Same as mouse right click.
``p,k,↑``:Move the mouse cursor onto the previous choice (button) at decision branch (button selection).
``n,j,↓``:Move the mouse cursor onto the next choice (button) at decision branch (button selection).
``s``:Skip sentences to the next decision branch.
``o``:Switch to one page display mode.
``h,←``:Same as mouse wheel up.
``l,→``:Same as mouse wheel down.
``f``:Switch between full screen mode and windowed mode.
``a``:Enter into the auto read mode if automode or mode_ext is defined.
``z``:Enter into the volume and variables modification mode if "--edit" is specified in the command line options.
``1, 2, 3``:Change the speed of drawing characters.
``Shift + q``:Quit. (end command is issued)
##Command line options
``-h,--help``:Show the help messages and exit.
``-v,--version``:Show the version information and exit.
``--cdaudio``:Use CD audio if available. Even if it is not available, sound files are not used instead.
**Default: use Music files instead of CD audio**
``--cdnumber cd_number``:Choose the CD-ROM drive number to use if there are many.
**Default: 0**
``-f,--font file``:Set a TTF font file.
**Default: default.ttf in the current directory**
``--registry file``:Set a registry file.
``--dll file``:Set a dll file.
``-r,--root path``:Set the directory where the script and archives are placed.
**Default: current directory**
``--fullscreen``:Start in full screen mode.
``--window``:Start in windowed mode.
``--force-button-shortcut``:Ignore ``getenter`` and ``useescspc`` commands. In other words, ``esc``, ``space`` and ``return`` keys are forced to behave as a mouse click.
``--enable-wheeldown-advance``:Advance the text on mouse wheel down when it waits for a click at the end of a sentence. If the behavior of waiting for a click is customized by ``textgosub``, this option has no effect.
``--disable-rescale``:Do not rescale the images in the archives to fit in the screen when compiled with ``PDA_WIDTH`` or ``PDA_AUTOSIZE`` defined. Along with the compressed archives as mentioned in Compression of archives, ONScripter will run faster by avoiding the need for resizing. Note that image files outside the archives are resized as before.
``--render-font-outline``:Render the outline of a text in black (or white if the color of the text is dark) using the outline rendering function supported in ``SDL_ttf`` since 2.0.10. Text will be clearly shown.
``--edit``:Enable online modification of the volume and variables when "z" is pressed.
##Reading from the registry
``getreg`` command reads data from the registry of Windows. ONScripter emulates this command by reading from ``registry.txt`` that describes the data.

The format of ``registry.txt`` is as follows. Letters are case sensitive. Be careful not to have extra spaces. If you use Kanji characters, use Shift JIS code set.
```
[the second argument of getreg command (excluding quotation marks around)]
the third argument of getreg command = string to be compared (including quotation marks around)
```
Example of ``registry.txt``:
```
[software\StudioOGA\ONScripter]
"INSTALL"="FULL"
[software\StudioOGA\のまど]
"Download log file"="c:\nomad_down.log"
"Upload log file"="c:\nomad_up.log"
```
You can share a registry file among games if ONScripter is launched with ``--registry`` option. Without ``--registry`` option, it looks for ``registry.txt`` in the current directory.
##Loading DLL
``exec_dll`` command executes DLL (Dynamic Link Library) that is built to run on Windows. ONScripter emulates this command by reading from ``dll.txt`` that describes the relationship between the name of a DLL and its return value. So, DLL is not executed and the return value is fixed.

The format of ``dll.txt`` is as follows. Letters are case sensitive. Be careful not to have extra spaces. If you use Kanji characters, use Shift JIS code set.
```
[Name of DLL]
str = "string" (string value received in getret command)
ret = integer (integer value received in getret command)
```
Example of ``dll.txt``:
```
[test.dll]
str = "山田/太郎/やまだ/たろう"
ret = 1

[test2.dll]
str = "StudioOGA"
ret = 2
```
You can share a dll file among games if ONScripter is launched with ``--dll `` option. Without ``--dll`` option, it looks for ``dll.txt`` in the current directory.