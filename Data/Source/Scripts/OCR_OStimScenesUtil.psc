Scriptname OCR_OStimScenesUtil extends Quest  

Actor Property PlayerRef Auto
Faction Property OCR_Lover_AcceptsMultiplePartnersFaction Auto
Faction Property OCR_OStimScenes_3PPCandidateFaction  Auto
Faction Property OCR_OStimScenes_ChosenCandidateFaction  Auto
GlobalVariable Property OCR_OStimScenes_3PPCandidateAmount  auto
GlobalVariable Property OStimAddActorsAtStart  auto
Message Property OCR_ScenesUtil_3PP  Auto
Message Property OCR_ScenesUtil_3PPCandidateSelect  Auto
Message Property OCR_ScenesUtil_3PPHowManyActors  Auto
Message Property OCR_ScenesUtil_4PCandidateSelect  Auto
Message Property OCR_ScenesUtil_5PCandidateSelect  Auto
Quest Property OCR_OStimScenesUtil_RestoreAddActorsAtStart  Auto
Quest Property OCR_OStimScenes_3PPCandidateAliases  Auto
Quest Property OCR_OStimScenes_4PCandidateAliases  Auto
Quest Property OCR_OStimScenes_5PCandidateAliases  Auto
ReferenceAlias Property FivePCandidate0  Auto
ReferenceAlias Property FivePCandidate1  Auto
ReferenceAlias Property FourPCandidate0  Auto
ReferenceAlias Property FourPCandidate1  Auto
ReferenceAlias Property FourPCandidate2  Auto
ReferenceAlias Property OCRSceneNPC  Auto
ReferenceAlias Property ThreePCandidate0  Auto
ReferenceAlias Property ThreePCandidate1  Auto
ReferenceAlias Property ThreePCandidate2  Auto
ReferenceAlias Property ThreePCandidate3  Auto

Function OCR_StartScene(actor InvitedNPC)
    OCRSceneNPC.Clear()
    OCRSceneNPC.ForceRefTo(InvitedNPC)
    if InvitedNPC.IsInFaction(OCR_Lover_AcceptsMultiplePartnersFaction)
        MiscUtil.PrintConsole("OCR_StartScene: Checking 3PP Faction...")
        int iChoice0 = OCR_ScenesUtil_3PP.Show()
        if iChoice0 == 0
            MiscUtil.PrintConsole("OCR_StartScene: 3PP option selected. Starting Alias...")
            OCR_OStimScenes_3PPCandidateAliases.Start()
            ReferenceAlias[] threePCandidates = new ReferenceAlias[4]
            threePCandidates[0] = ThreePCandidate0
            threePCandidates[1] = ThreePCandidate1
            threePCandidates[2] = ThreePCandidate2
            threePCandidates[3] = ThreePCandidate3
            int numOfCandidates = 0
            int i = 0
            while i < 4
                actor currentActor = threePCandidates[i].GetActorReference()
                if currentActor != None && currentActor.IsInFaction(OCR_OStimScenes_3PPCandidateFaction)
                    numOfCandidates += 1
                endif
                i += 1
            endwhile
            MiscUtil.PrintConsole("OCR_StartScene: Number of candidates: " + numOfCandidates)
            if numOfCandidates == 0
                Debug.Notification("No suitable candidates found.")
                MiscUtil.PrintConsole("OCR_StartScene: No suitable candidates found. Starting 2P scene...")
                OCR_StartScene2P(InvitedNPC)
            else
                OCR_OStimScenes_3PPCandidateAmount.SetValue(numOfCandidates)
                if numOfCandidates >= 1
                    int iChoice1 = OCR_ScenesUtil_3PPHowManyActors.Show()
                    if iChoice1 == 0
                        Select3PCandidate(numOfCandidates)
                    elseif iChoice1 == 1
                        Select4PCandidates(numOfCandidates)
                    elseif iChoice1 == 2
                        Select5PCandidates(numOfCandidates)
                    elseif iChoice1 == 3
                        OCR_StartScene6P(PlayerRef, InvitedNPC, ThreePCandidate0.GetActorReference(), ThreePCandidate1.GetActorReference(), ThreePCandidate2.GetActorReference(), ThreePCandidate3.GetActorReference())
                    Else
                        MiscUtil.PrintConsole("OCR_StartScene: Fallback to 2P scene...")
                        OCR_StartScene2P(InvitedNPC)
                    endif
                endif
            endif
        else
            MiscUtil.PrintConsole("OCR_StartScene: Starting 2P scene...")
            OCR_StartScene2P(InvitedNPC)
        endif
    else
        MiscUtil.PrintConsole("OCR_StartScene: NPC is not in faction 'OCR_Lover_AcceptsMultiplePartnersFaction'. Starting 2P scene...")
        OCR_StartScene2P(InvitedNPC)
    endif
