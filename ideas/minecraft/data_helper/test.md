
### Input

```cr
module: test
selector: server

set no_default_assignment
set default_assignment = 0
set special_assignment : minecraft:play_one_minute
```

### Output

```cr
scoreboard objectives add no_default_assignment dummy

scoreboard objectives add default_assignment dummy
scoreboard objectives set server default_assignment 0

scoreboard objectives add special assignment minecraft.custom:minecraft.play_one_minute

```
