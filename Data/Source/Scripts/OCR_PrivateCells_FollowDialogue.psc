Scriptname OCR_PrivateCells_FollowDialogue extends Quest  

Faction Property OCR_PrivateCellFollowingFaction Auto
ReferenceAlias Property AliasFollowing0  Auto
ReferenceAlias Property AliasFollowing1  Auto
ReferenceAlias Property AliasFollowing2  Auto
ReferenceAlias Property AliasFollowing3  Auto
ReferenceAlias Property AliasFollowing4  Auto

Function PrivateCell_SetFollower(actor InvitedNPC, bool setFollower)
    if setFollower
    	if InvitedNPC.IsPlayerTeammate()
            Debug.Notification("This person is already following you.")
        else
    		bool AliasFollowing0_IsEmpty = true
    		bool AliasFollowing1_IsEmpty = true
    		bool AliasFollowing2_IsEmpty = true
    		bool AliasFollowing3_IsEmpty = true
    		bool AliasFollowing4_IsEmpty = true
			;These functions will be aborted if AliasFollowing0.GetActorReference() returns a None object
    		if AliasFollowing0.GetActorReference().IsInFaction(OCR_PrivateCellFollowingFaction)
    			AliasFollowing0_IsEmpty = false
    		endif
    		if AliasFollowing1.GetActorReference().IsInFaction(OCR_PrivateCellFollowingFaction)
    			AliasFollowing1_IsEmpty = false
    		endif
    		if AliasFollowing2.GetActorReference().IsInFaction(OCR_PrivateCellFollowingFaction)
    			AliasFollowing2_IsEmpty = false
    		endif
    		if AliasFollowing3.GetActorReference().IsInFaction(OCR_PrivateCellFollowingFaction)
    			AliasFollowing3_IsEmpty = false
    		endif
    		if AliasFollowing4.GetActorReference().IsInFaction(OCR_PrivateCellFollowingFaction)
    			AliasFollowing4_IsEmpty = false
    		endif
			;Fill the aliases
    		if AliasFollowing0_IsEmpty == true
    			InvitedNPC.SetPlayerTeammate()
        		AliasFollowing0.ForceRefTo(InvitedNPC)
        	endif
    		if AliasFollowing1_IsEmpty == true
    			InvitedNPC.SetPlayerTeammate()
        		AliasFollowing1.ForceRefTo(InvitedNPC)
        	endif
    		if AliasFollowing2_IsEmpty == true
    			InvitedNPC.SetPlayerTeammate()
        		AliasFollowing2.ForceRefTo(InvitedNPC)
        	endif
    		if AliasFollowing3_IsEmpty == true
    			InvitedNPC.SetPlayerTeammate()
        		AliasFollowing3.ForceRefTo(InvitedNPC)
        	endif
    		if AliasFollowing4_IsEmpty == true
    			InvitedNPC.SetPlayerTeammate()
        		AliasFollowing4.ForceRefTo(InvitedNPC)
        	endif
        endif
    else
        if AliasFollowing0.GetActorReference() == InvitedNPC
            InvitedNPC.SetPlayerTeammate(false)
            AliasFollowing0.Clear()
        ElseIf AliasFollowing1.GetActorReference() == InvitedNPC
            InvitedNPC.SetPlayerTeammate(false)
            AliasFollowing1.Clear()
        ElseIf AliasFollowing2.GetActorReference() == InvitedNPC
            InvitedNPC.SetPlayerTeammate(false)
            AliasFollowing2.Clear()
        ElseIf AliasFollowing3.GetActorReference() == InvitedNPC
            InvitedNPC.SetPlayerTeammate(false)
            AliasFollowing3.Clear()
        ElseIf AliasFollowing4.GetActorReference() == InvitedNPC
            InvitedNPC.SetPlayerTeammate(false)
            AliasFollowing4.Clear()
        endif
    endif
EndFunction