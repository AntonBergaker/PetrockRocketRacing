///@implements {IAiPetrock}

bazookaDir = 0;
bazookaX = x; /// @is {number}
bazookaY = y; ///@is {number}
bazookaRelX = 0;
bazookaRelY = 0;

bazookaCooldown = 0;
bazookaMaxCooldown = 40;

isPlayer = false;
rockIndex = 0;
image_speed = 0;

firstStep = true;
blockedTimer = -1;

hasSpnkr = false;

finished = -1;

scr_ai_init();