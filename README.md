CS:GO-like crosshair overlay for awesomewm
==================

<p align="center">
  <img src="https://user-images.githubusercontent.com/1234183/172886550-6a730c44-99d8-44ee-9aa7-f0e24d2eeff5.png">
</p>


Customization:
------------

| name | default | description
|---|---|---
| `screen` | screen.primary | the monitor
| `visible` | false | visibility on startup
| `color` | "#00FF00FF"  | crosshair color
| `size` | 12 | crosshair size
| `thickness` | 6 | crosshair thickness
| `gap` | 4 | crosshair gap
| `outline` | 0 | crosshair outline (border)
| `dot` | 0 | crosshair dot radius
| `apps` | nil | automatically enable crosshair for applications (e.g. apps = {"Apex Legends", "Counter-Strike.*"})


Installation:
------------

Clone the repo and import the module:

1. `git clone https://github.com/intrntbrn/crosshair ~/.config/awesome/crosshair`
2. `echo "require('crosshair')({ visible = true, color = '#00FFFF' })" >> ~/.config/awesome/rc.lua`


Toggle:
------------

```echo "awesome.emit_signal('crosshair::toggle')" | awesome-client```
