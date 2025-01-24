function get_xview() {
	var _camera = view_get_camera(0);
	return camera_get_view_x(_camera);
}

function set_xview(_x) {
	var _camera = view_get_camera(0);
	var _y = camera_get_view_y(_camera);
	camera_set_view_pos(_camera, _x, _y);
}

function get_yview() {
	var _camera = view_get_camera(0);
	return camera_get_view_y(_camera);
}

function set_yview(_y) {
	var _camera = view_get_camera(0);
	var _x = camera_get_view_x(_camera);
	camera_set_view_pos(_camera, _x, _y);
}

function get_wview() {
	var _camera = view_get_camera(0);
	return camera_get_view_width(_camera);
}

function get_hview() {
	var _camera = view_get_camera(0);
	return camera_get_view_height(_camera);
}
