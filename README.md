CS:GO-like crosshair overlay for awesomewm
==================

<p align="center">
  <img src="https://user-images.githubusercontent.com/1234183/172886550-6a730c44-99d8-44ee-9aa7-f0e24d2eeff5.png">
</p>


Customization:
------------

| name | default
|---|---
| `screen` | screen.primary 
| `visible` | false
| `color` | "#00FF00FF" 
| `size` | 12
| `thickness` | 6
| `gap` | 4
| `outline` | 0
| `dot` | 0

Installation:
------------

Clone the repo and import the module:

1. `git clone https://github.com/intrntbrn/crosshair ~/.config/awesome/crosshair`
2. `echo "require('crosshair')({ visible = true, color = '#00FFFF' })" >> ~/.config/awesome/rc.lua`


Toggle:
------------

```echo "awesome.emit_signal('crosshair::toggle')" | awesome-client```
