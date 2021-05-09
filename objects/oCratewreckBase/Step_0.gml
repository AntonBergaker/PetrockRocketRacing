timeLeft--;
if (timeLeft < 30) {
	image_alpha = timeLeft / 30;
}
if (timeLeft < 0) {
	instance_destroy();
}