# Dicent

```js
const { ping, login, message } = enum { PING, LOGIN, MESSAGE }

// scope
macro @(var) {
  this.{{var}}
}

// seconds
unit (var)s {
  new Unit.Time(1000 * var)
}

send login "token" -> res {
  if res.logged_in == true {
    load_rest()
  }
}

async -> {
  every 3s {
    send ping
  }
}

form.on "submit" -> data {
  send message data
}
```
