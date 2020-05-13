/// @desc
draw_set_get()

draw_set_halign(halign)
draw_set_valign(valign)
draw_set_font(font)
draw_set_color(color)
draw_set_alpha(alpha)

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

draw_text_transformed(xx, yy, text, scale, scale, 0)

draw_set_reset()