endFunction

Function Select3PCandidate(int numOfCandidates)
    ReferenceAlias[] threePCandidates = new ReferenceAlias[4]
    InitializeThreePCandidates(threePCandidates)
    int iChoice0 = OCR_ScenesUtil_3PPCandidateSelect.Show()
    if iChoice0 <= numOfCandidates
        actor chosenActor = threePCandidates[iChoice0].GetActorReference()
        OCR_StartScene3P(PlayerRef, OCRSceneNPC.GetActorReference(), chosenActor)
    else
        OCR_StartScene2P(OCRSceneNPC.GetActorReference())
    endif
EndFunction

Function Select4PCandidates(int numOfCandidates)
    ReferenceAlias[] threePCandidates = new ReferenceAlias[4]
    InitializeThreePCandidates(threePCandidates)
    int iChoice0 = OCR_ScenesUtil_3PPCandidateSelect.Show()
    if iChoice0 <= numOfCandidates
        actor chosenActor1 = threePCandidates[iChoice0].GetActorReference()
        chosenActor1.AddToFaction(OCR_OStimScenes_ChosenCandidateFaction)
        OCR_OStimScenes_4PCandidateAliases.Start()
        ReferenceAlias[] FourPCandidates = new ReferenceAlias[3]
        FourPCandidates[0] = FourPCandidate0
        FourPCandidates[1] = FourPCandidate1
        FourPCandidates[2] = FourPCandidate2
        int iChoice1 = OCR_ScenesUtil_4PCandidateSelect.Show()
        if iChoice1 >= 0
            actor chosenActor2 = FourPCandidates[iChoice1].GetActorReference()
            OCR_StartScene4P(PlayerRef, OCRSceneNPC.GetActorReference(), chosenActor1, chosenActor2)
        Else
            OCR_StartScene3P(PlayerRef, OCRSceneNPC.GetActorReference(), chosenActor1)
        endif
    else
        OCR_StartScene2P(OCRSceneNPC.GetActorReference())
    endif
EndFunction

Function Select5PCandidates(int numOfCandidates)
    ReferenceAlias[] threePCandidates = new ReferenceAlias[4]
    InitializeThreePCandidates(threePCandidates)
    int iChoice0 = OCR_ScenesUtil_3PPCandidateSelect.Show()
    if iChoice0 <= numOfCandidates
        actor chosenActor1 = threePCandidates[iChoice0].GetActorReference()
        chosenActor1.AddToFaction(OCR_OStimScenes_ChosenCandidateFaction)
        OCR_OStimScenes_4PCandidateAliases.Start()
        ReferenceAlias[] FourPCandidates = new ReferenceAlias[3]
        FourPCandidates[0] = FourPCandidate0
        FourPCandidates[1] = FourPCandidate1
        FourPCandidates[2] = FourPCandidate2
        int iChoice1 = OCR_ScenesUtil_4PCandidateSelect.Show()
        if iChoice1 >= 0
            actor chosenActor2 = FourPCandidates[iChoice1].GetActorReference()
            chosenActor2.AddToFaction(OCR_OStimScenes_ChosenCandidateFaction)
            OCR_OStimScenes_5PCandidateAliases.Start()
            ReferenceAlias[] FivePCandidates = new ReferenceAlias[2]
            FivePCandidates[0] = FivePCandidate0
            FivePCandidates[1] = FivePCandidate1
            int iChoice2 = OCR_ScenesUtil_5PCandidateSelect.Show()
            if iChoice2 >= 0
                actor chosenActor3 = FivePCandidates[iChoice2].GetActorReference()
                OCR_StartScene5P(PlayerRef, OCRSceneNPC.GetActorReference(), chosenActor1, chosenActor2, chosenActor3)
            Else
                OCR_StartScene4P(PlayerRef, OCRSceneNPC.GetActorReference(), chosenActor1, chosenActor2)
            endif
        Else
            OCR_StartScene3P(PlayerRef, OCRSceneNPC.GetActorReference(), chosenActor1)
        endif
    else
        OCR_StartScene2P(OCRSceneNPC.GetActorReference())
    endif
