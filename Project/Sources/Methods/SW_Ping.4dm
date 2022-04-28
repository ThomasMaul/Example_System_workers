//%attributes = {}
If (Is macOS:C1572)
	$sw:=4D:C1709.SystemWorker.new("ping -c 1 www.google.com")
Else   // Win
	$sw:=4D:C1709.SystemWorker.new("ping -n 1 www.google.com"; New object:C1471("encoding"; "IBM437"))
	
End if 

$sw.wait()
