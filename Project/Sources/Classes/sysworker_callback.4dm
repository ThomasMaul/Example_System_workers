Class constructor
	This:C1470.dataType:="text"
	This:C1470.data:=""
	If (Is Windows:C1573)
		This:C1470.encoding:="IBM437"
	End if 
	
Function onData($systemWorker : Object; $info : Object)
	This:C1470.data+=$info.data
	If (Position:C15(Char:C90(10); This:C1470.data)>0)
		MESSAGE:C88(This:C1470.data)
		This:C1470.data:=""
	End if 
	