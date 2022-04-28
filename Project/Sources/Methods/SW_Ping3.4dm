//%attributes = {}
$para:=cs:C1710.sysworker_callback_progress.new(Formula:C1597(ProgressCallback); "www.google.com"; True:C214)

If (Is macOS:C1572)
	$sw:=4D:C1709.SystemWorker.new("ping -c 10 www.google.com"; $para)
Else   // Win
	$sw:=4D:C1709.SystemWorker.new("ping -n 10 www.google.com"; $para)
End if 

$sw.wait()
