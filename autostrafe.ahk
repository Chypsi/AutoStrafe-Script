#NoEnv  ; Made by Chypsi.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for fun scripting.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SendMode, Input
SetBatchLines -1
CoordMode, Mouse, Screen

mouseXY(x, y){
DllCall("mouse_event",uint,1,int,x,int,y­,uint,0,int,0)
}

strafe(left){
moveCount := 40
sleepInterval := 1.5
relativeMove := 14,512
if(left){
key := "a"
move := -relativeMove
} else {
key := "d"
move := relativeMove
}
Send, {Blind}{%key% down}
DllCall("Sleep", "UInt", 5)
Loop, %moveCount% {
mouseXY(move, 0)
DllCall("Sleep", "UInt", sleepInterval)
}
Send, {Blind}{%key% up}
}

XButton2::
while getkeystate("XButton2","P") {
strafe(false)
strafe(true)
}
return
