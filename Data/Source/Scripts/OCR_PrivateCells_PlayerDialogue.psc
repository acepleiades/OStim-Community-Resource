Scriptname OCR_PrivateCells_PlayerDialogue extends Quest  

Actor Property PlayerRef Auto
OCR_PrivateCellsUtil Property Util Auto
ObjectReference Property OCR_XMarker_Return  Auto

function PlayerDialogue_EndVisit()
    playerref.MoveTo(OCR_XMarker_Return)
    Util.EndVisit()
endfunction