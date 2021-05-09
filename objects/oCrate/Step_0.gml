collisionImmunity--;
if (hp <= 0) {
	var dist = point_distance(x, y, global.playerRock.x, global.playerRock.y);
	var shake = clamp(15 - dist/300, 0, 10);

	if (shake > 0) {
		var aud = audio_play_sound(sndWood, 0, false);
		audio_sound_pitch(aud, random_range(0.9, 1.1));
		audio_sound_gain(aud, shake/10, 0);
	}
	
	var _wrecks/*:oCratewreckBase[]*/ = [];
	array_push(_wrecks, instance_create_depth(x, y, depth+1, oCratewreck0));
	repeat(irandom_range(1,2)) {
		array_push(_wrecks, instance_create_depth(x+random_range(-50, 50), y+random_range(-50, 50), depth+1, oCratewreck1));
	}
	repeat (irandom_range(1,4)) {
		array_push(_wrecks, instance_create_depth(x+random_range(-50, 50), y+random_range(-50, 50), depth+1, oCratewreck2));
	}
	
	for (var i=0;i<array_length(_wrecks);i++) {
		with (_wrecks[i]) {
			physics_apply_impulse(phy_position_x, phy_position_y, 
				other.phy_speed_x/50 + clamp(other.x - x, 0, 60)/140 + random_range(-0.4, 0.4), 
				other.phy_speed_y/50 + clamp(other.y - y, 0, 60)/140 + random_range(-0.4, 0.4));
			physics_apply_angular_impulse(random_range(0.01, 0.05)*choose(-1,1));
		}
	}
	
	instance_destroy();
}