Head and go seek
================
(name to be determined)

Hide your head and have others find it within a time limit.

Rules
-----
The rules are simple as the datapack will handle all of that for the
player.

1.  Hide your head within the time limit
2.  Have someone find your head within the time limit of placing the
    head (and other factors)

Overview
--------
when a player agrees to hide a head a scorboard objective will be
assigned to track the time.

```cr
{namespace}.head.time = minecraft::stat::played_one_minute
```

if placing the head takes more then a minute place the head where the
place is (if criteria met)

when the player finishes hiding it a scoreboard objective will be
assigned.

```cr
{namespace}.head.pos = player.pos

{namespace}.head.time = {namespace}.head.MAX - {namespace}.head.time
```

Then any other play can attempt to find the head.

The datapack checks the list and lets the user pick from that list.
