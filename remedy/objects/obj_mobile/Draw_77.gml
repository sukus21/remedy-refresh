// Where to draw the game?
var _xpos = 0;
if (width/160 > height/140) {
	_xpos = (width/2) - (160*scale/2);
}

// Draw application surface
draw_surface_ext(application_surface, _xpos, 0, scale, scale, 0, -1, 1);

if (global.is_mobile) {
	// Draw interact button
	draw_sprite_ext(spr_mobile_input, 1, button_ix, button_iy, button_scale*3, button_scale*3, 0, interact_hold ? c_lime : c_white, 1);

	// Draw d-pad
	var _offset = 24*button_scale;
	draw_sprite_ext(spr_mobile_input, 0, button_dx, button_dy-_offset, button_scale, button_scale, 0, global.mobile_up ? c_lime : c_white, 1);
	draw_sprite_ext(spr_mobile_input, 0, button_dx, button_dy+_offset, button_scale, button_scale, 180, global.mobile_down ? c_lime : c_white, 1);
	draw_sprite_ext(spr_mobile_input, 0, button_dx-_offset, button_dy, button_scale, button_scale, 90, global.mobile_left ? c_lime : c_white, 1);
	draw_sprite_ext(spr_mobile_input, 0, button_dx+_offset, button_dy, button_scale, button_scale, 270, global.mobile_right ? c_lime : c_white, 1);

	// Draw directional buttons
	draw_sprite_ext(spr_mobile_input, 3, button_dx+_offset, button_dy-_offset, button_scale, button_scale, 0, (global.mobile_up and global.mobile_right) ? c_lime : c_white, 1);
	draw_sprite_ext(spr_mobile_input, 3, button_dx-_offset, button_dy-_offset, button_scale, button_scale, 90, (global.mobile_up and global.mobile_left) ? c_lime : c_white, 1);
	draw_sprite_ext(spr_mobile_input, 3, button_dx-_offset, button_dy+_offset, button_scale, button_scale, 180, (global.mobile_down and global.mobile_left) ? c_lime : c_white, 1);
	draw_sprite_ext(spr_mobile_input, 3, button_dx+_offset, button_dy+_offset, button_scale, button_scale, 270, (global.mobile_down and global.mobile_right) ? c_lime : c_white, 1);
}
