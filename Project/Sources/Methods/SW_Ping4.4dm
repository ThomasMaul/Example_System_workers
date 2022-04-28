//%attributes = {}
C_COLLECTION:C1488($jobs)
$jobs:=New collection:C1472

$jobs.push(SW_Ping4_sub("www.4dmethod.com"))
$jobs.push(SW_Ping4_sub("www.google.de"))
$jobs.push(SW_Ping4_sub("kb.4d.com"))
$jobs.push(SW_Ping4_sub("kb.4d-japan.com"))

While ($jobs.length>0)
	For ($i; 0; $jobs.length-1)
		$jobs[$i].wait(0.1)
		If ($jobs[$i].terminated)
			$jobs.remove($i)
			break
		End if 
	End for 
End while 
