/// @desc
if(global.focus == self)
{
	if(keyboard_lastkey == vk_backspace) {
		text = string_delete(text, string_length(text), 1)
	}
	else if(keyboard_lastkey == vk_alt 
	or keyboard_lastkey == vk_control 
	or keyboard_lastkey == vk_shift 
	or keyboard_lastkey == vk_delete 
	or keyboard_lastkey == vk_end
	or keyboard_lastkey == vk_insert
	or keyboard_lastkey == vk_escape
	or keyboard_lastkey == vk_printscreen
	or keyboard_lastkey == vk_home
	or chr(keyboard_lastkey) == "") {	}
	else
	{
		if(global.uppercase xor keyboard_check(vk_shift)) {
			key = string_upper(keyboard_lastchar)
		}
		else { key = keyboard_lastchar }
		
		#region Width calculation
		draw_set_get()
		draw_set_halign(halign)
		draw_set_valign(valign)
		draw_set_font(font)
		draw_set_color(color)
		draw_set_alpha(alpha)
		
		var ww = string_width(text+key) 
		
		draw_set_reset()
		#endregion
		if(ww < sprite_width - 10)
			text += key
		
		keyboard_lastchar = ""
	}
	if(global_variable != "")
		variable_global_set(global_variable, text)
}