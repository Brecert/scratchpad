# initial testing data format

to keep data usage as low as possible
all data names will be kept as short as possbile
```js
// Error
// Used for connection errors
// If 0 then no error
e: 0,

// Version
// The version of the protocol
v: 1,

// Query
// The code (or string) for what query is performed
q: 2

// Data
// The data sent, only used for some things, otherwise does not exist
d?: { message: "Hello World!", timestamp: 121312 }
```

Data Types
```stylus
Message {
  // a message
  message: string
  
  // a unix timestamp
  timestamp: int
}
```

Query Codes

> 0 Initial query sent when connecting  (out)
>
> 0 Query response after connecting (in)
>
> 1 Recieved a resonse for any message (in and out)
>
> 2 A Message (in and out)
