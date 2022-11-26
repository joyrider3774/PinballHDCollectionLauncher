; Created by joyrider 3774 21/12/2018  
;--------Run Before (Need to be compiled)----Start------

#SingleInstance force
SetTitleMatchMode, 3
DetectHiddenWindows, On
DetectHiddenText, On

; User inputs
;lower this value if your game loads and displays the main menu faster and you don't want to idle on main menu
;increase if your game starts too slow on your system
WaitBeforeActivate = 4500; before activating the windows if it's found

;Disable this once the script is working fine for you with your timings to not hear the beap anymore
DoPlayBeeps := true

KeyDelay = 50
SetWorkingDir %A_ScriptDir%


;--------Run Before (Need to be compiled)----End------
 


;From here run your pinball HD Collection

RegRead, SteamDirPath, HKCU, Software\Valve\Steam, SteamPath

Run, "%SteamDirPath%\Steam.exe" -applaunch 448670


WinWait, Pinball HD Collection ahk_class GPPBWndClass,, 20000
if ErrorLevel
{
    MsgBox, WinWait timed out.
    exitapp
}

Sleep, WaitBeforeActivate

WinActivate, Pinball HD Collection ahk_class GPPBWndClass

if (DoPlayBeeps) 
{
	SoundBeep, 500, 500
}


;Send Enter + assumes correct position
StartGame() {
	global KeyDelay
	
	Send {Enter down}
	Sleep, %KeyDelay%
	Send {Enter up}
	Sleep, %KeyDelay%
	Return
}

GotoFirstTable(X) {
	global KeyDelay
	LoopXCount := (X)
	
	Loop, %LoopXCount%
	{
		Send {Left down}
		Sleep, %KeyDelay%
		Send {Left up}
		Sleep, %KeyDelay%
	}
	Return
}

SelectGame(X) {
	global KeyDelay
	
	GotoFirstTable(17)
	
	LoopXCount := (X)
		
	Loop, %LoopXCount%
	{
		Send {Right down}
		Sleep, %KeyDelay%
		Send {Right up}
		Sleep, %KeyDelay%
	}
	
	Return
}

if (A_Args[1] = "wildwest")
{ 
	SelectGame(0)
	StartGame()
}

if (A_Args[1] = "fantasy")
{ 
	SelectGame(1)
	StartGame()
}

if (A_Args[1] = "zombie")
{ 
	SelectGame(2)
	StartGame()
}


if (A_Args[1] = "deep")
{ 
	SelectGame(3)
	StartGame()
}

if (A_Args[1] = "jungle")
{ 
	SelectGame(4)
	StartGame()
}


if (A_Args[1] = "halloween")
{ 
	SelectGame(5)
	StartGame()
}

if (A_Args[1] = "davinci")
{ 
	SelectGame(6)
	StartGame()
}

if (A_Args[1] = "snow")
{ 
	SelectGame(7)
	StartGame()
}

if (A_Args[1] = "arcade")
{ 
	SelectGame(8)
	StartGame()
}

if (A_Args[1] = "pirates")
{ 
	SelectGame(9)
	StartGame()
}

if (A_Args[1] = "redplanet")
{ 
	SelectGame(10)
	StartGame()
}

if (A_Args[1] = "tanks")
{ 
	SelectGame(11)
	StartGame()
}

if (A_Args[1] = "streetracing")
{ 
	SelectGame(12)
	StartGame()
}

if (A_Args[1] = "dreamland")
{ 
	SelectGame(13)
	StartGame()
}

if (A_Args[1] = "mafia")
{ 
	SelectGame(14)
	StartGame()
}

if (A_Args[1] = "vikings")
{ 
	SelectGame(15)
	StartGame()
}


Process, WaitClose, PinballHDCollection.exe

ExitApp

;REMOVE EVERYTHING BELOW IF YOU DO NOT WANT CONTROLS REMAPPING

#IfWinActive Pinball HD Collection ahk_class GPPBWndClass
; info about keys can be found here : https://autohotkey.com/docs/KeyList.htm

; in my cab i use the esc key to quit a game but the esc key is also needed to cancel highscore input and return to menu and start new game
; so u see another button C on my cabinet to send 3 times ESC to the game and then return when i am at the high score screen 
c::
	ControlSend ,, {BS}{BS}{BS}{BS}davy{Enter}, Pinball HD Collection ahk_class GPPBWndClass
	Sleep, 750
	ControlSend ,, {ESC}, Pinball HD Collection ahk_class GPPBWndClass
	Sleep, 750
	ControlSend ,, {ESC}, Pinball HD Collection ahk_class GPPBWndClass
	Sleep, 750
	ControlSend ,, {Enter}, Pinball HD Collection ahk_class GPPBWndClass
return

;left flipper on my cabinet is left shift and ingame is left
LShift::Left

;Right flipper on my cabinet is right shift and ingame is right
RShift::Right

;Left Control and Right Control are my extra flipper buttons for nudges ingame up is nudge 
LControl::Up
RControl::Up

;enter key on my cabinet is launch key which is down key ingame
Enter::Down


