
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

advanced macro

```
def [ 'add' $num1 'plus' $num2 ] (num1: Number, num2: Number)
  return num1 + num2
end

add 1 plus 2
# => 3
```

build a "language"

```
macro [ 'function' $identifier [<?> '(' *args ')' ] '{' &block '}' ] 
      (identifier: Word, args: List(','), block: Block(Expression))
      
  def {{ identifier }} {{ -> { '(' args.join() ')' } unless args.empty? }}
    {{ yield block }}
  end
  
end

function print(name, thing) {
  puts hi
}
/* becomes */
/*
  def print(name, thing)
    puts hi
  end
*/

/* and */
function empty { }

/* becomes */
/*
  def empty
  end
*/
```
