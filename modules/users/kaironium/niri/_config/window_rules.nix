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
  match app-id="firefox" title="^Extension"
  match app-id="org.telegram.desktop" title="Media viewer"
  open-floating true
}
''
