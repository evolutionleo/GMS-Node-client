/// @desc

saved_buffer = buffer_create(1, buffer_grow, 1)
reading = 0
cut_buffer = buffer_create(1, buffer_grow, 1)

socket = network_create_socket(network_socket_tcp)

// Production
//network_connect_raw(socket, "62.113.112.109", 1337)
// Debug
//network_connect_raw(socket, "127.0.0.1", 1338)
// Variable
network_connect_raw(socket, global.ip, real(global.port))