Scriptname OCR_GlobalFunctions extends Quest  

function AdvanceTimeByHours(float hoursToSkip, GlobalVariable kGameHour, GlobalVariable kGameDay, GlobalVariable kGameDaysPassed, GlobalVariable kGameMonth, GlobalVariable kGameYear) global
    ; Load current time variables
    float currentHour = kGameHour.GetValue()
    float currentDay = kGameDay.GetValue()
    float currentMonth = kGameMonth.GetValue()
    float currentYear = kGameYear.GetValue()
    float daysPassed = kGameDaysPassed.GetValue()

    ; Calculate new hour and check for day change
    currentHour += hoursToSkip
    while currentHour >= 24.0
        currentHour -= 24.0
        currentDay += 1.0
        daysPassed += 1.0

        bool IsMonthEnd = false
        ; check if the current day is the end of the month
        if currentMonth == 2 ; February
            int intCurrentYear = currentYear as int
            if (intCurrentYear % 4 == 0 && (intCurrentYear % 00 != 0 || intCurrentYear % 400 == 0)) && currentDay > 29
                IsMonthEnd =  true
            elseif currentDay > 28
                IsMonthEnd =  true
            endif
        elseif (currentMonth == 4 || currentMonth == 6 || currentMonth == 9 || currentMonth == 11) && currentDay > 30 ; 30-day months
            IsMonthEnd =  true
        elseif currentDay > 31 ; 31-day months
            IsMonthEnd =  true
        endif

        ; Check for month change
        if IsMonthEnd
            currentDay = 1.0
            currentMonth += 1.0

            ; Check for year change
            if currentMonth > 12.0
                currentMonth = 1.0
                currentYear += 1.0
            endif
        endif
    endwhile

    ; Set the new values
    kGameHour.SetValue(currentHour)
    kGameDay.SetValue(currentDay)
    kGameMonth.SetValue(currentMonth)
    kGameYear.SetValue(currentYear)
    kGameDaysPassed.SetValue(daysPassed)
endfunction