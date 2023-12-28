Scriptname OCR_PrivateCells_PlayerDialogue extends Quest  

Actor Property PlayerRef Auto
Keyword Property ArmorCuirass Auto
Keyword Property ClothingBody Auto
ObjectReference Property OCR_XMarker_Return  Auto
Spell Property OCR_SkinnyDippingEndSpell Auto
Spell Property OCR_SkinnyDippingSpell Auto

function PlayerDialogue_EndVisit()
    playerref.MoveTo(OCR_XMarker_Return)
endfunction

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
    ;Undress main
    if actor1.WornHasKeyword(ArmorCuirass) == 1 || actor1.WornHasKeyword(ClothingBody) == 1
        Utility.Wait(1.6)
        actor1.UnequipItemSlot(30)
        actor1.UnequipItemSlot(32)
        actor1.UnequipItemSlot(33)
        actor1.UnequipItemSlot(37)
        actor1.UnequipItemSlot(39)
        actor1.UnequipItemSlot(30)
        actor1.UnequipItemSlot(32)
        actor1.UnequipItemSlot(33)
        actor1.UnequipItemSlot(37)
        actor1.UnequipItemSlot(39)
        ;Undress else
        Utility.Wait(3.9)
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
    endif
    ;Change package
    OCR_SkinnyDippingSpell.Cast(PlayerRef, actor1)
    actor1.EvaluatePackage()
endfunction

function SkinnyDippingEnd(actor actor1)
    actor1.DispelSpell(OCR_SkinnyDippingSpell)
    OCR_SkinnyDippingEndSpell.Cast(PlayerRef, actor1)
    actor1.EvaluatePackage()
endfunction