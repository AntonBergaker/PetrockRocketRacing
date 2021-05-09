
if (target == noone) {
	with (oPetrock) {
		if (isPlayer) {
			other.target = id;
			break;
		}
	}
}

if (target != noone) {
	x = clamp(target.x, width/2, room_width-width/2);
	y = clamp(target.y, height/2, room_height-height/2);
}

x0 = x - width /2;
y0 = y - height / 2;
x1 = x + width /2;
y1 = y + height / 2;

shake -= 5/60;
shake *= 0.9;

if (shake < 0) {
	shake = 0;
}

camera_set_view_pos(cam,
	x - width /2 + random_range(-shake, shake),
	y - height/2 + random_range(-shake, shake)
);
camera_set_view_size(cam, width, height);