Scriptname OCR_Cheating extends Quest  

;After duplicating OCR_CheatingConsequenceTEMPLATE and OCR_CheatingDetectedMessageTEMPLATE, fill these manually
Quest Property MyCheatingDetectionQuest  Auto
Message Property MyCheatingDetectedMessage  Auto
ReferenceAlias Property DetectedCheatingAlias Auto
;Auto fill
Keyword Property OCR_AliasIsFilled  Auto  

;Call this function when the player makes a deliberate "move" on a lover and it could be detected as cheating by other nearby lovers
function DetectCheating()
	;The quest will start and try to fill the alias CheatedLoverAlias, condition the alias according to your relationship commitment logic/system
    MyCheatingDetectionQuest.Start()
    actor actor1 = DetectedCheatingAlias.GetActorReference()
    ;The following HasKeyword function will (on purpose) be aborted if DetectedCheatingAlias was not filled. For this the work, cheated lover aliases must apply the OCR_AliasIsFilled keyword (do not remove it)
    bool CheatingDetected = false
    if actor1.HasKeyword(OCR_AliasIsFilled)
    	CheatingDetected = true
    endif
	if CheatingDetected == true
		;Show the detection message
		MyCheatingDetectedMessage.Show()
		;Call your desired functions on actor1 to apply desired effect. Example:
		;actor1.AddToFaction(CheatedFaction)
	else
		MiscUtil.PrintConsole("DetectCheating: No cheating was detected.")
	endif
endfunction