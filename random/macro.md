
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

```cr
include Literal, Syntax

macro [ 'function' $identifier [<?> '(' *args ')' ] '{' &block '}' ] 
      (identifier: Word, args: List(','), block: Block(Expression))
      
  def {{ identifier }} {{ -> { '(' args.join() ')' } unless args.empty? }}
    {{ yield block }}
  end
  
end
```

lets you write

```js
function print(name, thing) {
  puts hi
}
```

which becomes

```rb
def print(name, thing)
  puts hi
end
```

and

```js
function empty { }
```

becomes

```cr
def empty
end
```

make a transpiler

```
syntax macro Block [ linebreak &statements 'end'  ] (block: Literal::Block)
  yield statements as statements
end

// uses alternate syntax for args
// this keeps it more readable (sometimes?)
macro [ 'def' $name '(' *args ')' $Block ](
      , name: Syntax::Word
      , args: Syntax::ListOf<Word, ','>
      , block: Block
      )
      
  function {{ name }}({{ args.join(',') }}) {
    {{ block.statements.join('\n') }}
  }
  
end
```

now

```
def hello
  console.log("hello")
end
```

becomes

```
function hello() {
  console.log("hello")
}
```



