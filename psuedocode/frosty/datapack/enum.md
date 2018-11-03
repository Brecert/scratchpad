
```mcfl
enum num
  zero
  one
  two
  three
end

let uno
uno = 1

if uno == one do
end
```

```mcfl
scoreboard objectives add name dummy
scoreboard players set #zero num 0
scoreboard players set #one num 1
scoreboard players set #two num 2
scoreboard players set #three num 3

scoreboard objectives add uno dummy
scoreboard players set @s uno 1

execute if score @s uno = #one num
```
