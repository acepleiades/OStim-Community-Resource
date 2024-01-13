Scriptname OCR_PrivateCellsUtil extends Quest  

Actor Property PlayerRef Auto
Armor Property OCR_InvisibleEquipment_Armor  Auto
Faction Property OCR_Lover_AcceptsMultiplePartnersFaction Auto
Message Property OCR_GoToPrivateCell_FollowersMSG  Auto
Message Property OCR_GoToPrivateCell_LoversMSG  Auto
MiscObject Property Gold001  Auto
ObjectReference Property OCR_XMarker_NPC_Camp  Auto
ObjectReference Property OCR_XMarker_NPC_Inn  Auto
ObjectReference Property OCR_XMarker_Player_Camp  Auto
ObjectReference Property OCR_XMarker_Player_Inn  Auto
ObjectReference Property OCR_XMarker_Return  Auto
Quest Property OCR_PrivateCells_EndVisit  Auto
Quest Property OCR_PrivateCells_FollowerAliases  Auto
Quest Property OCR_PrivateCells_LoverAliases  Auto
Quest Property OCR_PrivateCells_PlayerDialogueQST  Auto
ReferenceAlias Property AliasFollower0  Auto
ReferenceAlias Property AliasFollower1  Auto
ReferenceAlias Property AliasFollower2  Auto
ReferenceAlias Property AliasFollower3  Auto
ReferenceAlias Property AliasFollower4  Auto
ReferenceAlias Property AliasFollower5  Auto
ReferenceAlias Property AliasFollower6  Auto
ReferenceAlias Property AliasFollower7  Auto
ReferenceAlias Property AliasFollower8  Auto
ReferenceAlias Property AliasFollower9  Auto
ReferenceAlias Property AliasLover0  Auto
ReferenceAlias Property AliasLover1  Auto
ReferenceAlias Property AliasLover2  Auto
ReferenceAlias Property AliasLover3  Auto
ReferenceAlias Property AliasLover4  Auto
ReferenceAlias Property AliasLover5  Auto
ReferenceAlias Property AliasLover6  Auto
ReferenceAlias Property AliasLover7  Auto
ReferenceAlias Property AliasLover8  Auto
ReferenceAlias Property AliasLover9  Auto
ReferenceAlias Property InvitedNPC  Auto

function FollowerCamping(actor actor1)
	;Starts the necessary quests
    OCR_PrivateCells_FollowerAliases.Start()
    OCR_PrivateCells_LoverAliases.Start()
    OCR_PrivateCells_PlayerDialogueQST.Start()
    ;Adds NPC into the necessary alias
    InvitedNPC.ForceRefTo(actor1)
    ;Move the return marker to the player
    OCR_XMarker_Return.MoveTo(playerref)
    ;Taking other followers along
    AliasFollower0.GetActorReference().MoveTo(OCR_XMarker_NPC_Camp)
    AliasFollower1.GetActorReference().MoveTo(OCR_XMarker_NPC_Camp)
    AliasFollower2.GetActorReference().MoveTo(OCR_XMarker_NPC_Camp)
    AliasFollower3.GetActorReference().MoveTo(OCR_XMarker_NPC_Camp)
    AliasFollower4.GetActorReference().MoveTo(OCR_XMarker_NPC_Camp)
    AliasFollower5.GetActorReference().MoveTo(OCR_XMarker_NPC_Camp)
    AliasFollower6.GetActorReference().MoveTo(OCR_XMarker_NPC_Camp)
    AliasFollower7.GetActorReference().MoveTo(OCR_XMarker_NPC_Camp)
    AliasFollower8.GetActorReference().MoveTo(OCR_XMarker_NPC_Camp)
    AliasFollower9.GetActorReference().MoveTo(OCR_XMarker_NPC_Camp)
    ;Move invited NPC and player into the cell
    actor1.MoveTo(OCR_XMarker_NPC_Camp)
    playerref.MoveTo(OCR_XMarker_Player_Camp)
endfunction

