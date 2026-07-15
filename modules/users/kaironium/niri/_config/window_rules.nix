{ config, ... }:
''
window-rule {
  match app-id="kitty"
  open-on-workspace "${config.workspaces.ws1}"
}

window-rule {
  match app-id="firefox"
  open-on-workspace "${config.workspaces.ws2}"
}

window-rule {
  match app-id="org.telegram.desktop"
  match app-id="discord"
  match app-id="io.github.tobagin.karere"
  open-on-workspace "${config.workspaces.ws3}"
}

window-rule {
  match app-id="Spotify"
  open-on-workspace "${config.workspaces.ws4}"
}

window-rule {
  // These would be nice to have, except neither of them work. See:
  // https://github.com/niri-wm/niri/discussions/1599
  // https://github.com/niri-wm/niri/issues/2738
  match app-id="firefox" title="^Extension"
  match app-id=r#"^org\.telegram\.desktop$"# title="^Media viewer$"
  open-floating true
}

window-rule {
 match app-id="firefox"
 default-column-width { proportion 1.00; }
}

// window-rule {
//   match app-id="firefox" title="^Extension"
//   max-width 500
// }
''
