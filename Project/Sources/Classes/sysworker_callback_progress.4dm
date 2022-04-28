Class constructor($callback : 4D:C1709.Function; $callbackID : Text; $enableStop : Boolean)
	This:C1470.dataType:="text"
	This:C1470.data:=""
	If (Is Windows:C1573)
		This:C1470.encoding:="IBM437"
	End if 
	If (Count parameters:C259>0)
		This:C1470.callback:=$callback
		This:C1470.callbackID:=$callbackID
		ASSERT:C1129(Value type:C1509($callback)=Is object:K8:27; "Callback must be of type function")
		ASSERT:C1129(OB Instance of:C1731($callback; 4D:C1709.Function); "Callback must be of type function")
		ASSERT:C1129($callbackID#""; "Callback ID Method must not be empty")
	End if 
	// only needed for stop button, to communicate between progress bar worker and callback function
	This:C1470.SharedForProgressBar:=New shared object:C1526("Stop"; False:C215; "EnableButton"; $enableStop)
	
	
Function onData($systemworker : Object; $data : Object)
	If (Bool:C1537(This:C1470.SharedForProgressBar.Stop))
		$systemworker.terminate()
		return 
	End if 
	
	If (String:C10($data.data)#"")
		This:C1470.data+=$data.data
		If (This:C1470.callback#Null:C1517)
			$pos:=Position:C15(Char:C90(10); This:C1470.data)
			If ($pos>0)
				CALL WORKER:C1389("ProgressCallback"; This:C1470.callback.source; This:C1470.callbackID; Substring:C12(This:C1470.data; 1; $pos-1); -1; This:C1470.SharedForProgressBar)
				This:C1470.data:=Substring:C12(This:C1470.data; $pos+1)
			End if 
		End if 
	End if 
	
Function onTerminate($systemworker : Object; $data : Object)
	CALL WORKER:C1389("ProgressCallback"; This:C1470.callback.source; This:C1470.callbackID; ""; 100; This:C1470.SharedForProgressBar)
	