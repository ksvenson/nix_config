{ config, ...}: ''
input {
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
    accel-speed 0.0  // this just changes sensitivity if accel-profile is flat
    scroll-factor 0.3
  }
}
''
