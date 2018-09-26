# note: this would need special compile flags to work because of the long names. 
# note: this is unoptimized, if the --release flag was passed all blocks would be made their own mcfunction.

scoreboard objectives add better_movement.sprint_time sprint_one_cm
scoreboard objectives add better_movement.player_is_sprinting dummy
scoreboard objectives add better_movement.last_sprint_time dummy

execute unless score @s better_movement.sprint_time matches 0 run scoreboard players set @s better_movement.player_is_sprinting 1

execute if better_movement.player_is_sprinting matches 1.. run scoreboard players operation @s better_movement.sprint_time = @s better_movement.last_sprint_time
execute if better_movement.player_is_sprinting matches 1.. run scoreboard players set @s better_movement.last_sprint_time = 0

execute if better_movement.player_is_sprinting matches 1.. if better_movement.sprint_time matches 20.. run effect @s speed 0 1

execute unless better_movement.player_is_sprinting matches 1.. run scoreboard players operation @s better_movement.last_sprint_time = @s better_movement.sprint_time
execute unless better_movement.player_is_sprinting matches 1.. run scoreboard players set @s better_movement.sprint_time 0
execute unless better_movement.player_is_sprinting matches 1.. run scoreboard players set @s better_movement.player_is_sprinting 0
