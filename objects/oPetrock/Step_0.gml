

if (firstStep) {
	firstStep = false;
	switch (rockIndex) {
		case 1:
			aiHateOfObjects = 0.75;
			aiTriggerUnhappiness = 5;
			break;
		case 2:
			aiHateOfObjects = 0.5;
			aiTriggerUnhappiness = 10;
			break;
		case 3:
			aiHateOfObjects = 0.25;
			aiTriggerUnhappiness = 15;
			break;
	}
}

bazookaCooldown--;
if (hasSpnkr) {
	bazookaCooldown--;
}
blockedTimer--;

var fired = false;
var targetX = x;
var targetY = y;

if (isPlayer) {
	targetX = mouse_x;
	targetY = mouse_y;
	if (mouse_check_button_pressed(mb_left)) {
		fired = true;
	}
} else {
	scr_ai_step();
	targetX = aiTargetX;
	targetY = aiTargetY;
	fired = aiShoot;
}


if (bazookaCooldown <= 0 && fired && blockedTimer <= 0) {
	bazookaCooldown = bazookaMaxCooldown;
	var len = 20;
	var dir = bazookaDir;
	var _x = bazookaX + lengthdir_x(len, dir+6);
	var _y = bazookaY + lengthdir_y(len, dir+6);
	var inst = instance_create_depth(_x, _y, depth+1, oBullet);
	var impulse = 3;
	with (inst) {
		physics_apply_impulse(phy_position_x, phy_position_y, lengthdir_x(impulse, dir), lengthdir_y(impulse, dir));
		phy_rotation = -dir;
	}
	// Recoil
	impulse = -1;
	physics_apply_impulse(phy_position_x, phy_position_y, lengthdir_x(impulse, dir), lengthdir_y(impulse, dir));
	physics_apply_angular_impulse(0.01 * sign(targetX - x));
}


#region bazooka
var _dir = (-phy_rotation)+270;
image_angle = -phy_rotation;
var _len = 15;

var _bX = x+lengthdir_x(_len, _dir);
var _bY = y+lengthdir_y(_len, _dir);

bazookaDir = point_direction(_bX, _bY, targetX, targetY);

var _nearUpDown = min(abs(angle_difference(bazookaDir, 90)), abs(angle_difference(bazookaDir, 270)));

bazookaRelX = lengthdir_x(_len-15+_nearUpDown/4, _dir);
bazookaRelY = lengthdir_y(_len-15+_nearUpDown/4, _dir);

bazookaX = x + bazookaRelX;
bazookaY = y + bazookaRelY;
bazookaDir = point_direction(bazookaX, bazookaY, targetX, targetY);
#endregion
