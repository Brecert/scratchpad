# Dirty Class Example
```
// Assuming Classes don't already exist and we are currently using a js like prototype language
// Assuming we are using a Crystal like syntax
syntax Class [ 'class' [name : Syntax::Identifier] [block : Syntax::Block] ]

output Class do |name, block|
  ${name} = {${{
    block.expressions.each do |exp|
      if(exp =: Syntax::Def)
        // Support all types of it, why not?
        if(exp.name =: "__init__" | "constructor" | "initialize")
          out = block.expressions.pop(exp)
          out.name = ""
          return out
        end
      end
    end
  }}$}
  ${{
    block.expressions.each do |exp|
      if(exp =: Syntax::Def)
        proto = new Syntax::Call(name, ["prototype", exp.name])
        func = new Syntax::Def("", exp.args, exp.body)
        assignment = new Syntax::Assign(proto, func)
        resolve assignment
      else
        if(exp =: [<&type> .name | .value]) do |type|
          proto = new Syntax::Call(name, ["prototype", exp<type>])
          assign = new Syntax::Assign(proto, type)
        end
      end
    end
  }}$
end
```

would work as

```
class Math {
  PI = 3.164
  
  private opTable = {
    "+": <Syntax::Std::add.name>
    "-": <Syntax::Std::sub.name>
    "*": <Syntax::Std::mult.name>
    "/": <Syntax::Std::div.name>
  }
  
  syntax Operator [ '+', '-', '*', '/' ]
  syntax Operation [ [a : number] [op : Operator] [b : number] ]
  
  def operate [ Operation ] do |a, operator, b|
    <opTable[<operator>]>(a, b)
  end
}
```

Annotated result

```
Math = {}
Math.prototype.PI = 3.164
// Privates aren't implemented
Math.prototype.opTable = {
  "+": <Syntax::Std::add.name>
  "-": <Syntax::Std::sub.name>
  "*": <Syntax::Std::mult.name>
  "/": <Syntax::Std::div.name>
}
Math.prototype.Operator = [ '+', '-', '*', '/' ]
Math.prototype.Operation [ [a : number] [op : Operator] [b : number] ]
Math.prototype.operate = def [ Operation ] do |a, operator, b|
  <opTable[<operator>]>(a, b)
end
```

and using the math

```
Math 1 + 1 // => 2
Math 3 / 3 // => 1
```
