;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname OCR_TIF__05107479 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
akspeaker.AddToFaction(OCR_Lover_AcceptsMultiplePartnersFaction)
akspeaker.AddToFaction(OCR_Lover_PlayerCommittedRelationshipFaction)
akspeaker.AddToFaction(OCR_Lover_Value_Intimacy)
akspeaker.SetFactionRank(OCR_Lover_Value_Intimacy, 100)
akspeaker.AddToFaction(OCR_Lover_Value_Love)
akspeaker.SetFactionRank(OCR_Lover_Value_Love, 100)
akspeaker.AddToFaction(OCR_OStimScenes_3PPCandidateFaction)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property OCR_Lover_AcceptsMultiplePartnersFaction Auto
Faction Property OCR_Lover_PlayerCommittedRelationshipFaction Auto
Faction Property OCR_Lover_Value_Intimacy Auto
Faction Property OCR_Lover_Value_Love Auto
Faction Property OCR_OStimScenes_3PPCandidateFaction Auto
