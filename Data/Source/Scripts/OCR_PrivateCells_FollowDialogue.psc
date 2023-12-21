Scriptname OCR_PrivateCells_FollowDialogue extends Quest  

Quest Property OCR_PrivateCells_PlayerDialogueQST Auto
ReferenceAlias Property AliasFollowing0  Auto
ReferenceAlias Property AliasFollowing1  Auto
ReferenceAlias Property AliasFollowing2  Auto
ReferenceAlias Property AliasFollowing3  Auto
ReferenceAlias Property AliasFollowing4  Auto

Function PrivateCell_SetFollower(actor actor1, bool setFollower)
    if setFollower
        if actor1.IsPlayerTeammate()
            Debug.Notification("This character is already following you.")
        elseif AliasFollowing0.GetActorReference() != actor1 && AliasFollowing1.GetActorReference() != actor1 && AliasFollowing2.GetActorReference() != actor1 && AliasFollowing3.GetActorReference() != actor1 && AliasFollowing4.GetActorReference() != actor1
            actor1.SetPlayerTeammate(true)
            AliasFollowing0.ForceRefIfEmpty(actor1)
            AliasFollowing1.ForceRefIfEmpty(actor1)
            AliasFollowing2.ForceRefIfEmpty(actor1)
            AliasFollowing3.ForceRefIfEmpty(actor1)
            AliasFollowing4.ForceRefIfEmpty(actor1)
        Else
            Debug.Notification("This character is already following you.")
        endif
    else
        if AliasFollowing0.GetActorReference() == actor1
            actor1.SetPlayerTeammate(false)
            AliasFollowing0.Clear()
        ElseIf AliasFollowing1.GetActorReference() == actor1
            actor1.SetPlayerTeammate(false)
            AliasFollowing1.Clear()
        ElseIf AliasFollowing2.GetActorReference() == actor1
            actor1.SetPlayerTeammate(false)
            AliasFollowing2.Clear()
        ElseIf AliasFollowing3.GetActorReference() == actor1
            actor1.SetPlayerTeammate(false)
            AliasFollowing3.Clear()
        ElseIf AliasFollowing4.GetActorReference() == actor1
            actor1.SetPlayerTeammate(false)
            AliasFollowing4.Clear()
        endif
    endif
EndFunction