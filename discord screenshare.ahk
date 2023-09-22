doublePress := false

F14::
if (A_PriorHotkey != "F14" or A_TimeSincePriorHotkey > 400)
{
    ; Too much time between presses, so this isn't a double-press.
    KeyWait, F14
    SetTimer, ConfirmSinglePress, -400 ; Set a timer to check for single press
    return
}
doublePress := true
; A double-press has occurred, so take appropriate action.
; in this case, the script will start a stream in discord
StartDiscordStream()
return

ConfirmSinglePress:
if (doublePress = true) ; If F14 was double-pressed, don't do anything
{
    doublePress := false
    return
}
; Otherwise, it was a single press, so take appropriate action.
; in this case the script will send the hotkey that stops the stream in discord
Send ^+{F13}    ;Replace this with the hotkey that stops the stream in discord for you.
return



StartDiscordStream() {
    ;Function that starts a stream in discord.
    ;if a stream is already running, the script will just get back to were it was before the script was called

    alreadyStreaming := false
    ; Remember the active window
    WinGetActiveTitle, ActiveWindowTitle

    ; Remember the mouse coordinates
    MouseGetPos, OrigX, OrigY

    ; Lock the mouse while moving (prevents user interference)
    ; BlockInput, MouseMove

    SetTitleMatchMode, 2

    ; Activate Discord
    WinActivate, Discord
    Sleep, 550

    ;check if the stream button at the bottom left corner is available by checking the color of the button:
    PixelGetColor, streamButtonColor, 189, 675
    if (streamButtonColor != 0x313338){ ;if the color is not 313338, the button is not available
        if ((streamButtonColor = 0x23a559)||(streamButtonColor = 0x2fbc6c) (streamButtonColor = 0x5AA226) ){  ;if we are already streaming, the script will just get back to were it was before the script was called
            alreadyStreaming = true
        }else{
            send {Escape}   ;press escape to close any open menu
            sleep, 650    ;wait for the menu to close
        }
    }

    if (!alreadyStreaming){
        ; Move the mouse and click the stream icon at the bottom left corner to open the stream menu
        MouseMove, 189, 675 , 0
        Click

        ;wait for the stream menu to open and wait for the "Screens" option to pop up.
        ;this is done by checking the color of the "Screens" option.
        ;if for some reason the "Screens" option doesn't pop up, the script will do a recursive call to itself to try again.
        ;WARNING this can cause an infinite recursion if the "Screens" option never pops up for whatever reason.
        PixelGetColor, screensOptionColor, 563, 275
        counter := 0
        while (screensOptionColor != 0xBCB7B2)
        {
            Sleep, 10   ;wait 10ms
            PixelGetColor, screensOptionColor, 563, 275 ;check the color of the "Screens" option
            counter++   ;increase the counter
            if (counter > 150)  ;if the counter reaches 150, the script will do a recursive call to itself to try again.
            {
                Send, {Escape}  ;press escape to close any open menu
                sleep, 10       ;wait a bit just in case
                Send, {Escape}  ;press escape to close any open menu again just in case
                StartDiscordStream()
                break
            }
        }
        if (150 > counter){

            Send, {Tab}             ;Apps tab
            Send, {Tab}             ;Screens tab
            Send, {Enter}           ;press enter to open the screens menu
            Send, {Tab}             ;Capture device tab
            Send, {Tab}             ;press tab to select the first screen in the list
            Send, {Enter}           ;press enter to confirm the screen selection and start the stream

            ;for loop that send 13 tabs in ahk. This should highlight the "Go Live" button to confirm the selection of the first screen in the list.
            Loop, 13{
                Send, {Tab}
            }
            Send, {Enter}   ;press enter to confirm the screen selection and start the stream

        }
    }
    Sleep, 20

    ; Restore the original active window
    WinActivate, %ActiveWindowTitle%

    ; Restore the original mouse position
    DllCall("SetCursorPos", "int", OrigX, "int", OrigY)

    ; BlockInput, MouseMoveOff
}
