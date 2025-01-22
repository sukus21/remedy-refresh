function sfx_play(_soundid, _loop = false) {
	if (global.sound) audio_play_sound(_soundid, 10, _loop);
}
