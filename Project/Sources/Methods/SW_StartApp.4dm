//%attributes = {}
If (Is macOS:C1572)
	$sw:=4D:C1709.SystemWorker.new("open /System/Applications/TextEdit.app")
Else   // Win
	$sw:=4D:C1709.SystemWorker.new("C:\\WINDOWS\\notepad.exe"; New object:C1471("hideWindow"; False:C215))
End if 