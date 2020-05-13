var obj = argument0
#region Y collision
var coly = place_meeting(x,y+vsp,obj)
if(coly)
{
	while(!place_meeting(x,y+sign(vsp),obj))
	{
		y += sign(vsp)
		if(vsp == 0)
			break
	}
	vsp = 0
}
//else{
y += vsp
//}
#endregion
#region X collision

var colx = place_meeting(x+hsp,y,obj)
if(colx)
{
	while(!place_meeting(x+sign(hsp),y,obj))
	{
		x += sign(hsp)
		if(hsp == 0)
			break
	}
	hsp = 0
}

x += hsp
#endregion