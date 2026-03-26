# AutoHotkey Window Tiler

A minimal AutoHotkey v2 script that tiles all visible windows across your monitor in a grid layout, with a single hotkey to toggle between tiled and maximized.

## Features

- **Auto grid layout** — arranges all visible windows into an evenly distributed grid (e.g. 4 windows → 2×2, 6 → 3×2)
- **Last-row fill** — the bottom row always stretches its windows to fill the full screen width
- **Toggle** — one hotkey switches between tiled and maximized; pressing again restores all windows to maximized
- Skips system windows (`Program Manager`, `Windows Input Experience`, `NVIDIA GeForce Overlay`) and minimized/hidden windows

## Requirements

- [AutoHotkey v2](https://www.autohotkey.com/) (v2.0 or later)
- Windows

## Usage

1. Install AutoHotkey v2.
2. Double-click `TileWindows.ahk` to run it (or add it to your startup folder).
3. Press **Ctrl + Alt + T** to tile all visible windows.
4. Press **Ctrl + Alt + T** again to maximize them all.

## Files

| File | Description |
|------|-------------|
| `TileWindows.ahk` | Main script — hotkey `Ctrl+Alt+T` to toggle tiling |
| `debug_windows.ahk` | Debug helper — hotkey `Ctrl+Alt+D` shows a popup with the detected window list and calculated grid dimensions |

## Hotkeys

| Hotkey | Action |
|--------|--------|
| `Ctrl + Alt + T` | Toggle between tiled and maximized |
| `Ctrl + Alt + D` | Show debug info (window count, grid size, titles) |
