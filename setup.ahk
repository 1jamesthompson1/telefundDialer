#singleInstance Force
Gui, add, Text,, Enter name:
Gui, Add, Edit, vname
Gui, add, Text,, Enter width:
Gui, Add, Edit, vwidth
Gui, Add, Button, gsubmit, submit
Gui, Show
return

Submit:
GuiControlGet, name
GuiControlGet, width
Run dialer.ahk %name% %width%
Gui Destroy
ExitApp

    