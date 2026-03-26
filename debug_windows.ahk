#Requires AutoHotkey v2.0

^!d:: {
    monitorWidth  := SysGet(0)
    monitorHeight := SysGet(1)
    count := 2
    cols := Ceil(Sqrt(count))   ; = 2
    rows := Ceil(count / cols)  ; = 1
    winHeight := monitorHeight // rows

    windows := []
    for hwnd in WinGetList() {
        title := WinGetTitle(hwnd)
        style := WinGetStyle(hwnd)
        if (title = "") || (style & 0x20000000) || !(style & 0x10000000)
            continue
        if (title = "Program Manager" || title = "Windows Input Experience")
            continue
        windows.Push(hwnd)
    }

    info := "cols=" cols " rows=" rows " winW=" (monitorWidth//cols) " winH=" winHeight "`n`nWindows found:`n"
    for hwnd in windows
        info .= WinGetTitle(hwnd) "`n"

    MsgBox(info)
}