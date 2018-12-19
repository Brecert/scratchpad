Logic Save
```yaml
_not_:
  # ID of the named chip
  id: 0
  # The type of the named chip
  type: not
  # The connections of the named chip
  connections:
    # Named value for sake of readability rather then an unnamed array
  	_not_:
    	id: 0
    	# Which output is selected to go out of
      output: 0
      # Which input is selected to go into
      input: 0
    # If the id is not specified then assume
    # that it continues from the last number
    # +1
    _print_:
      output: 0
      input: 0
    
_print_:
  id: 1
  type: print
  properties:
  	value: Hello World
```

Display Save
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
