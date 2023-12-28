Scriptname OCR_UndressInWater extends ObjectReference  

Actor Property PlayerRef Auto
Armor Property OCR_InvisibleEquipment_Armor  Auto
Keyword Property ArmorCuirass Auto
Keyword Property ClothingBody Auto

function OnTriggerEnter(ObjectReference akActivator)
    actor actor1 = akActivator as Actor
    if actor1 != PlayerRef ;Only works for NPCs
        ;Check if there is worn Cuirass or Clothing on Body
        if actor1.WornHasKeyword(ArmorCuirass) == 1 || actor1.WornHasKeyword(ClothingBody) == 1
            ;Two function calls are required to undress reliably. Because several function calls are involved, the most important slots are removed first.
            UnequipMain(actor1)
            UnequipMain(actor1)
            UnequipWeapons(actor1)
            UnequipMisc(actor1)
            UnequipMisc(actor1)
        endif
    endif
endfunction

function OnTriggerLeave(ObjectReference akActivator)
    actor actor1 = akActivator as Actor
    if actor1 != PlayerRef ;Only works for NPCs
        ;Adding and removing equipment forces the equipped items to update
        actor1.AddItem(OCR_InvisibleEquipment_Armor as form, 1, false)
        actor1.RemoveItem(OCR_InvisibleEquipment_Armor as form, 1, false, none)
    endif
endFunction

function UnequipMain(actor actor1)
	actor1.UnequipItemSlot(30)
	actor1.UnequipItemSlot(32)
	actor1.UnequipItemSlot(33)
	actor1.UnequipItemSlot(37)
	actor1.UnequipItemSlot(39)
endfunction

function UnequipMisc(actor actor1)
	actor1.UnequipItemSlot(34)
	actor1.UnequipItemSlot(35)
	actor1.UnequipItemSlot(36)
	actor1.UnequipItemSlot(44)
	actor1.UnequipItemSlot(45)
	actor1.UnequipItemSlot(46)
	actor1.UnequipItemSlot(47)
	actor1.UnequipItemSlot(55)
	actor1.UnequipItemSlot(57)
endfunction

function UnequipWeapons(actor actor1)
	form LeftHandItem = actor1.GetEquippedObject(0)
	form RightHandItem = actor1.GetEquippedObject(1)
	actor1.UnequipItem(LeftHandItem, false, true)
	actor1.UnequipItem(RightHandItem, false, true)
endfunction