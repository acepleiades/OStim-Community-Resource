Scriptname OCR_OStimUtil extends Quest  

Actor Property PlayerRef Auto

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


ObjectReference Function FindFurnitureByType(int actorCount = 2, string type)
    ObjectReference[] furn = OFurniture.FindFurniture(actorCount, PlayerRef, 10000, 1000)
    int index = 0
    int index2 = 0
    MiscUtil.PrintConsole("Amount of furntiture found - " + furn.Length)
    while(index2 < furn.length)
        MiscUtil.PrintConsole("Nearby furniture index " + index2 + " found " + OFurniture.GetFurnitureType(furn[index2]))
        index2 += 1
    endwhile
    while(index < furn.length)
        string currentFurnitureType = OFurniture.GetFurnitureType(furn[index])
        bool foundFurniture = false
        if(type == "bed")
            if(currentFurnitureType == "singlebed" || currentFurnitureType == "doublebed")
                return furn[index]
            endif
        else
            if(OFurniture.GetFurnitureType(furn[index]) == type)
                return furn[index]
            endif
        endif
        index += 1
    endwhile
    return none
EndFunction