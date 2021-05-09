
draw_self();

var _off = -30;
var _cooldown = ease_quadIn(0, 30, clamp(bazookaCooldown, 0, 30), 30);
var _x = x+bazookaRelX + lengthdir_x(_cooldown*2, bazookaDir+180);
var _y = y+bazookaRelY + lengthdir_y(_cooldown*2, bazookaDir+180);

var _dir = bazookaDir;
var _xFlip = 1;
if (abs(angle_difference(0, _dir)) > 90) {
	_dir = 180 + _dir;
	_off = 30;
	_xFlip = -1;
}

draw_sprite_ext(sBazooka, hasSpnkr ? 1 : 0, _x, _y, _xFlip, 1, _dir+_off, c_white, 1);