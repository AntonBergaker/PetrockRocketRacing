///@interface {IAiPetrock}
///@self {oPetrock}

enum AiState {
	Normal,
	Jumping,
	AiShootObject,
	Finished,
}

function scr_ai_init() {
	aiTargetX = 0;
	aiTargetY = 0;
	aiShoot = false;
	aiJumpingTimer = 0;
	aiState = choose(AiState.Normal, AiState.AiShootObject); ///@is {AiState}
	aiHateOfObjects = 0.5;
	aiTargetObject = noone; ///@is {oDynamic}
	aiTriggerUnhappiness = 0;
	aiTargetList = ds_list_create();
}

///@self {oPetrock}
function scr_ai_step() {
	aiShoot = false;
	
	var rubberBanding = clamp((x - global.playerRock.x)*2/room_width, 0, 2);
	var triggerDelay = (1+rubberBanding) * aiTriggerUnhappiness;
	
	switch (aiState) {
		case AiState.Normal:
			aiTargetX = x-50;
			aiTargetY = y+50;
			
			if (bazookaCooldown < -triggerDelay && blockedTimer <= 0) {
				aiShoot = true;
				if (random(1) < aiHateOfObjects) {
					aiState = AiState.AiShootObject;
					aiTargetObject = noone;
				}
			}
		
			var insideJump = position_meeting(x, y, oAiJumpZone);
			if (insideJump && blockedTimer <= 0) {
				aiState = AiState.Jumping;
				aiJumpingTimer = 0;
			}
			break;
		case AiState.AiShootObject:
			if (!instance_exists(aiTargetObject)) {
				collision_rectangle_list(x, y-300, x+700, y+300, oDynamic, false, false, aiTargetList, false);
				
				if (ds_list_size(aiTargetList) <= 0) {
					aiState = AiState.Normal;
					break;
				}
				
				var target = aiTargetList[| irandom(ds_list_size(aiTargetList)-1)];
				if (instance_exists(target) && target.object_index == oRock) {
					aiState = AiState.Normal;
					break;
				}
				
				aiTargetObject = target;
			}
			if (instance_exists(aiTargetObject)) {
				aiTargetX = aiTargetObject.x;
				aiTargetY = aiTargetObject.y;
			}
			
			if (bazookaCooldown < -triggerDelay && blockedTimer <= 0) {
				aiShoot = true;
				if (random(1) < aiHateOfObjects) {
					aiState = AiState.AiShootObject;
					aiTargetObject = noone;
				} else {
					aiState = AiState.Normal;
				}
			}
			
			break;
		case AiState.Jumping:
			aiTargetX = x-5;
			aiTargetY = y+100;
		
			if (aiJumpingTimer < 15) {
				aiJumpingTimer++;
			}
			if (aiJumpingTimer == 15) {
				if (bazookaCooldown <= 0) {
					aiJumpingTimer++;
					aiShoot = true;
				}
			}
			if (aiJumpingTimer > 15) {
				aiJumpingTimer++;
				aiTargetX = x - 100;
				aiTargetY = y;
				aiShoot = true;
			}
			
			if (aiJumpingTimer > 120 && blockedTimer <= 0) {
				aiState = AiState.Normal;
			}
			break;
	}

}