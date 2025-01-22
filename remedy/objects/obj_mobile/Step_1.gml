// Update window dimensions
width = window_get_width();
height = window_get_height();
scale = min(width/160, height/140);
button_scale = min((width/1.5)/160, height/140);
button_scale *= global.mobile_button_scale;

// Where are the mobile buttons located?
var _offset = 36*button_scale;
var _percent = height - 2*_offset;
button_dx = 48*button_scale;
button_dy = _offset + _percent * global.mobile_button_height;
button_ix = width - 48*button_scale;
button_iy = button_dy;

// Reset inputs
global.mobile_up = false;
global.mobile_down = false;
global.mobile_left = false;
global.mobile_right = false;
global.mobile_interact = false;
interact_hold = false;

// Read inputs
if (global.is_mobile) {
	var _boff = 48*button_scale;
	
	var _hasdir = false;
	for (var i = 0; i < MOBILE_DEVICE_COUNT; i++) {
		if (!device_mouse_check_button(i, mb_left)) continue;
	
		var _mx = device_mouse_raw_x(i);
		var _my = device_mouse_raw_y(i);
	
		// Interact button
		if (point_in_rectangle(_mx, _my, button_ix-_boff, button_iy-_boff, button_ix+_boff, button_iy+_boff)) {
			interact_hold = true;
			if (device_mouse_check_button_pressed(i, mb_left)) {
				global.mobile_interact = true;
			}
		}
	
		// Dpad
		else if (!_hasdir and point_in_rectangle(_mx, _my, button_dx-_boff, button_dy-_boff, button_dx+_boff, button_dy+_boff)) {
			if (point_distance(_mx, _my, button_dx, button_dy) > 9 * button_scale) {
				_hasdir = true;
				var _dir = point_direction(button_dx, button_dy, _mx, _my);
				if (_dir < 68 or _dir > 292) global.mobile_right = true;
				if (_dir < 158 and _dir > 32) global.mobile_up = true;
				if (_dir < 248 and _dir > 122) global.mobile_left = true;
				if (_dir < 338 and _dir > 212) global.mobile_down = true;
			}
		}
	}
}
