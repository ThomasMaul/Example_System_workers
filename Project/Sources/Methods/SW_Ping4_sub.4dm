//%attributes = {}
#DECLARE($url : Text)->$sw
$para:=cs:C1710.sysworker_callback_progress.new(Formula:C1597(ProgressCallback); $url; True:C214)

If (Is macOS:C1572)
	$command:="ping -c 10 "+$url
Else   // Win
	$command:="ping -n 10 "+$url
End if 
$sw:=4D:C1709.SystemWorker.new($command; $para)

