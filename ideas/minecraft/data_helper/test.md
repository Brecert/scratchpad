
### Input

```mcr
module: root
selector: server

set no_default_assignment
set default_assignment = 0
set special_assignment : minecraft:play_one_minute
```

### Output
```mcfunction
scoreboard objectives add no_default_assignment dummy

scoreboard objectives add default_assignment dummy
scoreboard objectives set server default_assignment 0

scoreboard objectives add special assignment minecraft.custom:minecraft.play_one_minute
```

### Crystal like output
```cr
module = :root
selector = "server"

no_default_assignment = Objective.new "dummy"

default_assignment = Objective.new "dummy", default: 0

special_assignment = Objective.new Path.new("minecraft:play_one_minute")
```
