//%attributes = {}
If (Is macOS:C1572)
	$sw:=4D:C1709.SystemWorker.new("ping -c 10 www.google.com"; New object:C1471("onData"; Formula:C1597(MESSAGE:C88($2.data))))
Else   // Win
	$sw:=4D:C1709.SystemWorker.new("ping -n 10 www.google.com"; New object:C1471("encoding"; "IBM437"; "onData"; Formula:C1597(MESSAGE:C88($2.data))))
End if 

$sw.wait()
