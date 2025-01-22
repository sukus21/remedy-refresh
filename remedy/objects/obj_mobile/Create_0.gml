if (!global.is_mobile or instance_number(self.object_index) > 1) {
	instance_destroy(self);
	exit;
}

device_mouse_dbclick_enable(false);
application_surface_draw_enable(false);

button_dx = 0;
button_dy = 0;
button_ix = 0;
button_iy = 0;
button_scale = 1;

width = 0;
height = 0;
scale = 1;
interact_hold = false;
