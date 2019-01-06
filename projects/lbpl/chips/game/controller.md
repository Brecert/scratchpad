Three controllers

1. Keyboard display
2. Controller display
3. Map to Tag display

Both the keyboard and controller show the actual keyboard or gamepad and let you take inputs and wire them to emitters from there

The map to tag display is a more direct approach of displaying the information.

Each key or controller input is assigned to a tag value directly
for example
```yaml
keyboard_w: move_forward
gamepad_axis_y_positive: move_forward

keyboard_space: jump
gamepad_buttom_accept: jump
```
then later with event capturers
```cr
on jump ->
  acceleration += 1
```
this would all be displayed with chips and gui of course.

### Note

while the map and tag display may be lower level, it would be considered "syntax sugar".

The exact same could be achieved by having one keyboard display and one controller display, each input hooked up to an event_emitter
