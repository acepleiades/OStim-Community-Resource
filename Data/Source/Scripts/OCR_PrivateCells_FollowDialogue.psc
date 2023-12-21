Scriptname OCR_PrivateCells_FollowDialogue extends Quest  

Faction Property OCR_PrivateCellFollowingFaction Auto
ReferenceAlias Property AliasFollowing  Auto

Function PrivateCell_SetFollower(actor InvitedNPC, bool setFollower)
    if setFollower
    	if InvitedNPC.IsPlayerTeammate()
            Debug.Notification("This person is already following you.")
        else
    		bool AliasFollowing_IsEmpty = true
			;These functions will be aborted if AliasFollowing.GetActorReference() returns a None object
    		if AliasFollowing.GetActorReference().IsInFaction(OCR_PrivateCellFollowingFaction)
    			AliasFollowing_IsEmpty = false
    		endif
			;Fill the aliases
    		if AliasFollowing_IsEmpty == true
    			InvitedNPC.SetPlayerTeammate()
        		AliasFollowing.ForceRefTo(InvitedNPC)
        	Else
        		Debug.Notification("Someone else is already following you.")
        	endif
        endif
    else
        if AliasFollowing.GetActorReference() == InvitedNPC
            InvitedNPC.SetPlayerTeammate(false)
            AliasFollowing.Clear()
        endif
    endif
EndFunction