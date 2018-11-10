```
| any
^ alias


Vec2
| x: number
| y: number

Mouse
| pos: Vec2
| region: string
| buttons: Int8[]
| isScrolling: boolean
| isPressed: boolean
| cursor: string => { root.style.cursor }
= cursor: string ( name ) => { root.style.cursor = name }

MouseEmitter < EventEmitter
| MouseEvent
| ClickEvent
| ScrollEvent

MouseEvent < Mouse

ClickEvent < MouseEvent
| button: Int8

WheelEvent < WheelEvent
| speed: Vec2 => { new Vec2(this.deltaX, this.deltaY) }

Keyboard
| keys: string[]
| keyCodes: Int[]

KeyboardEvent < Keyboard
| key: string
| keyCode: Int => { this.key to keyCode }


