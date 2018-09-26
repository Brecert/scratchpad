# Data Helper

A language to help make datapacks with a more readable and conventional syntax.

## Core Concepts

<details>
  <summary> <b> Namespaces </b> </summary>
  
Everything in Data is in a namespace, even if it may not seem like it.

```cr
x = 2

# becomes =>
# scoreboard players set @s x 2
```

is actually in the default namespace, typically `root`, and `root` having the selector `@s`

using a new namespace is easy.

```cr
namespace name
  x = 2
end
  
# becomes =>
# scoreboard players set @s name.x 2
```

setting a new selector is easy too!
```cr
namespace name
  selector: server
  x = 2
end
  
# becomes =>
# scoreboard players set server name.x 2
```
</details>

<details>
  <summary> <b> Typings </b> </summary>
  
By default there aren't any conventional types, however there are invisible types

```cr
y = 2
x = y
s = minecraft::stat::played_one_minute
```

can be broken down into

`y = 2` `=>` `variable assigment value`

`x = y` `=>` `variable assignment variable`

`s = minecraft::stat::played_one_minute` `=>` `variable assignment path(minecraft, stat, played_one_minute)`

this is how the transpiler determines the correct assignment command

</details>

<details>
  <summary> <b> Assignments </b> </summary>

```cr
y = 2
x = y

# becomes =>
# scoreboard players set @s y 2
# scoreboard players operation @s = @s y
```

<details>
  <summary> <b> Paths </b> </summary>
  
  Paths allows for easy assignment of specialized scoreboard criterias 
  Usually when assigning an objective dummy will automatically be used.
  However with paths you can use criterias
  
</details>

<details>
  <summary> <b> Math </b> </summary>

##### Inefficient but safer
```cr
x = 0
x = x + 1

# becomes =>
# scoreboard players set @s x 0
# scoreboard players operation @s ___ = @s x
# scoreboard players add @s ___ 1
# scoreboard players operation @s x = ___
```
```cr
x = 1 + 2
y = x + 3

# becomes =>
# scoreboard players set @s ___ 1
# scoreboard players add @s ___ 2
# scoreboard players operation @s x = @s ___
# scoreboard players operation @s ___ = @s x
# scoreboard players add @s ___ 3
# scoreboard players operation @s y = @s ___
```

##### Fast but less safe (chains may not work and it may mutate when not intended or expected).
```cr
x = 0
x += 1

# becomes =>
# scoreboard players set @s x 0
# scoreboard players add @s x 1
```

```cr
x += 1
x += 2
y = x
y += 3

# becomes =>
# scoreboard players add @s x 1
# scoreboard players add @s x 2
# scoreboard players operation @s y = @s x
# scoreboard players add @s y 3
```
</details>
</details>
