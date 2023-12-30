Scriptname OCR_PrivateCells_PlayerDialogue extends Quest  

Actor Property PlayerRef Auto
Keyword Property ArmorCuirass Auto
Keyword Property ClothingBody Auto
ObjectReference Property OCR_XMarker_Return  Auto
Spell Property OCR_SkinnyDippingEndSpell Auto
Spell Property OCR_SkinnyDippingSpell Auto
Idle Property OCR_FemaleUndressingGlovesAnimation  Auto
Idle Property OCR_FemaleUndressingTopAnimation  Auto
Idle Property OCR_FemaleUndressingHeadAnimation  Auto  
Idle Property OCR_FemaleUndressingFeetAnimation  Auto  
Idle Property OCR_FemaleUndressingBottomAnimation  Auto

function PlayerDialogue_EndVisit()
    playerref.MoveTo(OCR_XMarker_Return)
endfunction

Function AnimatedUndressSlot(Actor target, int slot, Idle anim, float duration, float undressTime = 1.5)
    target.PlayIdle(anim)
    Utility.Wait(undressTime)
    target.UnequipItemSlot(slot)
    Utility.Wait(duration - undressTime)
EndFunction

Function SmartUndressing(Actor target)
    MiscUtil.PrintConsole("Start smart undressing")

    float handsDuration = 4
    float headDuration = 3
    float feetDuration = 4.5
    float bottomDuration = 6
    float bodyDuration = 4

    ;hands
    If target.GetWornForm(0x00000008)
        MiscUtil.PrintConsole("Hands undressing.")
        AnimatedUndressSlot(target, 33, OCR_FemaleUndressingGlovesAnimation, handsDuration)
    EndIf

    ;head
    If target.GetWornForm(0x00000001)
        MiscUtil.PrintConsole("Head undressing.")
		AnimatedUndressSlot(target, 30, OCR_FemaleUndressingHeadAnimation, headDuration)
	EndIf

    ;feet
    If target.GetWornForm(0x00000080)
        MiscUtil.PrintConsole("Feet undressing.")
		AnimatedUndressSlot(target, 37, OCR_FemaleUndressingFeetAnimation, feetDuration, 3)
	EndIf

    ;bottom
    If target.GetWornForm(0x00000100)
        MiscUtil.PrintConsole("Bottom undressing.")
		AnimatedUndressSlot(target, 38, OCR_FemaleUndressingBottomAnimation, bottomDuration)
	EndIf

    ;top
    if target.GetWornForm(0x00000004)
        MiscUtil.PrintConsole("Top undressing")
        AnimatedUndressSlot(target, 32, OCR_FemaleUndressingTopAnimation, bodyDuration)
    endif

    Debug.SendAnimationEvent(target, "IdleForceDefaultState")
EndFunction

function SkinnyDipping(actor actor1)
    ;The animation is played as a dialogue idle animation
    ;Weapons
    form LeftHandItem = actor1.GetEquippedObject(0)
    form RightHandItem = actor1.GetEquippedObject(1)
    actor1.UnequipItem(LeftHandItem, false, true)
    actor1.UnequipItem(RightHandItem, false, true)
    ;Shield
    actor1.UnequipItemSlot(39)
    actor1.UnequipItemSlot(39)

    SmartUndressing(actor1)
    ;Undress main
        actor1.UnequipItemSlot(34)
        actor1.UnequipItemSlot(35)
        actor1.UnequipItemSlot(36)
        actor1.UnequipItemSlot(44)
        actor1.UnequipItemSlot(45)
        actor1.UnequipItemSlot(46)
        actor1.UnequipItemSlot(47)
        actor1.UnequipItemSlot(55)
        actor1.UnequipItemSlot(57)
        actor1.UnequipItemSlot(34)
        actor1.UnequipItemSlot(35)
        actor1.UnequipItemSlot(36)
        actor1.UnequipItemSlot(44)
        actor1.UnequipItemSlot(45)
        actor1.UnequipItemSlot(46)
        actor1.UnequipItemSlot(47)
        actor1.UnequipItemSlot(55)
        actor1.UnequipItemSlot(57)
    ;Change package
    OCR_SkinnyDippingSpell.Cast(PlayerRef, actor1)
    actor1.EvaluatePackage()
endfunction

function SkinnyDippingEnd(actor actor1)
    MiscUtil.PrintConsole("SkinnyDippingEnd")
    actor1.DispelSpell(OCR_SkinnyDippingSpell)
    OCR_SkinnyDippingEndSpell.Cast(PlayerRef, actor1)
    actor1.EvaluatePackage()
endfunction
