timer++;

image_xscale = 1.1 + sin(timer/15)*0.2;
image_yscale = image_xscale;
var _inst = instance_place(x, y, oPetrock);
if (instance_exists(_inst)) {
	_inst.hasSpnkr = true;
	instance_destroy();
}