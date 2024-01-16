Scriptname OCR_RestoreAddActorsAtStart extends Quest  

GlobalVariable Property OStimAddActorsAtStart  auto
Quest Property OCR_OStimScenesUtil_RestoreAddActorsAtStart  Auto

Function Restore()
    RegisterForModEvent("ostim_end", "OStimEnd")
endFunction

Event OStimEnd(string eventName, string strArg, float numArg, Form sender)
    OStimAddActorsAtStart.SetValue(1)
    OCR_OStimScenesUtil_RestoreAddActorsAtStart.Stop()
EndEvent