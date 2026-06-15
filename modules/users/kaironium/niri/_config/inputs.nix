{ config, ...}: ''
input {
  disable-power-key-handling
  keyboard {
    xkb {
      layout "us"
    }
    numlock
  }
  mouse {
    accel-profile "flat"
  }
  touchpad {
    natural-scroll
    tap
    drag false
    // accel-profile "flat"
    accel-speed 0.15  // this just changes sensitivity if accel-profile is flat
    scroll-factor 0.5
  }
}
''
