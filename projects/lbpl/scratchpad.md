
```cr
class LogicNode
  # ## Properties
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
  # default stays static while value changes
  # default will only be used past setting the initial value if defaults are set again
  @properties
end
```

### Not Gate
```cr
class Not < Gate
  def update_output
    if @input[0].value == 0
      @output[0].value = 100
    else
      @output[0].value = -@input.value
    end
    
    @output[0].emit
  end
end
```

### Timer
```cr
class Timer < Node  
  def initialize
    # current_time gets its maximum from the max_time method
    @properties += {
      current_time: { default: 0, type: "Int32", min: 0, max: max_time },
      max_time: { default: 600, type: "Int32", min: 0, max: Infinity }
    }
    
    unless @@global["ticker"]["timer"]?
      @@global["ticker"]["timer"] = new Ticker(100) # 100 ticks per second
    end
    
    @ticker = @@global["ticker"]["timer"]
    
    @ticker.ticked = -> {
      @properties[:current_time] += 1
      
      if @properties[:current_time] > @properties[:max_time]
        @properties[:current_time] = @properties[:max_time]
      end
      
      @output[0].value = @properties[:current_time] / @properties[:max_time]
      @output[0].emit
    }
  end
  
  def max_time
    @properties[:max_time].value
  end
end
```








