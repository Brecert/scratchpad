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
