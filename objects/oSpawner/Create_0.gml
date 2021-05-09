for (var i=0;i<4;i++) {
	var _inst = instance_create_layer(x+random_range(-50, 50), y+random_range(-50, 50), layer, oPetrock);
	_inst.image_index = i;
	_inst.isPlayer = i == 0;
	if (i == 0) {
		global.playerRock = _inst; ///@is {oPetrock}
	}
	_inst.rockIndex = i;
}
instance_destroy();