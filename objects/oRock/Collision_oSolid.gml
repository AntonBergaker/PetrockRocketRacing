if (collisionImmunity <= 0 && phy_speed > 5) {
	hp -= phy_speed/2;
	collisionImmunity = 10;
}