/// @desc Send pos
var buff = buffer_create(1, buffer_grow, 1)
buffer_write(buff, buffer_string, "pos")
buffer_write(buff, buffer_s32, x)
buffer_write(buff, buffer_s32, y)

network_write(oClient.socket, buff)