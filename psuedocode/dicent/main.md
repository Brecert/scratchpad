### Server Instance
```
| Messages
  | Message
    | User ID
    | Message
    | Timestamp
    | Last Edited
    | Data[User ID]
      | All pulled from cached data, if cache not present then no image displayed
| User ID's
  | User ID
    | Cached
      | Username
      | Nickname
      | Profile Picture
    | Non-Cached
      | Date Joined
      | Last Message (technichally a database job)
      | Tags
| User Unique Tokens
```

### Client Instance
```
| Self
  | User ID
  | Username
  | Profile Picture
| Server ID's
| Server Unique Tokens
| Friends
  | Friend Unique Tokens (Exchanged when clicking friends button)
```

### Connection Example
On a join page

Join page contacts server, server generates a temporary token for joining

If join token is sent to the server from the User ID then generate a serverside Token for the User ID

the client config for storing will be like so

```
{
  "dicent": {
    "address": "https://dicent.com",
    "token": "AKmDO3m.O093kkme0M"
  }
}
```

On any subsequent connection the address is pinged and a token is sent in an attempt to log in (or something like that)











