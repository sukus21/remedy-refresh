function sfx_play(_soundid, _loop = false) {
	if (global.sound) audio_play_sound(_soundid, 10, _loop);
}

function music_play(_soundid, _loop = true) {
	if (global.playmusic) audio_play_sound(_soundid, 10, _loop);
}

function scr_stopmusic() {
	audio_stop_sound(snd_song1);
	audio_stop_sound(snd_song2);
	audio_stop_sound(snd_song3);
	audio_stop_sound(snd_song4);
	audio_stop_sound(snd_song5);
	audio_stop_sound(snd_song6);
	audio_stop_sound(snd_win);
	audio_stop_sound(snd_boss1);
	audio_stop_sound(snd_boss2);
	audio_stop_sound(snd_song7);
}
