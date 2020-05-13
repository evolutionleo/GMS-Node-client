var function = argument0 ///@arg script
var arguments = argument1 ///@arg arguments_array

switch(array_length_1d(arguments))
{
	case 0: script_execute(function); break
	case 1: script_execute(function, arguments[0]); break
	case 2: script_execute(function, arguments[0], arguments[1]); break
	case 3: script_execute(function, arguments[0], arguments[1], arguments[2]); break
	case 4: script_execute(function, arguments[0], arguments[1], arguments[2], arguments[3]); break
	case 5: script_execute(function, arguments[0], arguments[1], arguments[2], arguments[3], arguments[4]); break
}