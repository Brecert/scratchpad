module: better_movement

/*
# Pre Variable
# Inserted into code raw and not stored as a scoreboard objective
~max_time = 20
~player = @s
*/

set sprint_time : sprint_one_cm
set player_is_sprinting : dummy

# to_bool is a macro that converts any number over 1 to 1
# and sets the internal type to bool_literal so if statements work with no extra work
#
# that's all it does but it's useful
player_is_sprinting = sprint_time.to_bool

if player_is_sprinting
  sprint_time = last_sprint_time
  last_sprint_time = 0
  
  if sprint_time > 20 
    effect @s speed
else
  last_sprint_time = sprint_time
  sprint_time = 0
  player_is_sprinting = 0
  
