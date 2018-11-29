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
// If 0 then assume latest version (not recommended)
v: 1,

// Query
// The code (or string) for what query is performed
q: 2

// Data
// The data sent, only used for some things, otherwise does not exist
d?: { message: "Hello World!", timestamp: 1543469371 }
```

Data Types
```stylus
Message {
  // a message
  message: string
  
  // A unique identifier, can be any uint within 16,777,216 (8^8)
  // The identifier is only kept for 15 seconds
  // That is the alotted time for a message to send before failing
  // The chances of overriding someone elses identifier is rare
  unique: uint
  
  // a unix timestamp
  timestamp: uint
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
