/// @desc
show_debug_message("Networking event triggered.")

var type = async_load[? "type"]
var buff = async_load[? "buffer"]
var size = async_load[? "size"]


switch(type) {
	case network_type_data:
		buffer_copy(buff, 0, size, saved_buffer, buffer_tell(saved_buffer))
		buffer_seek(saved_buffer, buffer_seek_relative, size+1)
		
		while(true) {
			var _size = buffer_peek(saved_buffer, reading, buffer_u8)
			
			if(buffer_get_size(saved_buffer) >= reading + _size) {
				buffer_copy(saved_buffer, reading, size, cut_buffer, 0)
				buffer_seek(cut_buffer, 0, 1)
				
				handle_packet(cut_buffer)
				
				if(buffer_get_size(saved_buffer) != reading+size) {
					reading += size
				}
				else {
					buffer_resize(saved_buffer, 1)
					reading = 0
					break
				}
			}
			else { break }
		}
		
		break
}