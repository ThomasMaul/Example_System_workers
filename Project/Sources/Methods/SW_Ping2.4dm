//%attributes = {}
$para:=cs:C1710.sysworker_callback.new()

If (Is macOS:C1572)
	$sw:=4D:C1709.SystemWorker.new("ping -c 10 www.google.com"; $para)
Else   // Win
	$sw:=4D:C1709.SystemWorker.new("ping -n 10 www.google.com"; $para)
End if 

$sw.wait()
