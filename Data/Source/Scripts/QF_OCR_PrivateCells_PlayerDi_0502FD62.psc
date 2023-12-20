;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_OCR_PrivateCells_PlayerDi_0502FD62 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Debug.Trace("OCR_PrivateCells_EndVisit started. Attempting to end visit.")
Debug.Notification("OCR_PrivateCells_EndVisit started. Attempting to end visit.")
Util.EndVisit()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

OCR_PrivateCellsUtil Property Util Auto