function GoToPrivateCell_Camp(actor actor1)
	;Starts the necessary quests
    OCR_PrivateCells_FollowerAliases.Start()
    OCR_PrivateCells_LoverAliases.Start()
    OCR_PrivateCells_PlayerDialogueQST.Start()
    ;Adds NPC into the necessary alias
    InvitedNPC.ForceRefTo(actor1)
    ;Move the return marker to the player
    OCR_XMarker_Return.MoveTo(playerref)
    ;Inviting followers functionality
    bool NPCAcceptsMultiplePartners = actor1.IsInFaction(OCR_Lover_AcceptsMultiplePartnersFaction)
    int iChoice0 = OCR_GoToPrivateCell_FollowersMSG.Show()
    if NPCAcceptsMultiplePartners
    	if iChoice0 == 0 ;"Yes"
    	    ;Take followers with you.
    	    AliasFollower0.GetActorReference().MoveTo(OCR_XMarker_NPC_Camp)
    	    AliasFollower1.GetActorReference().MoveTo(OCR_XMarker_NPC_Camp)
    	    AliasFollower2.GetActorReference().MoveTo(OCR_XMarker_NPC_Camp)
    	    AliasFollower3.GetActorReference().MoveTo(OCR_XMarker_NPC_Camp)
    	    AliasFollower4.GetActorReference().MoveTo(OCR_XMarker_NPC_Camp)
    	    AliasFollower5.GetActorReference().MoveTo(OCR_XMarker_NPC_Camp)
    	    AliasFollower6.GetActorReference().MoveTo(OCR_XMarker_NPC_Camp)
    	    AliasFollower7.GetActorReference().MoveTo(OCR_XMarker_NPC_Camp)
    	    AliasFollower8.GetActorReference().MoveTo(OCR_XMarker_NPC_Camp)
    	    AliasFollower9.GetActorReference().MoveTo(OCR_XMarker_NPC_Camp)
    	endif
    endif
    ;Inviting additional lovers functionality. Checks if the invited NPC accepts multiple partners.
    if NPCAcceptsMultiplePartners
    	int iChoice1 = OCR_GoToPrivateCell_LoversMSG.Show()
    	if iChoice1 == 0 ;"Yes"
    	    ;Take additional lovers with you.
    	    AliasLover0.GetActorReference().MoveTo(OCR_XMarker_NPC_Camp)
    	    AliasLover1.GetActorReference().MoveTo(OCR_XMarker_NPC_Camp)
    	    AliasLover2.GetActorReference().MoveTo(OCR_XMarker_NPC_Camp)
    	    AliasLover3.GetActorReference().MoveTo(OCR_XMarker_NPC_Camp)
    	    AliasLover4.GetActorReference().MoveTo(OCR_XMarker_NPC_Camp)
    	    AliasLover5.GetActorReference().MoveTo(OCR_XMarker_NPC_Camp)
    	    AliasLover6.GetActorReference().MoveTo(OCR_XMarker_NPC_Camp)
    	    AliasLover7.GetActorReference().MoveTo(OCR_XMarker_NPC_Camp)
    	    AliasLover8.GetActorReference().MoveTo(OCR_XMarker_NPC_Camp)
    	    AliasLover9.GetActorReference().MoveTo(OCR_XMarker_NPC_Camp)
    	endif
    endif
    ;Move invited NPC and player into the cell
    actor1.MoveTo(OCR_XMarker_NPC_Camp)
    playerref.MoveTo(OCR_XMarker_Player_Camp)
endfunction

