# Dicent

```js
func main {
  const { ping, login, message } = enum { PING, LOGIN, MESSAGE }

  // scope
  macro @(var: Macro.Property) {
    this.{{var}}
  }

  // seconds
  unit (var)s {
    new Unit.Time(1000 * var)
  }

  send login "token" -> res {
    if res.logged_in == true {
      connected()
    }
  }

  func connected {
    async -> {
      every 3s {
        send ping
      }
    }

    form.on "submit" -> data {
      send message data
    }
  }
}
```

```js
function main() {
  const [ ping, login, messae ] = enum { PING, LOGIN, MESSAGE }
  
  send(login, "token", res => {
    if(res.logged_in === true) {
      connected()
    }
  })
  
  function connected() {
    _temp = async () => {
      setInterval(send(ping), 3000)
    }
    
    form.on("submit", data => {
      send(message, data)
    })
  }
}
```
