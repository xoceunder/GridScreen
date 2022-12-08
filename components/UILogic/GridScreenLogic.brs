' ********** Copyright 2020 Roku Corp.  All Rights Reserved. **********

' Note that we need to import this file in MainScene.xml using relative path.

sub ShowGridScreen()
    m.GridScreen = CreateObject("roSGNode", "GridScreen")
	m.GridScreen.ObserveField("rowItemFocused", "OnGridScreenItemFocused")
    ShowScreen(m.GridScreen) ' show GridScreen
end sub

sub OnGridScreenItemFocused(event as Object) ' invoked when another item is focused
    focusedIndex = event.GetRoSGNode().rowItemFocused
    row = event.GetRoSGNode().content.GetChild(focusedIndex[0]) ' get all items of row
    item = row.GetChild(focusedIndex[1]) ' get focused item
	
	if item <> invalid
	    ?"Run"item
	else

        childNode = createObject("roSGNode", "ContentNode")
        childNode.id = Code(2)
        childNode.title = generateRegistrationCode(4)
	    childNode.HDPOSTERURL = "https://www.lyngsat.com/logo/tv/tt/teleunion-do.png"
	    row.insertChild(childNode, 0)	
	end if
	 
end sub

'******************************************************
'Return a random Registration Code with specified length
'******************************************************
Function generateRegistrationCode(codeLength As Integer) As String
  codeArray = ["-","0","1","2","3","4","5","6","7","8","9","Q","W","E","R","T","Y","U","I","O","P","A","S","D","F","G","H","J","K","L","Z","X","C","V","B","N","M"]
  result=CreateObject("roString")
  for i = 1 to codeLength
    result.AppendString(codeArray[RND(36)],1)
  next
  return result
End Function

'******************************************************
'Return a random Registration Code with specified length
'******************************************************
Function Code(codeLength As Integer) As String
  codeArray = ["0","1","2","3","4","5","6","7","8","9"]
  result=CreateObject("roString")
  for i = 1 to codeLength
    result.AppendString(codeArray[RND(36)],1)
  next
  return result
End Function
