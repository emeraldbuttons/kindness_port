/// @description Insert description here
// You can write your code in this editor


oPhysics.acceleration_x = 0;
oPhysics.acceleration_y = 0;


if( keyboard_check(vk_right) && (oPhysics.speed_x > mMaxspeed_x) ){
	x += movement;
	
	oPhysics.acceleration_x = -movement;
	direction = false;
	
	sprite_index = sPlayerR;
	image_speed = 0.5;
} else if( keyboard_check(vk_left) && (oPhysics.speed_x > mMaxspeed_x) ){
	x -= movement;
	
	oPhysics.acceleration_x = movement;
	direction = true;
	
	sprite_index = sPlayerL;
	image_speed = 0.5;
} else{
	image_index = 0;
	image_speed = 0;
}


