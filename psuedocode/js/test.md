```js
interface Vec2D {
  x: number
  y: number
}

BaseCanvasObject {
  pos: Vec2D
  scale: Vec2D
  offset: Vec2D
  
  events {
    clicked
    hover
    // (basically any dom events)
  }
}
```
