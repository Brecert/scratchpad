
def name (*splat_var : type)
end


newline sensitive language

```
def print(*message : $any)
  return `tellraw @s "#{message}"`
end

# => works because of special $any capturing type.
print hello world!
# => `tellraw @s "hello world!"
```
