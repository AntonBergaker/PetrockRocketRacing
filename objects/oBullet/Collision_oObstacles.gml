/// col
if (wasDestroyed) {
	exit;
}
wasDestroyed = true;
visible = false;
instance_create_layer(x, y, "Effects", oExplosion);
instance_destroy();