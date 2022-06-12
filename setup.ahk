SetWorkingDir %A_ScriptDir% 
#singleInstance Force

loop 
{
  if !FileExist("config.txt")
  {
    InputBox, userName, Name, What is your first name?
    FileAppend, %userName%, config.txt
  }
  else 
  {
    InputBox, width, Width, What is the width
    FileReadLine, name, config.txt, 1
    Run dialer.exe %name% %width%
    ExitApp
    return
  }
}


    