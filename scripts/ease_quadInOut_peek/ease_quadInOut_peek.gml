/// @description ease_quadInOut_peek
/// @param start
/// @param end
/// @param currenttime
/// @param peek
/// @param totaltime
function ease_quadInOut_peek(argument0, argument1, argument2, argument3, argument4) {


	var _start = argument0;
	var _end = argument1;
	var _current = argument2;
	var _peek = argument3;
	var _total = argument4; 

	if (_current < _peek) {
		return ease_quadInOut(_start, _end, _current, _peek);
	} else {
		return ease_quadInOut(_end, _start, _current- _peek, _total-_peek);
	}


}
