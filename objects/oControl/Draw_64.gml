

if (startTimer > 0 && startTimer < 4*60) {
	draw_set_color(c_white);
	draw_set_font(fNeue);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	var str = string(floor(startTimer/60));
	if (startTimer <= 60) {
		str = "GO!";
	}
	draw_text_outline(1600/2, 900/2, str, c_white, 1);
}

draw_sprite(sProgressline, 0, 1600/2, 30);
with (oPetrock) {
	draw_sprite_ext(sprite_index, image_index, 1600/2 + ((x/room_width)-0.5)*1000, 30 , 0.5, 0.5, 0, c_white, 1);	
}

if (global.playerRock.finished >= 0) {
	draw_set_color(c_white);
	draw_set_font(fNeue);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	var str = "";
	switch (global.playerRock.finished) {
		case 0:
			str = "You won!";
			break;
		case 1:
			str = "You placed 2nd";
			break;
		case 2:
			str = "You placed 3rd";
			break;
		case 3:
			str = "You placed 4th";
			break;
	}
	
	draw_text_outline(1600/2, 900/2 - 50, str, c_white, 1);
	draw_text_outline(1600/2, 900/2+ 70, string(elapsed) + "s", c_white, 1);
	
	if (victoryTime > 60) {
		draw_set_font(fNeueSmaller);
		draw_text_outline(1600/2, 900/2+180, "Press \"R\" to play again", c_white, 1);
	}
}