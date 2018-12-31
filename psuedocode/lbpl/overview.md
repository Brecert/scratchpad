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
  * To make the language extendable
    * Writing logic should be very simple, for example, a not gate 
      ```js
      this.output[0] = (!this.input[0].value);
      this.emit(0) 
      ```

