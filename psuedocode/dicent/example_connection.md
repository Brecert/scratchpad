connection start
```sh
client
get 'example.com/guild_name/' with 
    query: generate_connection
    id: 1323
    client_id: 'MacOS Computer'
    token: 'aa-bb-cc-dd-ee'
    
server
get '/:guild/'
    query: Query
    id: number
    client_id: string
    token: string
    
    if client_id in clients[id] then
      verify the token with the ip address 
      otherwise
      ask to generate token if token generation is enabled
      
      if verified then
        # return a temporary ws key to the client #
        send { query: temporary_key key: 'secret-temporary-key' }
        
        
client
when the client recieves the key then
    wss 'example.com/guild_name/ with
      query: initial_connection
      token: 'secret-temporary-key'
      id: 132
      
server
  when wss recieves initial_connection
    query: Query
    token: string
    id: number
    
    if token exists and is verified then
      send { query: connected, connected: true }
      
client
when client recieves connected
  request all client data
  
server
  send all client data
  
```
