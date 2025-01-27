/**
This is a tidy version of the built-in background compatibility script.
Until I can figure out how to handle backgrounds in a prettier way, this stays...
*/
function get_background() {
	var _layers = layer_get_all();
	var _lowest_depth = -infinity;
	var _lowest_background = undefined;

	// Find lowest layer that has a background
	for (var i = 0; i < array_length(_layers); i++) {
		var _layer = _layers[i];
		
		// Find background element
		var _background = layer_background_get_id(_layer);
		if (_background == -1) {
			continue;
		}
		
		// Is this the lowest background we have seen thus far?
		var _depth = layer_get_depth(_layer);
		if (_depth > _lowest_depth) {
			_lowest_depth = _depth;
			_lowest_background = _background;
		}
	}

	return _lowest_background;
}
