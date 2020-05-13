var sock = argument0  ///@arg socket
var buff = argument1 ///@arg buff

var pack_size = buffer_tell(buff)
var buff_pack = buffer_create(1, buffer_grow, 1)

buffer_seek(buff_pack, buffer_seek_start, 0)

buffer_write(buff_pack, buffer_u8, pack_size+1)
buffer_copy(buff, 0, pack_size, buff_pack, 1)

buffer_seek(buff_pack, buffer_seek_start, pack_size+1)

network_send_raw(sock, buff_pack, buffer_tell(buff_pack))

buffer_delete(buff)
buffer_delete(buff_pack)