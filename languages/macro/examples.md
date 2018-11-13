# Misc
```
module std
  module Arithmetic
    def add(a: Number, b: Number): Number
      mt`${a} + ${b}`
    end
    
    def sub(a: Number, b: Number): Number
      mt`${a} - ${b}`
    end
    
    def mult(a: Number, b: Number): Number
      mt`${a} * ${b}`
    end
    
    def div(a: Number, b: Number): Number
      mt`${a} / ${b}`
    end
  
    private opTable = table {
      "+": add
      "-": sub
      "*": mult
      "/": div
    }
    
    syntax Operation [ a <opTable.left> b ]
    output Operation do |a, op, b|
      <opTable[<op>]>(a, b)
    end
  end
end

```


# Dirty Class Example
```
// Assuming Classes don't already exist and we are currently using a js like prototype language
// Assuming we are using a Crystal like syntax
module Classes
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
end
```

would work as

```
include syntax of Classes

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

# Basic Example
assuming currently there is only a polish notation of operations
```
module Math
  syntax add [ a '+' b ]
  output add do |a, b|
    resolve add(a, b)
  end
end

Math 1 + 2 # => 3

include * of Math

2 + 2 # => 4
```

```
module ArnoldC
  syntax Def [ "IT'S SHOWTIME" ]
  syntax print [ "TALK TO THE HAND" {string : Syntax::String}]
  syntax Close [ "YOU HAVE BEEN TERMINATED" ]
  
  output print do |string|
    `print("#{string.value}")`
  end
end

include * of ArnoldC

IT'S SHOWTIME
TALK TO THE HAND "Hello World!"
YOU HAVE BEEN TERMINATED
```
