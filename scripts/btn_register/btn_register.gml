if(global.username == "") {
	show_message("Error: Username can't be blank")
}
else if(global.password == "") {
	show_message("Error: Username can't be blank")
}
else {
	var buff = buffer_create(1, buffer_grow, 1);
	buffer_seek(buff, buffer_seek_start, 0)
	
	buffer_write(buff, buffer_string, "register")
	buffer_write(buff, buffer_string, global.username)
	buffer_write(buff, buffer_string, md5_string_utf8(global.password))
	//buffer_write(buff, buffer_string, global.password)
	
	network_write(oClient.socket, buff)
}