Logic Portion
```yaml
_not_:
  id: 0
  is: not
  out:
    - _not_
    - _print_
    
_print_:
  id: 1
  is: print("Hello")
```

Display Portion
```yaml
_not_:
  id: 0
  x: 10
  y: 5

_print_:
  id: 1
  x: 20
  y: 5
```