function GoToPrivateCell_Inn(actor actor1)
	;Starts the necessary quests
    OCR_PrivateCells_FollowerAliases.Start()
    OCR_PrivateCells_LoverAliases.Start()
    OCR_PrivateCells_PlayerDialogueQST.Start()
    ;Adds NPC into the necessary alias
    InvitedNPC.ForceRefTo(actor1)
	;Take gold away from player
	PlayerRef.RemoveItem(Gold001, 50)
    ;Move the return marker to the player
    OCR_XMarker_Return.MoveTo(playerref)
    ;Inviting followers functionality
    bool NPCAcceptsMultiplePartners = actor1.IsInFaction(OCR_Lover_AcceptsMultiplePartnersFaction)
    int iChoice0 = OCR_GoToPrivateCell_FollowersMSG.Show()
    if NPCAcceptsMultiplePartners
    	if iChoice0 == 0 ;"Yes"
        	;Take followers with you. For the inn visit it's up to 3.
        	AliasFollower0.GetActorReference().MoveTo(OCR_XMarker_NPC_Inn)
        	AliasFollower1.GetActorReference().MoveTo(OCR_XMarker_NPC_Inn)
        	AliasFollower2.GetActorReference().MoveTo(OCR_XMarker_NPC_Inn)
    	endif
	endif
    ;Inviting additional lovers functionality. Checks if the invited NPC accepts multiple partners.
    if actor1.IsInFaction(OCR_Lover_AcceptsMultiplePartnersFaction)
    	int iChoice1 = OCR_GoToPrivateCell_LoversMSG.Show()
    	if iChoice1 == 0 ;"Yes"
    	    ;Take additional lovers with you. For the inn visit it's up to 3.
    	    AliasLover0.GetActorReference().MoveTo(OCR_XMarker_NPC_Inn)
    	    AliasLover1.GetActorReference().MoveTo(OCR_XMarker_NPC_Inn)
    	    AliasLover2.GetActorReference().MoveTo(OCR_XMarker_NPC_Inn)
    	endif
    endif
    ;Move invited NPC and player into the cell
    actor1.MoveTo(OCR_XMarker_NPC_Inn)
    playerref.MoveTo(OCR_XMarker_Player_Inn)
endfunction

function EndVisit()
	;Stops and resets whatever is needed
	OCR_PrivateCells_EndVisit.Stop()
	OCR_PrivateCells_PlayerDialogueQST.Stop()
	actor InvitedActor = InvitedNPC.GetActorReference()
	EndVisitActorProcedures(InvitedActor)
	;0
	actor Follower0 = AliasFollower0.GetActorReference()
	actor Lover0 = AliasFollower0.GetActorReference()
	EndVisitActorProcedures(Follower0)
	EndVisitActorProcedures(Lover0)
	;1
	actor Follower1 = AliasFollower1.GetActorReference()
	actor Lover1 = AliasFollower1.GetActorReference()
	EndVisitActorProcedures(Follower1)
	EndVisitActorProcedures(Lover1)
	;2
	actor Follower2 = AliasFollower2.GetActorReference()
	actor Lover2 = AliasFollower2.GetActorReference()
	EndVisitActorProcedures(Follower2)
	EndVisitActorProcedures(Lover2)
	;3
	actor Follower3 = AliasFollower3.GetActorReference()
	actor Lover3 = AliasFollower3.GetActorReference()
	EndVisitActorProcedures(Follower3)
	EndVisitActorProcedures(Lover3)
	;4
	actor Follower4 = AliasFollower4.GetActorReference()
	actor Lover4 = AliasFollower4.GetActorReference()
	EndVisitActorProcedures(Follower4)
	EndVisitActorProcedures(Lover4)
	;5
	actor Follower5 = AliasFollower5.GetActorReference()
	actor Lover5 = AliasFollower5.GetActorReference()
	EndVisitActorProcedures(Follower5)
	EndVisitActorProcedures(Lover5)
	;6
	actor Follower6 = AliasFollower0.GetActorReference()
	actor Lover6 = AliasFollower0.GetActorReference()
	EndVisitActorProcedures(Follower6)
	EndVisitActorProcedures(Lover6)
	;7
	actor Follower7 = AliasFollower0.GetActorReference()
	actor Lover7 = AliasFollower0.GetActorReference()
	EndVisitActorProcedures(Follower7)
	EndVisitActorProcedures(Lover7)
	;8
	actor Follower8 = AliasFollower0.GetActorReference()
	actor Lover8 = AliasFollower0.GetActorReference()
	EndVisitActorProcedures(Follower8)
	EndVisitActorProcedures(Lover8)
	;9
	actor Follower9 = AliasFollower0.GetActorReference()
	actor Lover9 = AliasFollower0.GetActorReference()
	EndVisitActorProcedures(Follower9)
	EndVisitActorProcedures(Lover9)
	;Reset
	OCR_XMarker_Return.MoveToMyEditorLocation()
	OCR_PrivateCells_FollowerAliases.Stop()
	OCR_PrivateCells_LoverAliases.Stop()
endfunction

function EndVisitActorProcedures(actor actor1)
    actor1.AddItem(OCR_InvisibleEquipment_Armor as form, 1, false)
    actor1.RemoveItem(OCR_InvisibleEquipment_Armor as form, 1, false, none)
	actor1.MoveTo(OCR_XMarker_Return)
endfunction