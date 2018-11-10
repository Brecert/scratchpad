## Name TBD

> A macro language, meant to make writing unfamiliar or unfun language fun and familiar, through the use of syntax definitions and bindings to write macros.

<!-- removed for not properly reflecting goals, however some of it is a proper goal
> A macro language, only meant to be used as a macro language, with a focus on extending the language itself through macros, essentially creating mini-languages that transpile using the macro language to other languages. 
-->

<br>

There are two parts.

The syntax definitions, and the definitions output.

### Syntax

The syntax is similar to the identifier when nameing a function `function add`, but much more advanced

Both a simple and advanced syntax are allowed
```
// simple syntax for definition print becomes puts
// more or less renaming a method locally
syntax print puts

// syntax for the language Function
// redefining how the function is parsed locally
syntax Function ['def' [name : Syntax::Name] [<?> '(' args : ListFrom<Syntax::Name, ','> ')' ] [block : Syntax::Block] 'end']

// redefining the syntax
syntax Function ['function' [name : Syntax::Name] '(' args : ListFrom<Syntax::Name, ','> ')' '{' [block : Syntax::Block] '}' ]

```

<br>

### Output

Outputs are similar to a normal `return` in many languages, however instead this can return to a catagory.

Catagories are still being thought on..
```
def join_args(args)
  '(' << args.join(',') << ')'
end

// Transpiler output for ruby
output[:ruby] Function (name : Syntax::Name, args: List<Syntax::Name>, block: Syntax::Block)
  def ${name} ${ join_args unless args.empty? }
    ${block.expressions.join('\n')}
  end
end
``` 

If the syntax defined in Syntax is taken into account
```
function none { }

function add(a, b) {
  a + b
}
```
and using the ruby output
```
def none
end

def add(a, b)
  a + b
end
```

<br>

## Problems

This language, while a great idea isn't very well thought out.
There are several ideas that could use a solution, or an alternative.

Current problems that need solving.

1. How is the base language defined, should it be allowed to be redifined?
    * Should it be only "aliased"?
2. When it comes transpiling, how will advanced "unsupported" syntaxes be handled?
    * One could say to leave them as unsupported, however a simple output should extend throuout the language, not just on a transpilation issue
3. Even though at its core this is a macro language, should other features take priority?
    * probably yes
4. What will the base language(s) be?
    * Python (with types)
    * Crystal
5. Even though the goal isn't to be a 1:1 transpiler, it could be a useful feature.
    * How would languages with special types or features work?
    * This is important because macros may need to support these types or features.
6. How will whitespace be handled for a whitespace sensitive syntax.
7. How output catagories should work
