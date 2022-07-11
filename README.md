# Dialer

This is a little ahk script that is used to automate the process we use in our workflow of calling people from spreadsheet data. This script will navigate to the number in the spreadsheet and copy it. Then it focuses on the UCS call application and pastes it in. Go back to your browser of choice then add your name and the date in the cell adjacent to each other.

You can contact me via email for this project specifically at jamestelefund@gmail.com

## User Guide

### Installation
1. Naviagte to [releases](https://github.com/1jamesthompson1/telefundDialer/releases)
2. Click on dialer.exe. This will download it to your default download location. There may be an antivirus warning in there just ignore it.
3. Move it to your prefered location (optional)
Here is the steps as a gif:  
![Install](https://user-images.githubusercontent.com/103026808/177872487-71cd2267-8106-43cd-84e2-bad53f7a6fb7.gif)

### Setup
When running for the first time it will do a setup. This will create a config file
1. Double click on dialer.exe
2. Enter your name into the prompt
3. Enter the width of the spreadsheet (see below for more information)  
It should be good to go now from shift to shift.
Here it is as a gif:  
![Setup](https://user-images.githubusercontent.com/103026808/177872497-3e80f3f6-8ff2-4cc0-98a0-b2103cba12e6.gif)

UCS also needs to be ready to be used as this uses the call assistance box instead of the base ucs.  
To activate this:  
1. Go to tools
2. Press call assistance. This box can be moved anywhere it doesn't matter.
Here is an example of me enabling UCS call asisstance:  
![Setup_UCS](https://user-images.githubusercontent.com/103026808/177873381-1dbade8d-e1a4-416d-9505-b6934ec63e8d.gif)

### Using
You will have to run the dialer.exe file at the start of your shift and any time you want to change the width of the spreadsheet.
To do this simply
1. Double click on dialer.exe
2. Enter the width of the spreadsheet  
The script is now running and can be used.  
There are 3 shortcuts built into the script.  
- Rctrl : Runs the default calling functionality. So copy the number found in the sheet into ucs and print your name and DateTime in appropriate cells.
- Lctrl + ] : Enters AP into your current cell then runs the default calling functionality on the row below.
- Lctrl + [ : Enters your name into the current cell selected then date time into the cell to the right.
The **width** of the sheet is the number of cells between the outcome column and the phone number column you are trying to call. Image it like the number of times you would have to press the left button to get to the right number cell (as this is literally what it is doing). Here is a photo example of a width of 5 when doing first calls.
![image](https://user-images.githubusercontent.com/103026808/177656855-00983701-443d-42dc-8e00-126ba4ece2de.png)
Note when you do second calls or change campaign you will have to redo step 1 and 2 to change the width.  
Here is me stepping through the steps and using the three shortcuts in order:  
![Using](https://user-images.githubusercontent.com/103026808/177872509-a823e0f3-264f-4e61-bb4d-b8244c02ca4e.gif)

### Changing setting
Three settings can be edited in the config.txt file. These are in order of the line they are found on.
1. Caller Name
2. preNumber - This is entered before the number is copied from the spreadsheet
3. browser executable string. This can be set to; "chrome.exe" for Chrome, "firefox.exe" for Firefox and, "msedge.exe" for Microsoft Edge.

## Repo Guide

### Commit messages
They will be sorted into a category with these emojis found below

➕ `:heavy_plus_sign:` when adding a file or implementing a feature<br>
🔨 `:hammer:` when fixing a bug or issue<br>
📜 `:scroll:` when updating docs, readme or comments<br>
✅ `:white_check_mark:` when a release is made<br>
👕 `:shirt:` when refactoring or removing linter warnings<br>
❌ `:x:` when removing code or files<br>


### Versioning
I am using semantic versioning. No originality here just using the guidelines found at https://semver.org/.  
In short, this will mean Major will be big updates. Minor are any updates that aren't too big and also arent backward compatible. Lastly, patches are simple fixes that are not required but might fix a little behaviour. Always should be backward compatible.
