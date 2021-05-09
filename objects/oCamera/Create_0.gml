shake = 0;
cam = view_get_camera(0); ///@is {camera}

ratio = 16/9;

width = 1600;
height = 900;

lastHeight = 900;
lastWidth = 1600;

x0 = x - width /2; ///@is {number}
y0 = y - height / 2; ///@is {number}
x1 = x + width /2; ///@is {number}
y1 = y + height / 2; ///@is {number}

target = noone; ///@is {oPetrock}

display_set_gui_size(1600, 900);