# Favorite features and ideas I've come accross from languages

These are my favorite features and ideas I've come accross in differnt languages or general ideas.

I'll try to explain the pros and cons of them and why I personally like them while they might not be objectively good.

This is in no specific order other then what I remember or think of first.

1. Units
    ```js
    class Percent < Unit {
      #constructor(@value) {}

      @of<T>(max: T): float {
        return @value / max
      }
    }

    define unit % Percent

    // perhaps using syntax sugar it could be 10% of 100 or similar
    let x = 10%.of(100)
    // 10.0

    // however while the above may make sense
    // units should generally try to store their value until being called to an int like so

    let y = 10%.of(20%)
    // Percent(10).of(Percent(20%))

    // add final
    let z = y.of(100)
    // Percent(Percent(10).of(Percent(20%))).of(100)

    // run calculations
    let a = y.to_int
    // 2
    ```
    Units provide a good way to create a universal number format
    I haven't seen any good examples of it in practice so I don't have much expierence with it
    It seems it may be hard to create a good implementation though
2. Operator Overloading
    ```js
    class Array {
      def + (value: Array) {
        return new [...this, ...value]
      }
    }

    let a = [1, 2, 3]
    let b = [4, 5, 6]

    a + b
    // [1, 2, 3, 4, 5, 6]
    ```
    Others may dislike this for being confusing or not clear, however readability can be better with it
    An example would be to create an operation for adding arrays together
    However, operator overloading doesn't work well in languages without type overloading
    It's something that's needed to keep compatability and clarity with other addition overloads
3. Only while or until loops
    ```cr
    let x = 0
    while(x < 3) {
      x += 1
    }

    until let x = 0 >= 3 {
      x += 1
    }
    ```
    Having multiple loops can make it hard to optimize or know what or when to follow good practice
    Having one makes this easier
    Having until loops can make code more readable while still being the same as a while loop
4. The thing I forgot the name of but it's the import style of javascript and not the ruby module style
    ```
    import { pi as pinum } from 'module'
    import thing from './file'

    export * from 'module/file'

    let pi = 3.14
    export { pi }
    // import { pi } from './this_file'

    let uno = 1
    export default uno
    // import one from './this_file'
    ```
    While I like modules and other features from ruby, importing an entire package as module every time causes problems
    like having the scope polluted with unchangable names (java can have problems with this)
    or having the entire module loaded all at once when it doesn't need to
    javascript provides a way of loading only needed things when properly programmed
5. Namespaces and Modules
    While the above shows you don't need them I still think they are a great idea and can be used for good
    this is a strongly opinionated one with no real example
6. Objects
    ```js
    object = {}
    object.item = 1
    object.item2 = {item3, item4}
    object.item
    // 1
    
    // or written as
    object = {item = 1, item2 = {item3, item4}}
    ```
7. OOP
    I love oop inheritance and how easy it is to make changes to everything at once
    I love the way it looks
8. Functional
    I don't entirely understand it to be completely honest
    but I love pattern matching and a lot of features built into languages like elixir
9. this list is getting lazy
10. it's just a joke now
11. Ruby/Elixir blocks
    While most languages have something like this in some form (callbacks in js or promises)
    I like rubys approach, however I feel like it can be improved upon in syntax and extendability with a callback like
    way of implementing it
12. Types and Typechecking
    I used to get confused by types so I understand they aren't for everyone
    However once I got used to them I realized the power and safety they can provide
13. A unified language
    This isn't nessisary for all languages because they all have a different goal
    however having a language that has a unified community and toolset is nice
    Some exmaples of languages not having that would be
    1. Python
        Like seriously installing it isn't a total drag but getting pip to work can be a pain, updating is a pain and there isn't any official dependency management tool
        
    2. Ruby
        While it has an official dependency manager and other things, installing it is a drag and is confusing on systems like windows where it can feel fragmented and not first class
        The standard library is a mess and confusing, the docs don't look very nice and it's confusing to navagate
        not only that but the language in general feels lacking and second class
        the "feel" of a language is important
    Some examples of language that do have a unified community and toolset
    1. Crystal
        Installing it dead simple on most systems other then windows, which is not support as of now :(
        However the standard library is well defined and solid
        the documentation is clear and the provided tools that come with the compiler create a unified language
        it has a very good starting guide and the overall feel of the language made me fall in love with it
        please check out their [website](https://crystal-lang.org/) to see what I mean. The [website](https://crystal-lang.org/) expresses the language so well
    Mixed
    1. JavaScript
        Everything is fragmented
        and yet the language evolves fast enough now to continuously unify the community more and more each year
        it's pretty incredble
        not only that but having npm and yarn as the package managers (and making it so easy to find and add a package) is really smart
        While other languages like rust and go have now adopted similar (and better) systems js really made it popular within the community
