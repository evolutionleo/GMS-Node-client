var target_room = argument0 ///@arg room

var buff = buffer_create(1, buffer_grow, 1)
buffer_write(buff, buffer_string, "warp")
buffer_write(buff, buffer_string, room_get_name(target_room))

network_write(oClient.socket, buff)