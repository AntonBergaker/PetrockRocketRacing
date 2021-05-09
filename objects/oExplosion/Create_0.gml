
var dist = point_distance(x, y, global.playerRock.x, global.playerRock.y);
var shake = clamp(15 - dist/300, 0, 10);
oCamera.shake += shake;

if (shake > 0) {
	var aud = audio_play_sound(sndExplosion, 0, false);
	audio_sound_pitch(aud, random_range(0.9, 1.1));
	audio_sound_gain(aud, shake/10, 0);
}