;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_OCR_OStimScenesUtil_Resto_050F86C1 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE OCR_RestoreAddActorsAtStart
Quest __temp = self as Quest
OCR_RestoreAddActorsAtStart kmyQuest = __temp as OCR_RestoreAddActorsAtStart
;END AUTOCAST
;BEGIN CODE
Debug.Notification("Started quest OCR_OStimScenesUtil_RestoreAddActorsAtStart")
kmyquest.Restore()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
