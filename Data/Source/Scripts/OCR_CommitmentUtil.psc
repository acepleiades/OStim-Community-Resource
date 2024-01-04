Scriptname OCR_CommitmentUtil extends Quest  

Actor Property PlayerRef Auto
Class Property Citizen  Auto
Class Property GuardOrc1H  Auto
Class Property GuardOrc2H Auto
Class Property SoldierImperialNotGuard  Auto
Class Property SoldierSonsSkyrimNotGuard  Auto
Faction Property FavorJobsBeggarsFaction Auto
Faction Property FavorJobsDrunksFaction Auto
Faction Property JobAnimalTrainerFaction Auto
Faction Property JobApothecaryFaction Auto
Faction Property JobBardFaction Auto
Faction Property JobBlacksmithFaction Auto
Faction Property JobCarriageFaction Auto
Faction Property JobCourtWizardFaction Auto
Faction Property JobFarmerFaction Auto
Faction Property JobFenceFaction Auto
Faction Property JobFletcherFaction Auto
Faction Property JobGuardCaptainFaction Auto
Faction Property JobHostlerFaction Auto
Faction Property JobHousecarlFaction Auto
Faction Property JobInnServer Auto
Faction Property JobInnkeeperFaction Auto
Faction Property JobJarlFaction Auto
Faction Property JobJewelerFaction Auto
Faction Property JobJusticiar Auto
Faction Property JobLumberjackFaction Auto
Faction Property JobMerchantFaction Auto
Faction Property JobMinerFaction Auto
Faction Property JobMiscFaction Auto
Faction Property JobOrcChiefFaction Auto
Faction Property JobPriestFaction Auto
Faction Property JobRentRoomFaction Auto
Faction Property JobStewardFaction Auto
Faction Property OCR_Lover_AcceptsMultiplePartnersFaction Auto
Faction Property OCR_Lover_Commitment  Auto
Faction Property OCR_SocialClass_CitizenLow Auto
Faction Property OCR_SocialClass_CitizenLowest Auto
Faction Property OCR_SocialClass_CitizenMiddle Auto
Faction Property OCR_SocialClass_CitizenNoble Auto
Faction Property OCR_SocialClass_Other Auto
Faction Property OCR_SocialClass_SoldierOrGuard Auto
GlobalVariable Property OCR_Commitment_PlayerIsInExclusiveRelationship  Auto
Keyword Property OCR_AliasIsFilled  Auto
Quest Property OCR_Commitment_PlayerIsInExclusiveRelationshipQST Auto
Race Property OrcRace Auto
Race Property OrcRaceVampire Auto
ReferenceAlias Property ExclusiveRelationshipSubjectAlias  Auto

function GetCommitment(actor actor1)
    int actor1Commitment = CalculateNPCCommitment(actor1)
    actor1.SetFactionRank(OCR_Lover_Commitment, actor1Commitment)
    MiscUtil.PrintConsole("GetCommitment: NPC commitment is " + actor1Commitment)
endFunction

int function CalculateNPCCommitment(actor actor1)
    ; Check if already has a commitment level
    if actor1.IsInFaction(OCR_Lover_Commitment)
        return actor1.GetFactionRank(OCR_Lover_Commitment)
    endif

    ; Consider NPC morality.
    int MoralityFactor = 0
    Float actor1Morality = actor1.GetAV("Morality")
    if actor1Morality == 0
        MoralityFactor = 0
    elseif actor1Morality == 1 || actor1Morality == 2
        MoralityFactor = 1
    else ; Morality > 2
        MoralityFactor = 2
    endif

    ; Bump up or down according to social class.
    int SocialClassAdjustment = MoralityFactor
    AssignSocialClass(actor1)
    if actor1.IsInFaction(OCR_SocialClass_Other) || actor1.IsInFaction(OCR_SocialClass_CitizenLowest)
        SocialClassAdjustment -= 1
    elseif actor1.IsInFaction(OCR_SocialClass_CitizenNoble) && MoralityFactor != 2
        SocialClassAdjustment += 1
    endif

    ; Female orcs get one bump down.
    Race actor1Race = actor1.GetRace()
    if (actor1Race == OrcRace || actor1Race == OrcRaceVampire) && (actor1.GetBaseObject() as ActorBase).GetSex() == 1
        SocialClassAdjustment -= 1
        MiscUtil.PrintConsole("CalculateNPCCommitment: NPC is a female Orc.")
    endif

    ; Ensure the returned value is not negative
    if SocialClassAdjustment < 0
        SocialClassAdjustment = 0
    endif

    if SocialClassAdjustment == 0
    	actor1.AddToFaction(OCR_Lover_AcceptsMultiplePartnersFaction)
    	MiscUtil.PrintConsole("CalculateNPCCommitment: NPC commitment is 0. Ensured he or she is in the faction OCR_Lover_AcceptsMultiplePartnersFaction.")
    endif

    return SocialClassAdjustment
endFunction

