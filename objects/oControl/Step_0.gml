if (startTimer > 0) {
	startTimer--;
	
	if (startTimer == 4*60) {
		var _aud = audio_play_sound(sndNoot, 0, 0);
		audio_sound_gain(_aud, 0.5, 0);
	}
	
	if (startTimer <= 0) {
		with (oPetrock) {
			blockedTimer = -1;
		}
	} else {
		with (oPetrock) {
			blockedTimer = 2;
		}
	}
} else {
	if (global.playerRock.finished == -1) {
		elapsed += 1/60;
	}
}

if (keyboard_check_pressed(ord("R"))) {
	game_restart();
}

with (oPetrock) {
	if (finished >= 0) {
		continue;
	}
	if (instance_position(x, y, oVictoryZone)) {
		blockedTimer = 99999;
		finished = other.finishedRocks;
		other.finishedRocks++;
		aiState = AiState.Finished;
	}
}

if (global.playerRock.finished >= 0) {
	victoryTime++;
}