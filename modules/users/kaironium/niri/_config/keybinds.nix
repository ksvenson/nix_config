{ config, ... }:
let
  mod = "Super";
  arrows = {
    "up" = "k";
    "down" = "j";
    "left" = "h";
    "right" = "l";
  };
  ws_up = "I";
  ws_down = "U";
in ''
binds {
  // General
  ${mod}+Shift+Slash { show-hotkey-overlay; }

  ${mod}+Return hotkey-overlay-title="Open a Terminal: kitty" { spawn "kitty"; }
  ${mod}+D hotkey-overlay-title="Open Noctalia Launcher" { spawn "noctalia-shell" "ipc" "call" "launcher" "toggle"; }
  ${mod}+P hotkey-overlay-title="Power Menu" { spawn "noctalia-shell" "ipc" "call" "sessionMenu" "toggle"; }
  // TODO: locking
  ${mod}+Q repeat=false {close-window; }
  
  // Audio
  XF86AudioRaiseVolume  allow-when-locked=true { spawn "noctalia-shell" "ipc" "call" "volume" "increase"; }
  XF86AudioLowerVolume  allow-when-locked=true { spawn "noctalia-shell" "ipc" "call" "volume" "decrease"; }
  XF86AudioMute         allow-when-locked=true { spawn "noctalia-shell" "ipc" "call" "volume" "muteOutput"; }
  XF86AudioPlay         allow-when-locked=true { spawn "noctalia-shell" "ipc" "call" "media" "playPause"; }
  XF86AudioStop         allow-when-locked=true { spawn "noctalia-shell" "ipc" "call" "media" "playPause"; }

  //Brightness
  XF86MonBrightnessUp   allow-when-locked=true { spawn "noctalia-shell" "ipc" "call" "brightness" "increase"; }
  XF86MonBrightnessDown allow-when-locked=true { spawn "noctalia-shell" "ipc" "call" "brightness" "decrease"; }
  
  // Navigation and Movement
  // Overview can be opened in 3 different ways:
  //  - move mouse into top left corner
  //  - four-finger swipe up on a touchpad
  //  - keybind below:
  ${mod}+O repeat=false { toggle-overview; }
  ${mod}+Tab { focus-workspace-previous; }

  ${mod}+${arrows.up}    { focus-window-up; }
  ${mod}+${arrows.down}  { focus-window-down; }
  ${mod}+${arrows.left}  { focus-column-left; }
  ${mod}+${arrows.right} { focus-column-right; }
  ${mod}+WheelScrollDown { focus-column-left; }
  ${mod}+WheelScrollUp   { focus-column-right; }

  ${mod}+Shift+${arrows.up}    { move-window-up; }
  ${mod}+Shift+${arrows.down}  { move-window-down; }
  ${mod}+Shift+${arrows.left}  { move-column-left; }
  ${mod}+Shift+${arrows.right} { move-column-right; }
  ${mod}+Shift+WheelScrollDown { move-column-left; }
  ${mod}+Shift+WheelScrollUp   { move-column-right; }

  ${mod}+${ws_up}                             { focus-workspace-up; }
  ${mod}+${ws_down}                           { focus-workspace-down; }
  ${mod}+Ctrl+WheelScrollUp   cooldown-ms=150 { focus-workspace-up; }
  ${mod}+Ctrl+WheelScrollDown cooldown-ms=150 { focus-workspace-down; }

  ${mod}+Ctrl+Shift+${ws_up}                             { move-workspace-up; }
  ${mod}+Ctrl+Shift+${ws_down}                           { move-workspace-down; }
  ${mod}+Ctrl+Shift+WheelScrollUp   cooldown-ms=150 { move-workspace-up; }
  ${mod}+Ctrl+Shift+WheelScrollDown cooldown-ms=150 { move-workspace-down; }

  ${mod}+Shift+${ws_up}   { move-column-to-workspace-up; }
  ${mod}+Shift+${ws_down} { move-column-to-workspace-down; }

  ${mod}+1 { focus-workspace 1; }
  ${mod}+2 { focus-workspace 2; }
  ${mod}+3 { focus-workspace 3; }
  ${mod}+4 { focus-workspace 4; }
  ${mod}+5 { focus-workspace 5; }
  ${mod}+6 { focus-workspace 6; }
  ${mod}+7 { focus-workspace 7; }
  ${mod}+8 { focus-workspace 8; }
  ${mod}+9 { focus-workspace 9; }
  ${mod}+Shift+1 { move-column-to-workspace 1; }
  ${mod}+Shift+2 { move-column-to-workspace 2; }
  ${mod}+Shift+3 { move-column-to-workspace 3; }
  ${mod}+Shift+4 { move-column-to-workspace 4; }
  ${mod}+Shift+5 { move-column-to-workspace 5; }
  ${mod}+Shift+6 { move-column-to-workspace 6; }
  ${mod}+Shift+7 { move-column-to-workspace 7; }
  ${mod}+Shift+8 { move-column-to-workspace 8; }
  ${mod}+Shift+9 { move-column-to-workspace 9; }

  ${mod}+BracketLeft  { consume-or-expel-window-left; }
  ${mod}+BracketRight { consume-or-expel-window-right; }
  ${mod}+Comma  { consume-window-into-column; }
  ${mod}+Period { expel-window-from-column; }

  // Sizing
  ${mod}+R { switch-preset-column-width; }
  ${mod}+Shift+R { switch-preset-window-height; }
  ${mod}+Ctrl+R { reset-window-height; }
  ${mod}+F { maximize-column; }
  ${mod}+Shift+F { fullscreen-window; }

  // Expand the focused column to space not taken up by other fully visible columns.
  // Makes the column "fill the rest of the space".
  ${mod}+Ctrl+F { expand-column-to-available-width; }

  ${mod}+C { center-column; }

  // Center all fully visible columns on screen.
  ${mod}+Ctrl+C { center-visible-columns; }

  // Finer width adjustments.
  // This command can also:
  // * set width in pixels: "1000"
  // * adjust width in pixels: "-5" or "+5"
  // * set width as a percentage of screen width: "25%"
  // * adjust width as a percentage of screen width: "-10%" or "+10%"
  // Pixel sizes use logical, or scaled, pixels. I.e. on an output with scale 2.0,
  // set-column-width "100" will make the column occupy 200 physical screen pixels.
  ${mod}+Minus { set-column-width "-10%"; }
  ${mod}+Equal { set-column-width "+10%"; }

  // Finer height adjustments when in column with other windows.
  ${mod}+Shift+Minus { set-window-height "-10%"; }
  ${mod}+Shift+Equal { set-window-height "+10%"; }

  // Toggle tabbed column display mode.
  // Windows in this column will appear as vertical tabs,
  // rather than stacked on top of each other.
  Mod+W { toggle-column-tabbed-display; }

  // Floating Windows
  // Move the focused window between the floating and the tiling layout.
  Mod+V       { toggle-window-floating; }
  Mod+Shift+V { switch-focus-between-floating-and-tiling; }

  // Screenshots
  Print { screenshot; }

  // Inhibit Keybinds
  ${mod}+Escape allow-inhibiting=false { toggle-keyboard-shortcuts-inhibit; }

  // Quitting
  Ctrl+Alt+Delete { quit; }
}
''
