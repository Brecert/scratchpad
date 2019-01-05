
# ~
```
class LogicNode
  # Properties
  # Properties hold information that's meant to be editable or displayed
  # For a timer class it may hold a few different properties
  # A timer needs to have the current time that it's at, and the maximum time
  # another example would be to have a chip that prints something to the console
  # it needs to store what it's going to print, that would also go in properties
  # each property has a few values
  # { default: "Hello World! , type: "string" }
  # { default: 2, type: "number", min: 2, max: 100 }
  # each of these have a hidden unset value. "value".
  # because you use default to set the default value, there's no reason to set value
  # however value is user in the code when checking or setting it
  # default stays static while value changes, default will only be used past setting the initial value if defaults are set again
  @properties
end
```
