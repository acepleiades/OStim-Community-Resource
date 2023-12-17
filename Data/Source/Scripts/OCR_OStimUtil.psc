Scriptname OCR_OStimUtil extends Quest  

Actor Property PlayerRef Auto

;Function for starting OStim sequences in gameplay
Function StartOstimSequence(Actor[] actors, string sequenceName, bool exitOnEnd = true, ObjectReference furnObj = none)
    int BuilderID = OThreadBuilder.Create(actors)
    OThreadBuilder.SetStartingSequence(BuilderID, sequenceName)
    MiscUtil.PrintConsole("About to start sequence: " + sequenceName)
    if exitOnEnd
        MiscUtil.PrintConsole("Sequence exit on end")
        OThreadBuilder.EndAfterSequence(BuilderID)
    endif
    if(!furnObj)
        MiscUtil.PrintConsole("Seq No Furniture")
        OThreadBuilder.NoFurniture(BuilderID)
    else
        MiscUtil.PrintConsole("Seq With Furniture")
        OThreadBuilder.SetFurniture(BuilderID, furnObj)
    endif
    int threadID = OThreadBuilder.Start(BuilderID)
    MiscUtil.PrintConsole("StartOstimSequence: " + sequenceName + ", ID: " + threadID + "Builder ID: " + BuilderID)
EndFunction