

var _x = x;
var _y = y;

// Continue broken on html5?
with (other) repeat(1) {
	var _dist = point_distance(phy_position_x, phy_position_y, _x, _y);
	var _strength = (350 - _dist)/250;
	
	if (_strength <= 0) {
		continue
	}
	
	var _dX = _strength * (phy_position_x-_x)/_dist;
	var _dY = _strength * (phy_position_y-_y)/_dist;
	
	physics_apply_impulse(_x, _y, _dX, _dY);
	
	if (object_is_ancestor(object_index, oObstacles)) {
		(/*#cast*/ self /*#as oObstacles*/).hp -= _strength*3;
	}
}