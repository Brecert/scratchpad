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
    ```
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
    
