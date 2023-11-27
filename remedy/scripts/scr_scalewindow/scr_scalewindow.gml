function scr_scalewindow() {
	//scales the window
	if (global.windowed<1 || global.windowed>8)
	    global.windowed=2;

	//GM5
	//scale_window=global.windowed*100;
	//GM7
	window_set_size(160*global.windowed,140*global.windowed);
	window_center();



}
