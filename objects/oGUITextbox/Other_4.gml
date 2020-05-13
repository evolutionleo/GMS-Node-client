/// @desc
if(!variable_global_exists("focus"))
	global.focus = noone
if(!variable_global_exists("uppercase"))
	global.uppercase = false
if(global_variable != "" and !variable_global_exists(global_variable))
	variable_global_set(global_variable, "")