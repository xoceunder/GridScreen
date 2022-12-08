' Copyright (c) 2020 Roku, Inc. All rights reserved.

sub Init()
        
	m.Poster = m.top.findNode("poster")                
    m.ProgressRectangle = m.top.FindNode("ProgressRectangle")
    m.progressrectangle = m.top.findnode("progressrectangle")
    m.progressrectangle.width = m.top.setWidth

end sub

sub itemContentChanged()
        m.Poster.loadDisplayMode = "scaleToZoom"
        if m.top.height < 400 and m.top.width < 400
          m.Poster.loadWidth = 300
          m.Poster.loadHeight = 150
        end if
        updateLayout()
        m.Poster.uri = m.top.itemContent.HDPOSTERURL
        m.ProgressRectangle = m.poster.getchild(0)

      thisBookmark = GetBookmarkData(m.top.itemcontent.guid)
      if thisBookmark > 0
        progress = thisBookmark/m.top.itemcontent.duration
        m.progressrectangle.width = m.top.itemcontent.ProgressWidth * progress
        m.progressrectangle.translation = [0, m.top.itemcontent.ProgressY]
        m.progressrectangle.visible = true
    '    print "progress"
      else
        m.progressrectangle.visible = false
      end if
	  
end sub

sub updateLayout()
        if m.top.height > 0 And m.top.width > 0 then
          m.Poster.width  = m.top.width
          m.Poster.height = m.top.height
        end if
end sub

function GetBookmarkData(id as Object) As Integer
  '  ?"GetBookmarkData(" id ")"
    sec = CreateObject("roRegistrySection", "Bookmarks")
    ' check whether bookmark for this item exists
    if sec.Exists("Bookmark_" + id.ToStr())
        return sec.Read("Bookmark_" + id.ToStr()).ToInt()
    end if
    return 0
end function
