Data Helper
===========
A language to help make datapacks with a more readable and conventional syntax.

Examples
--------
### Core Concepts

#### Namespaces

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

#### Assigning
```cr
y = 2
x = y

# becomes =>
# scoreboard players set @s y 2
# scoreboard players operation @s = @s y
```
