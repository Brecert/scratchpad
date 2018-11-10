## Name TBD
> A macro language, only meant to be used as a macro language, with a focus on extending the language itself through macros, essentially creating mini-languages that transpile using the macro language to other languages.

<br>

Current problems that need solving.

1. How is the base language defined, should it be allowed to be redifined?
  * Should it be only "aliased"?
2. 

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
syntax Function ['def' [name : Syntax::Name] [<?> '(' args : ListFrom<Syntax::Name, ','> ')' ] [block : Syntax::Block]]
```
<br>
### Output

Outputs are similar to a normal `return` in many languages, however instead this can return to a catagory.

Catagories are still being thought on..
```
def join_args(args)
  '(' << args.join(',') << ')'
end

output[:ruby] Function (name : Syntax::Name, args: List<Syntax::Name>, block: Syntax::Block)
  def ${name} ${ join_args unless args.empty? }
    ${block.expressions.join('\n')}
  end
end
```
