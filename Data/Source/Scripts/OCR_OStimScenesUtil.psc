Scriptname OCR_OStimScenesUtil extends Quest  

Actor Property PlayerRef Auto
Faction Property OCR_Lover_AcceptsMultiplePartnersFaction Auto
GlobalVariable Property OCR_OStimScenes_3PCandidateAmount  auto
GlobalVariable Property OStimAddActorsAtStart  auto
Message Property OCR_ScenesUtil_3PCandidateSelect  Auto
Message Property OCR_ScenesUtil_3PP  Auto
ReferenceAlias Property OCRSceneNPC  Auto
ReferenceAlias Property ThreePCandidate0  Auto
ReferenceAlias Property ThreePCandidate1  Auto
ReferenceAlias Property ThreePCandidate2  Auto
ReferenceAlias Property ThreePCandidate3  Auto
Quest Property OCR_OStimScenes_3PCandidateAliases  Auto
Faction Property OCR_OStimScenes_3PPCandidateFaction  Auto

function OCR_StartScene(actor actor1)
	OStimAddActorsAtStart.SetValue(0)
	if actor1.IsInFaction(OCR_Lover_AcceptsMultiplePartnersFaction)
		int iChoice0 = OCR_ScenesUtil_3PP.Show()
		if iChoice0 == 0
			OCR_OStimScenes_3PCandidateAliases.Start()
			int ThreePCandidates = 0
			if ThreePCandidate0.GetActorReference().IsInFaction(OCR_OStimScenes_3PPCandidateFaction)
				Debug.Notification("No suitable candidates were found.")
				OCR_StartScene2P(actor1)
			elseif ThreePCandidate1.GetActorReference().IsInFaction(OCR_OStimScenes_3PPCandidateFaction)
				ThreePCandidates = 1
				OCR_OStimScenes_3PCandidateAmount.SetValue(1)
			elseif ThreePCandidate1.GetActorReference().IsInFaction(OCR_OStimScenes_3PPCandidateFaction)
				ThreePCandidates = 2
				OCR_OStimScenes_3PCandidateAmount.SetValue(2)
			elseif ThreePCandidate2.GetActorReference().IsInFaction(OCR_OStimScenes_3PPCandidateFaction)
				ThreePCandidates = 3
				OCR_OStimScenes_3PCandidateAmount.SetValue(3)
			elseif ThreePCandidate3.GetActorReference().IsInFaction(OCR_OStimScenes_3PPCandidateFaction)
				ThreePCandidates = 4
				OCR_OStimScenes_3PCandidateAmount.SetValue(4)
			endif
			int iChoice1 = OCR_ScenesUtil_3PCandidateSelect.Show()
			if iChoice1 == 0
				OCR_DirectlyStartScene3P(PlayerRef, actor1, ThreePCandidate0.GetActorReference())
			elseif iChoice1 == 1
				OCR_DirectlyStartScene3P(PlayerRef, actor1, ThreePCandidate1.GetActorReference())
			elseif iChoice1 == 2
				OCR_DirectlyStartScene3P(PlayerRef, actor1, ThreePCandidate2.GetActorReference())
			elseif iChoice1 == 3
				OCR_DirectlyStartScene3P(PlayerRef, actor1, ThreePCandidate3.GetActorReference())
			Else
				OCR_StartScene2P(actor1)
			endif
		Else
			OCR_StartScene2P(actor1)
		endif
	Else
		OCR_StartScene2P(actor1)
	endif
endFunction

function OCR_StartScene2P(actor actor1)
	Actor[] actors = new actor[2]
	Actors[0] = PlayerRef
	Actors[1] = actor1
	OThread.QuickStart(Actors)
endFunction

function OCR_DirectlyStartScene3P(actor actor1, actor actor2, actor actor3)
	Actor[] actors = new actor[3]
	Actors[0] = PlayerRef
	Actors[1] = actor1
	Actors[2] = actor2
	OThread.QuickStart(actors)
endFunction