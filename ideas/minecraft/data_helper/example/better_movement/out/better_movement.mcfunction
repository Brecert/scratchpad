scoreboard objectives add sprint_time sprint_one_cm
scoreboard objectives add player_is_sprinting dummy
scoreboard objectives add last_sprint_time dummy

execute unless score @s sprint_time matches 0 run scoreboard players set @s player_is_sprinting 1

execute if player_is_sprinting matches 1.. run scoreboard players operation @s sprint_time = @s last_sprint_time
execute if player_is_sprinting matches 1.. run scoreboard players set @s last_sprint_time = 0

execute if player_is_sprinting matches 1.. if sprint_time matches 20.. run effect @s speed 0 1

execute unless player_is_sprinting matches 1.. run scoreboard players operation @s last_sprint_time = @s sprint_time
execute unless player_is_sprinting matches 1.. run scoreboard players set @s sprint_time 0
execute unless player_is_sprinting matches 1.. run scoreboard players set @s player_is_sprinting 0
