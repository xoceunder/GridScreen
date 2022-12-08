' ********** Copyright 2020 Roku Corp.  All Rights Reserved. **********

' Note that we need to import this file in MainLoaderTask.xml using relative path.
sub Init()
    ' set the name of the function in the Task node component to be executed when the state field changes to RUN
    ' in our case this method executed after the following cmd: m.contentTask.control = "run"(see Init method in MainScene)
    m.top.functionName = "GetContent"
end sub

sub GetContent()
    ?"ID "m.top.input
    ' request the content feed from the API
    xfer = CreateObject("roURLTransfer")
    xfer.SetCertificatesFile("common:/certs/ca-bundle.crt")
    xfer.SetURL("http://xocecoder.ddns.net/roku_api.php?username=test&password=test&action=get_movies&category_id="+m.top.input)
    rsp = xfer.GetToString()
    content = createObject("roSGNode", "ContentNode")
    json = ParseJson(rsp)
    if json <> invalid
		for each item in json.content ' parse items and push them to row
            video = content.createChild("ContentNode")
            video.hdPosterURL = item.hdPoster
            video.title = item.title
            video.releaseDate = item.releaseDate
        end for
        m.top.content = content
    end if
end sub

