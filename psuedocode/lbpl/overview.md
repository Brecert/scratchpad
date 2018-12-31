LBPL : Logic Based Programming Language
---

Use logic gates to program.
Similar to luna-lang or scratch, however with more focus on user friendlyness.

Flaws of luna-lang
- user experience is terrible, loading the editor takes forever, is buggy, and is extrememly slow
- not extrememly beginner friendly, to both programmers and newbies. Both need to learn how the editor works and how the code works.
- As I could barely run the editor, any further flaws haven't been found.
- not embedable (both the editor, and the language (afaik))

Pros of luna-lang
- somewhat intuitive, it just takes time to learn the editor
- if the editor worked correctly, it would be amazing

Flaws of scratch / blocky
- not intuitive when writing actual code.
- does not scale
- it's hard to tell what's happening at a glance

Pros of scratch / blocky
- beginner friendly. While it may not be useful for writing actual code, it does a good job teaching it by keeping the visual elements simple.
- it can easily be extended and embedded into websites (blocky)


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
  With a global tick rate controlling any other chips that use a 
  For example, the timer may need to have a more specific tick rate of 1 tick per millesecond to keep things accurate
  The global tick rate is just a percentage, so 100% would still be 1 tick per millesecond and 200% being 2 ticks per millesecond
  While this is prone to breaking some more sensitive chips, overall it avoids more complications with users creating their own chips without a stdlib and becoming fragmented and hard to control.
  Furthurmore, if the ticker implementation is created correctly, optimization with ticks can be achieved, only ticking when nessisary for similar chips (multiple timer chips do not all have seperate tickers, but rather one unified "global" ticker)
  Unfortunantly it may be hard to create this, but it's possible
- to create a chip like a timer (it counts up and if selected, emits the current value) 
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
   
   global.timer.ticker.onTick = (tick) => {
    this.properties.current_time += 1
     
    if(this.properties.current_time > this.properties.time) {
     this.properties.current_time = this.properties.time
    }
    
    // emit the percentage that's been completed
    this.output[0].value = this.properties.current_time / this.properties.time
    this.emit(0)
   }
  }
  ```
