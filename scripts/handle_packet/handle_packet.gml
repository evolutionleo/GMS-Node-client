var buff = argument0 ///@arg buff
var cmd = string_upper(buffer_read(buff, buffer_string))
show_debug_message("Recieved "+ cmd + " command")

switch(cmd) {
	case "HELLO":
		server_time = buffer_read(buff, buffer_string)
		room_goto_next()
		show_debug_message("Got greetings from server :)")
		show_debug_message("Time: "+server_time)
		break
	case "LOGIN":
		status = buffer_read(buff, buffer_string)
		
		if(status == "TRUE") {
			show_message_async("Login success!")
			
			var target_room = buffer_read(buff, buffer_string)
			target_x = buffer_read(buff, buffer_s32)
			target_y = buffer_read(buff, buffer_s32)
			var name = buffer_read(buff, buffer_string)
			
			show_debug_message("Moving to room: "+target_room+", pos: ("+string(target_x)+"; "+string(target_y)+")")
			target_room = asset_get_index(target_room)
			
			room_goto(target_room)
			
			
			var player = instance_create_layer(target_x, target_y, "Instances", oPlayer)
			with(player) {
				self.name = name
			}
		}
		else if(status == "FALSE") {
			show_message("Login failed. Incorrect username or password")
		}
		else {
			show_message("Error! Unknown status: "+status)
		}
		break
	case "REGISTER":
		var status = buffer_read(buff, buffer_string)
		
		if(status == "TRUE") {
			show_message("Register success! Please Login.")
		}
		else if(status == "FALSE") {
			show_message("Register failed. Username is already taken")
		}
		else {
			show_message("Error! Unknown status: "+status)
		}
		break
	case "POS":
		var username = buffer_read(buff, buffer_string)
		var target_x = buffer_read(buff, buffer_s32)
		var target_y = buffer_read(buff, buffer_s32)
		
		var found_player = noone
		
		with(oRemotePlayer)
		{
			if(self.name == username)
			{
				found_player = self
				x = target_x
				y = target_y
				alarm[1] = delta
				break
			}
		}
		
		if(found_player == noone) {
			found_player = instance_create_layer(target_x, target_y, "Instances", oRemotePlayer)
			found_player.name = username
		}
		break
		case "WARP":
			var target_room = buffer_read(buff, buffer_string)
			target_x = buffer_read(buff, buffer_s32)
			target_y = buffer_read(buff, buffer_s32)
			
			show_debug_message("Moving to room: "+target_room+", pos: ("+string(target_x)+"; "+string(target_y)+")")
			target_room = asset_get_index(target_room)
			
			
			with(oPlayer) {
				x = target_x
				y = target_y
				event_user(0)
			}
			
			room_goto(target_room)
			break
		case "LEAVE":
			var username = buffer_read(buff, buffer_string)
			with(oRemotePlayer) {
				if(self.name == username) instance_destroy()
			}
			break
}