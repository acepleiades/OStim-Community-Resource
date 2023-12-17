Scriptname OCR_OStimSequencesUtil extends Quest  

Actor Property PlayerRef Auto
OCR_OStimUtil Property Util Auto

;__________________________________________________________
; Functions for the player character performing actions  
;__________________________________________________________
; Helper function to get the sequence based on player's sex and action type

string Function GetSequence(string actionType)
    ActorBase PlayerBase = Game.GetPlayer().GetActorBase()
    if (PlayerBase.GetSex() == 0)
        return "OCR_MF_" + actionType
    else
        return "OCR_FM_" + actionType
    endIf
EndFunction

bool Function CaressCheekStroke(actor actor1)
    Actor[] actors = OActorUtil.ToArray(PlayerRef, actor1)
    string mySequence = GetSequence("CaressCheekStroke")
    Util.StartOstimSequence(actors, mySequence, true)
    return true
EndFunction

bool Function CaressFail(actor actor1)
    Actor[] actors = OActorUtil.ToArray(PlayerRef, actor1)
    string mySequence = GetSequence("CaressFail")
    Util.StartOstimSequence(actors, mySequence, true)
    return true
EndFunction

bool Function CaressHoldHands(actor actor1)
    Actor[] actors = OActorUtil.ToArray(PlayerRef, actor1)
    string mySequence = GetSequence("CaressHoldHands")
    Util.StartOstimSequence(actors, mySequence, true)
    return true
EndFunction

bool Function CaressHug(actor actor1)
    Actor[] actors = OActorUtil.ToArray(PlayerRef, actor1)
    string mySequence = GetSequence("CaressHug")
    Util.StartOstimSequence(actors, mySequence, true)
    return true
EndFunction

bool Function Chatter(actor actor1)
    Actor[] actors = OActorUtil.ToArray(PlayerRef, actor1)
    string mySequence = GetSequence("Chatter")
    Util.StartOstimSequence(actors, mySequence, true)
    return true
EndFunction

bool Function ChatterFail(actor actor1)
    Actor[] actors = OActorUtil.ToArray(PlayerRef, actor1)
    string mySequence = GetSequence("ChatterFail")
    Util.StartOstimSequence(actors, mySequence, true)
    return true
EndFunction

bool Function Court(actor actor1)
    Actor[] actors = OActorUtil.ToArray(PlayerRef, actor1)
    string mySequence = GetSequence("Court")
    Util.StartOstimSequence(actors, mySequence, true)
    return true
EndFunction

bool Function CourtFail(actor actor1)
    Actor[] actors = OActorUtil.ToArray(PlayerRef, actor1)
    string mySequence = GetSequence("CourtFail")
    Util.StartOstimSequence(actors, mySequence, true)
    return true
EndFunction

bool Function Kiss1(actor actor1)
    Actor[] actors = OActorUtil.ToArray(PlayerRef, actor1)
    string mySequence = GetSequence("Kiss1")
    Util.StartOstimSequence(actors, mySequence, true)
    return true
EndFunction

bool Function StandingConversationLoop(actor actor1)
    Actor[] actors = OActorUtil.ToArray(PlayerRef, actor1)
    string mySequence = GetSequence("StandingConversationLoop")
    Util.StartOstimSequence(actors, mySequence, true)
    return true
EndFunction