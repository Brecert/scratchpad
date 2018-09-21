

_not_ « not
_not_ » not

_print_ « print("Hello")
_not_ » _print_

Node
; // The id of the node
| id : Symbol
|
; // Array of Input Values (Updated from external node)
| inputs : Array(Value)
|
; // Array of Output Values (Updated from @update)
| outputs : Array(Value)
|
; // List of connections to other nodes
| connections : Hash(Symbol, Node)
|
; // When initialized add to @nodes
| ~init
|
; // Update output values using inputs
| @update
  | update outputs using inputs
  
@nodes « {} of Symbol, Node

def traverse:
	for node in @nodes:
		for id, port in node.connections:
			@nodes[id][port].update(not.output)

def update:
	for node in @nodes:
		node.update()

