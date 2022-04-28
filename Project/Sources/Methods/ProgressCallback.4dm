//%attributes = {}
#DECLARE($ID : Text; $message : Text; $value : Integer; $sharedForProgressBar : Object)
// example how to display a progress bar for system workers

C_COLLECTION:C1488(ProgressBarCol)  // using global variable, so still set when worker is called again
If (ProgressBarCol=Null:C1517)
	ProgressBarCol:=New collection:C1472
End if 

$currentProgress:=ProgressBarCol.query("ID=:1"; $ID)
If ($currentProgress.length#0)
	$ProgressBarID:=$currentProgress[0].progressID
Else 
	$ProgressBarID:=0
End if 

If (($ProgressBarID=0) && ($value#100))
	$ProgressBarID:=Progress New
	Progress SET TITLE($ProgressBarID; $ID)
	ProgressBarCol.push(New object:C1471("ID"; $ID; "progressID"; $ProgressBarID))
	
	// check if we want stop, if yes, add it to storage
	If (Bool:C1537($sharedForProgressBar.EnableButton))
		Progress SET BUTTON ENABLED($ProgressBarID; True:C214)
	End if 
End if 

If ($ProgressBarID#0)
	If (Progress Stopped($ProgressBarID))
		Use ($sharedForProgressBar)
			$sharedForProgressBar.Stop:=True:C214
		End use 
	End if 
	
	Case of 
		: ($value=100)
			Progress QUIT($ProgressBarID)
			// finished, remove from collection
			$index:=ProgressBarCol.indexOf($currentProgress[0])
			ProgressBarCol.remove($index)
			$ProgressBarID:=0
		: ($value<0)
			Progress SET MESSAGE($ProgressBarID; $message)
		Else 
			Progress SET PROGRESS($ProgressBarID; $value/100)
	End case 
End if 
