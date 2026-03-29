; TileWindows.ahk
; Ctrl + Alt + T  → toggle between tiled and maximised
; Requires AutoHotkey v2

#Requires AutoHotkey v2.0

global isTiled := false

GetVisibleWindows() {
    windows := []
    for hwnd in WinGetList() {
        title := WinGetTitle(hwnd)
        style := WinGetStyle(hwnd)
        if (title = "")
            continue
        if (style & 0x20000000)  ; WS_MINIMIZE
            continue
        if !(style & 0x10000000) ; WS_VISIBLE
            continue
        if (title = "Program Manager" || title = "Windows Input Experience" || title = "NVIDIA GeForce Overlay" || title = "Picture in Picture" || SubStr(title, 1, 6) = "Meet -" || SubStr(title, 1, 3) = "OBS" || title = "PowerDock" || title = "JarlClock")
            continue
        windows.Push(hwnd)
    }
    return windows
}

^!t:: {
    global isTiled
    monitorWidth  := SysGet(0)
    monitorHeight := SysGet(1)

    windows := GetVisibleWindows()
    count := windows.Length
    if (count = 0)
        return

    if (!isTiled) {
        ; Tile all windows
        cols := Ceil(Sqrt(count))
        rows := Ceil(count / cols)
        winWidth  := monitorWidth  // cols
        winHeight := monitorHeight // rows

        lastRowCount := Mod(count, cols)
        if (lastRowCount = 0)
            lastRowCount := cols
        lastRow := rows - 1

        i := 0
        for hwnd in windows {
            col := Mod(i, cols)
            row := i // cols
            y   := row * winHeight

            if (row = lastRow) {
                w := monitorWidth // lastRowCount
                x := col * w
                WinRestore(hwnd)
                WinMove(x, y, w, winHeight, hwnd)
            } else {
                x := col * winWidth
                WinRestore(hwnd)
                WinMove(x, y, winWidth, winHeight, hwnd)
            }
            i++
        }
        isTiled := true
    } else {
        ; Maximise all windows
        for hwnd in windows
            WinMaximize(hwnd)
        isTiled := false
    }
}
