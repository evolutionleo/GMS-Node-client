/// @desc
hmove = kright - kleft
vmove = kdown - kup
if(kmove) {
	var dir = point_direction(0, 0, hmove, vmove)
	hsp = lengthdir_x(spd, dir)
	vsp = lengthdir_y(spd, dir)
	
	collision(oWall)
	event_user(0)
}