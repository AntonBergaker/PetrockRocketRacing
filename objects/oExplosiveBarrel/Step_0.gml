collisionImmunity--;
if (hp <= 0) {
	instance_create_layer(x, y, "Effects", oExplosion);
	instance_destroy();
}