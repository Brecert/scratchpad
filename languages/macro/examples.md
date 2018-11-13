# Terminology

**Defs**

Defs define methods like in a language like Ruby.
It's good for re-useable logic that doesn't belong in a one off syntax, as syntax outputs are usually wrappers around a method.

<br>

**Macros**

Macros are like Def but rather they inset theirself into the code beforehand, this may be good for one off situations when a syntax doesn't make sense.

<br>

**Syntax** 

Syntaxs are the key part of this language, they define syntax rules about how a situation should be parsed.

<br>

**Outputs**

Outputs complement syntaxs, they provide the output while the syntax provides the input.
It's seperates to allow for syntax and output redefinition easily.

<br>

# Features explained
### Module

modules are nearly identical to Ruby/Crystal, 
however, you can import from them in a similar nature to Javascript.

There are two types of import syntax
```import {type} of {module}```
and
```import {values} from {module}```

Of imports import a specific type from the module.
So importing only the syntax of a module is easy.

The from import is nearly identical to a javascript import.
```
-- Module Syntax
module TestModule
  syntax test [ "test" ]
  
  output test do |_|
    `print("test")`
  end
  
  def hi
    print("hi")
  end
  
  macro bob
    print("bob")
  end
end

-- Importing Various Types
import syntax of TestModule
import output of TestModule
import def of TestModule
import macro of TestModule
import * of TestModule 

-- Importing Values From Module
import { hi } from TestModule
```

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

## Example of implementing a basic language

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
