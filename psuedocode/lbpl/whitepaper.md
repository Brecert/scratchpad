[//]: # (Title)
LBPL : Logic Based Programming Language
---

[//]: # (Overview)
Create and use basic logic gates to visually to program and create large scale structures easily.

[//]: # (Background)
There have been many visual languages created in the past few years.

However many of them have been tied to a specific domain of interest.

The most popular of these visual languages have been [Scratch](https://scratch.mit.edu/) a teaching tool for programming and [Luna](https://www.luna-lang.org/) a data processing and visualization language and ide.

Google created a more general use alternative to Scratch named [Blocky](https://developers.google.com/blockly/), that has been considered while writing this.

Both of these popular languages have Pros and Cons.

Pros of luna-lang
- somewhat intuitive, it just takes time to learn the editor
- if the editor worked correctly, it would be amazing

Cons of luna-lang
- user experience is terrible, loading the editor takes forever, is buggy, and is extrememly slow
- not extrememly beginner friendly, to both programmers and newbies. Both need to learn how the editor works and how the code works.
- As I could barely run the editor, any further flaws haven't been found.
- not embedable (both the editor, and the language (afaik))

Pros of scratch / blocky
- beginner friendly. While it may not be useful for writing actual code, it does a good job teaching it by keeping the visual elements simple.
- it can easily be extended and embedded into websites (blocky)

Flaws of scratch / blocky
- not intuitive when writing actual code.
- does not scale
- it's hard to tell what's happening at a glance

[//]: # (Objectives)
Knowing these, the eventual goals are to
- make the user expierence fast and friendly
- make the user expierence beginner friendly, no forced keybind, no hidden data or things, however, data may need to be hidden to not overload the user
- what the logic is doing at a glance
- read and write "real" code at scale for full programs
- make both the language and the editor embeddable
- make both the language and the editor extendable

- To keep the user expierence fast, optimisations must be kept in mind.
- To make the user expierence begginner friendly 
  * No forced keybinds for actions
  * The user must be able to know what's happening, keeping data hidden may make that hard
  * however, data may need to be hidden (correctly) to not overload the user with too much
  * while extendability is in mind, keeping a consistent ui/ux is important
- To understand what the logic is doing at a glance
  * information needs to be presented in non obtrusive ways to allow for everything to be seen.
  * a very simple example of this would be hovering over an output to show the full contents of what's being output
  * while it's behind something, it's intuitive enough and simple enough and provides information very quickly
- To make the logic scale
  * Containers of logic (chips), that create new re-usable logic is needed.
  * chips will also make it easy to tell what's happening at a glance due to having everything as a named logic gate
  * chips are very similar to functions
  * the code needs to run fast enough at scale, this is a given
  * the standard toolset of logic/chips needs to be extremely intuitive and simple to use
- To make the language and editor both embeddable and extendable
  * the language and editor need to be somewhat seperated and work individually if needed
  * the chosen language needs to be embeddable and extendable.
  * some good languages are lua, javascript, rust, c
  * due to ease of prototyping with it, javascript will create the initial implementation of the language and editor
  * To make the language extendable writing logic should be very simple, for example, a not gate 
    ```js
    this.output[0] = !this.input[0].value;
    this.emit(0) 
    ```
  * To make the editor extendable, ???


Notes
- All updates will be handled through events
- All logic should be handled withing the chip itself and be self-contained
- However, to keep things a little bit simple a stdlib for creating chips should be provided
- along with this part of the library should be for handing non-event based chips, for example a timer.

  while a timer may work with sleep and then emitting, it's extremely limited.
  
  for example, you can't emit the current value of the timer (1s/10s = 10%)
  
  not only that but timed chips may break easily when compared to logic only chips.
  
  Therefor a global tick process should be created for specialty chips.
  
  With a global tick rate controlling any other chips that are specialty
  
  For example, the timer may need to have a more specific tick rate of 1 tick per millesecond to keep things accurate
  
  The global tick rate is just a percentage, so 100% would still be 1 tick per millesecond and 200% being 2 ticks per millesecond
  
  While this is prone to breaking some more sensitive chips, overall it avoids more complications with users creating their own chips without a stdlib and becoming fragmented and hard to control.
  
  Furthurmore, if the ticker implementation is created correctly, optimization with ticks can be achieved, only ticking when nessisary for similar chips (multiple timer chips do not all have seperate tickers, but rather one unified "global" ticker)
  Unfortunantly it may be hard to create this, but it's possible
  
- to create a chip like a timer (it counts up and emits the current value) 
  ```js
  constructor() {
   super()
  
   // Create the property
   this.properties.time = 60000 // 60000 milleseconds, 60 second
   this.properties.current_time = 0
  
   // if this is the first placed timer
   if(global.timer.ticker === undefined) {
    global.timer.ticker = Ticker.new(1000) // 1000 ticks per second (1 tick per millesecond)
   }
   
   // on tick from the ticker
   global.timer.ticker.onTick = (tick) => {
    this.properties.current_time += 1
     
    // keep the timer within range
    if(this.properties.current_time > this.properties.time) {
     this.properties.current_time = this.properties.time
    }
    
    // emit the percentage that's been completed
    this.output[0].value = this.properties.current_time / this.properties.time
    this.emit(0)
   }
  }
  ```

### Visual Design and Aspects
![An example chip](https://i.imgur.com/zOyY1qA.png)

When rendered chips will have a few parts to it.

1. The inputs and outputs will need to be rendered. By default they should start at the center of the chip and for each added one be centered (by both)
   - However, due to some chips needed a more complex imput output design (for simplicity or ease of use) the inputs and output positions may need to be manually change to an x/y coord relative to the chip.
  
2. The chip itself. By defaults chips will be a square or a rectangle. Chips will typically have a few parts to it.
   - The border and the icon
   - The border is purely aesthetic
   - the icon is used to display what the chip is, for example. a not chip might have a not gate symbol as the icon
   - however for more advanced/complicated chips, they will have a limited rendering canvas as the icon, for example a timer that needs to display how far it is
   
