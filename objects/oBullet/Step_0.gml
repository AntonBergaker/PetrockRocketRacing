if (point_distance(0, 0, phy_speed_x, phy_speed_y) > 5) {
	var target = -point_direction(0,0,phy_speed_x, phy_speed_y);
	phy_rotation = angle_lerp(phy_rotation, target, 0.5);
}
if (wasDestroyed) {
	destroyedTimer++;
	if (destroyedTimer > 5) {
		instance_destroy();
	}
}