//Draw proportional font
function scr_drawtext(pfx, pfy, pftext, pfsize, pffont) {
	pfx = floor(pfx); //x origin
	pfy = floor(pfy); //y origin

	var _pflen = string_length(pftext);
	var _pfx2 = pfx; //cursor x
	var _pfy2 = pfy; //cursor y
	var _pfchar = 0; //current character 0-94

	//draw
	if (_pflen > 0) {
	    for (var i = 0; i < _pflen; i++) {
	        _pfchar = ord(string_char_at(pftext, i+1)) - 32;
	        if (_pfchar == 3) {
	            _pfx2 = pfx;
	            _pfy2 += pfsize;
	        }
	        else {
	            draw_sprite(pffont, _pfchar, _pfx2, _pfy2);
	            _pfx2 += pfsize;
	        }
	    }
	}
}
