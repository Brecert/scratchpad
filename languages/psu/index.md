# Psu
> language description

## Why
for fun!

## What
While not Purely functional, mostly functional

types can be defined in way a class would usually and should be a shorthand for functional types

```go
type Buffer

def { self: Buffer } seek(offset: int, relative: bool = false): void {
  self.do_thing  
  // ...
}

// would be the same as

type Buffer {
  def seek(offset: int, relative: bool = false): void {
    self.do_thing
    // ...
  }
}
```
