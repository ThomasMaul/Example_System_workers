//%attributes = {}
If (Is macOS:C1572)
	LAUNCH EXTERNAL PROCESS:C811("open /System/Applications/TextEdit.app")
Else   // Win
	LAUNCH EXTERNAL PROCESS:C811("C:\\WINDOWS\\notepad.exe")
End if 