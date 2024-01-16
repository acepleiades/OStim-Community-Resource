Scriptname OCR_OStimScenesUtil extends Quest  

Actor Property PlayerRef Auto
Faction Property OCR_Lover_AcceptsMultiplePartnersFaction Auto
Faction Property OCR_OStimScenes_3PPCandidateFaction  Auto
GlobalVariable Property OCR_OStimScenes_3PPCandidateAmount  auto
GlobalVariable Property OStimAddActorsAtStart  auto
Message Property OCR_ScenesUtil_3PPCandidateSelect  Auto
Message Property OCR_ScenesUtil_3PP  Auto
Quest Property OCR_OStimScenes_3PPCandidateAliases  Auto
Quest Property OCR_OStimScenesUtil_RestoreAddActorsAtStart  Auto
ReferenceAlias Property OCRSceneNPC  Auto
ReferenceAlias Property ThreePCandidate0  Auto
ReferenceAlias Property ThreePCandidate1  Auto
ReferenceAlias Property ThreePCandidate2  Auto
ReferenceAlias Property ThreePCandidate3  Auto
ReferenceAlias Property ThreePCandidateAliases_ScenesUtil_OCRSceneNPC  Auto

Function OCR_StartScene(actor InvitedNPC)
	OCRSceneNPC.ForceRefTo(InvitedNPC)
    if InvitedNPC.IsInFaction(OCR_Lover_AcceptsMultiplePartnersFaction)
        int iChoice0 = OCR_ScenesUtil_3PP.Show()
        if iChoice0 == 0
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
            if numOfCandidates == 0
                Debug.Notification("No suitable candidates were found.")
                OCR_StartScene2P(InvitedNPC)
            else
                OCR_OStimScenes_3PPCandidateAmount.SetValue(numOfCandidates)
                int iChoice1 = OCR_ScenesUtil_3PPCandidateSelect.Show()
                if iChoice1 >= 0 && iChoice1 < numOfCandidates
                    actor chosenActor = threePCandidates[iChoice1].GetActorReference()
                    OCR_StartScene3P(PlayerRef, InvitedNPC, chosenActor)
                else
                    OCR_StartScene2P(InvitedNPC)
                endif
            endif
        else
            OCR_StartScene2P(InvitedNPC)
        endif
    else
        OCR_StartScene2P(InvitedNPC)
    endif
endFunction

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

Function DisableAddActors()
	if OStimAddActorsAtStart.GetValue() == 1
        OStimAddActorsAtStart.SetValue(0)
        OCR_OStimScenesUtil_RestoreAddActorsAtStart.Start()
    endif
EndFunction

function StartSceneReset()
	OCRSceneNPC.Clear()
	ThreePCandidateAliases_ScenesUtil_OCRSceneNPC.Clear()
	ThreePCandidate0.Clear()
	ThreePCandidate1.Clear()
	ThreePCandidate2.Clear()
	ThreePCandidate3.Clear()
    OCR_OStimScenes_3PPCandidateAliases.Stop()
endFunction