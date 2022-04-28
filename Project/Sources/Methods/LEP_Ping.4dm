//%attributes = {}
$in:=""
$out:=""
$error:=""

If (Is macOS:C1572)
	LAUNCH EXTERNAL PROCESS:C811("ping -c 1 www.google.com"; $in; $out; $error)
Else   // Win
	SET ENVIRONMENT VARIABLE:C812("_4D_OPTION_HIDE_CONSOLE"; "true")
	LAUNCH EXTERNAL PROCESS:C811("ping -n 1 www.google.com"; $in; $out; $error)
End if 