function AssignSocialClass(actor actor1)
    ; Check if the NPC is already in an OCR Social Class faction
    if actor1.IsInFaction(OCR_SocialClass_Other)
        MiscUtil.PrintConsole("AssignSocialClass: NPC social class is OCR_SocialClass_Other")
    elseif actor1.IsInFaction(OCR_SocialClass_CitizenNoble)
        MiscUtil.PrintConsole("AssignSocialClass: NPC social class is OCR_SocialClass_CitizenNoble")
    elseif actor1.IsInFaction(OCR_SocialClass_SoldierOrGuard)
        MiscUtil.PrintConsole("AssignSocialClass: NPC social class is OCR_SocialClass_SoldierOrGuard")
    elseif actor1.IsInFaction(OCR_SocialClass_CitizenMiddle)
        MiscUtil.PrintConsole("AssignSocialClass: NPC social class is OCR_SocialClass_CitizenMiddle")
    elseif actor1.IsInFaction(OCR_SocialClass_CitizenLow)
        MiscUtil.PrintConsole("AssignSocialClass: NPC social class is OCR_SocialClass_CitizenLow")
    elseif actor1.IsInFaction(OCR_SocialClass_CitizenLowest)
        MiscUtil.PrintConsole("AssignSocialClass: NPC social class is OCR_SocialClass_CitizenLowest")
    else
        ; Assign NPC to the correct social class faction
        MiscUtil.PrintConsole("AssignSocialClass: NPC does not have an OCR social class. Assigning...")
    	ActorBase actor1Base = actor1.GetBaseObject() as ActorBase
    	Class actor1Class = actor1Base.GetClass()
        if (actor1.GetFactionRank(FavorJobsBeggarsFaction) >= -1) || (actor1.GetFactionRank(FavorJobsDrunksFaction) >= -1) || (actor1.GetFactionRank(JobLumberjackFaction) >= -1) || (actor1.GetFactionRank(JobMinerFaction) >= -1)
            actor1.AddToFaction(OCR_SocialClass_CitizenLowest)
            MiscUtil.PrintConsole("AssignSocialClass: Assigned social class OCR_SocialClass_CitizenLowest")
        elseif (actor1.GetFactionRank(JobJarlFaction) >= -1) || (actor1.GetFactionRank(JobJusticiar) >= -1) || (actor1.GetFactionRank(JobOrcChiefFaction) >= -1) || (actor1.GetFactionRank(JobHousecarlFaction) >= -1) || (actor1.GetFactionRank(JobStewardFaction) >= -1)
            actor1.AddToFaction(OCR_SocialClass_CitizenNoble)
            MiscUtil.PrintConsole("AssignSocialClass: Assigned social class OCR_SocialClass_CitizenNoble")
        elseif (actor1.GetFactionRank(JobFarmerFaction) >= -1) || (actor1.GetFactionRank(JobAnimalTrainerFaction) >= -1) || (actor1.GetFactionRank(JobFletcherFaction) >= -1) || (actor1.GetFactionRank(JobInnServer) >= -1) || (actor1.GetFactionRank(JobHostlerFaction) >= -1) || (actor1.GetFactionRank(JobRentRoomFaction) >= -1)
            actor1.AddToFaction(OCR_SocialClass_CitizenLow)
            MiscUtil.PrintConsole("AssignSocialClass: Assigned social class OCR_SocialClass_CitizenLow")
        elseif  actor1Class == GuardOrc1H || actor1Class == GuardOrc2H || actor1Class == SoldierImperialNotGuard || actor1Class == SoldierSonsSkyrimNotGuard
            actor1.AddToFaction(OCR_SocialClass_SoldierOrGuard)
            MiscUtil.PrintConsole("AssignSocialClass: Assigned social class OCR_SocialClass_SoldierOrGuard")
        elseif actor1Class == Citizen || (actor1.GetFactionRank(JobApothecaryFaction) >= -1) || (actor1.GetFactionRank(JobBardFaction) >= -1) || (actor1.GetFactionRank(JobBlacksmithFaction) >= -1) || (actor1.GetFactionRank(JobCarriageFaction) >= -1) || (actor1.GetFactionRank(JobCourtWizardFaction) >= -1) || (actor1.GetFactionRank(JobFenceFaction) >= -1) || (actor1.GetFactionRank(JobInnkeeperFaction) >= -1) || (actor1.GetFactionRank(JobJewelerFaction) >= -1) || (actor1.GetFactionRank(JobMerchantFaction) >= -1) || (actor1.GetFactionRank(JobMiscFaction) >= -1) || (actor1.GetFactionRank(JobPriestFaction) >= -1) || (actor1.GetFactionRank(JobGuardCaptainFaction) >= -1)
            actor1.AddToFaction(OCR_SocialClass_CitizenMiddle)
            MiscUtil.PrintConsole("AssignSocialClass: Assigned social class OCR_SocialClass_CitizenMiddle")
        else
            ; Default threshold if the NPC does not meet any condition
            actor1.AddToFaction(OCR_SocialClass_Other)
            MiscUtil.PrintConsole("AssignSocialClass: NPC has not matched any conditions. Assigned social class OCR_SocialClass_Other")
        endif
    endif
endFunction

function UpdateGlobalVariable_PlayerIsInExclusiveRelationship()
    ;This function updates the global variable OCR_Commitment_PlayerIsInExclusiveRelationship. It is checked in the romance progression of some characters.
    OCR_Commitment_PlayerIsInExclusiveRelationshipQST.Start() ;Fills alias if it exists
    bool PlayerIsInExclusiveRelationship
    if ExclusiveRelationshipSubjectAlias.GetActorReference().HasKeyword(OCR_AliasIsFilled) ;This function is aborted on purpose if the alias was not filled
        PlayerIsInExclusiveRelationship = true
    endif
    if PlayerIsInExclusiveRelationship == true
        OCR_Commitment_PlayerIsInExclusiveRelationship.SetValue(1)
        MiscUtil.PrintConsole("UpdateGlobalVariable_PlayerIsInExclusiveRelationship: Detection is that player is in an exclusive relationship.")
    else
        OCR_Commitment_PlayerIsInExclusiveRelationship.SetValue(0)
        MiscUtil.PrintConsole("UpdateGlobalVariable_PlayerIsInExclusiveRelationship: Detection is that player is not in an exclusive relationship.")
    endif
    OCR_Commitment_PlayerIsInExclusiveRelationshipQST.Stop()
endfunction