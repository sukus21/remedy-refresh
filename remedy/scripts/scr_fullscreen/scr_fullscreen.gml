function fullscreen_set(_enable) {
	window_set_fullscreen(_enable);
	if (!_enable) {
		scale_window();
	}
}

function fullscreen_get() {
	return window_get_fullscreen();
}

// Scales the window
function scale_window() {
	if (global.windowed < 1 || global.windowed > 8) {
	    global.windowed = 2;
	}

	window_set_size(160*global.windowed, 140*global.windowed);
	window_center();
}