EndFunction

Function InitializeThreePCandidates(ReferenceAlias[] threePCandidates)
    threePCandidates[0] = ThreePCandidate0
    threePCandidates[1] = ThreePCandidate1
    threePCandidates[2] = ThreePCandidate2
    threePCandidates[3] = ThreePCandidate3
EndFunction

function OCR_StartScene2P(actor InvitedNPC)
    DisableAddActors()
    Actor[] actors = new actor[2]
    Actors[0] = PlayerRef
    Actors[1] = InvitedNPC
    OThread.QuickStart(Actors)
    StartSceneReset()
endFunction

function OCR_StartScene3P(actor actor1, actor actor2, actor actor3)
    DisableAddActors()
    Actor[] actors = new actor[3]
    Actors[0] = PlayerRef
    Actors[1] = actor2
    Actors[2] = actor3
    OThread.QuickStart(actors)
    StartSceneReset()
endFunction

function OCR_StartScene4P(actor actor1, actor actor2, actor actor3, actor actor4)
    actor3.RemoveFromFaction(OCR_OStimScenes_ChosenCandidateFaction)
    DisableAddActors()
    Actor[] actors = new actor[4]
    Actors[0] = PlayerRef
    Actors[1] = actor2
    Actors[2] = actor3
    Actors[3] = actor4
    OThread.QuickStart(actors)
    StartSceneReset()
endFunction

function OCR_StartScene5P(actor actor1, actor actor2, actor actor3, actor actor4, actor actor5)
    actor3.RemoveFromFaction(OCR_OStimScenes_ChosenCandidateFaction)
    actor4.RemoveFromFaction(OCR_OStimScenes_ChosenCandidateFaction)
    DisableAddActors()
    Actor[] actors = new actor[5]
    Actors[0] = PlayerRef
    Actors[1] = actor2
    Actors[2] = actor3
    Actors[3] = actor4
    Actors[4] = actor5
    OThread.QuickStart(actors)
    StartSceneReset()
endFunction

function OCR_StartScene6P(actor actor1, actor actor2, actor actor3, actor actor4, actor actor5, actor actor6)
    DisableAddActors()
    Actor[] actors = new actor[6]
    Actors[0] = PlayerRef
    Actors[1] = actor2
    Actors[2] = actor3
    Actors[3] = actor4
    Actors[4] = actor5
    Actors[5] = actor6
    OThread.QuickStart(actors)
    StartSceneReset()
endFunction

Function DisableAddActors()
    if OStimAddActorsAtStart.GetValue() == 1
        OStimAddActorsAtStart.SetValue(0)
        OCR_OStimScenesUtil_RestoreAddActorsAtStart.Start()
    endif
EndFunction

function StartSceneReset()
    OCRSceneNPC.Clear()
    OCR_OStimScenes_3PPCandidateAliases.Stop()
    OCR_OStimScenes_4PCandidateAliases.Stop()
    OCR_OStimScenes_5PCandidateAliases.Stop()
endFunction