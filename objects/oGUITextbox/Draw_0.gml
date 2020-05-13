/// @desc
draw_set_get()
draw_self()
if(global.focus == self) {
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true)
}
#region Draw_set
draw_set_halign(halign)
draw_set_valign(valign)
draw_set_font(font)
draw_set_color(color)
draw_set_alpha(alpha)
#endregion
#region Define draw pos
var xx, yy

switch(halign) {
	case fa_center:
		xx = x
		break
	case fa_left:
		xx = bbox_left
		break
	case fa_right:
		xx = bbox_right
		break
}

switch(valign) {
	case fa_middle:
		yy = y
		break
	case fa_top:
		yy = bbox_top
		break
	case fa_bottom:
		yy = bbox_bottom
		break
}
#endregion

var txt = text == "" ? default_text : text

draw_text_transformed(xx, yy, txt, scale, scale, 0)
draw_set_reset()