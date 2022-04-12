/// @description Insert description here
// You can write your code in this editor


acceleration_x = 0;

if( !stunned ){
	if( keyboard_check(vk_left) && (speed_x > -mMaxspeed_x) ){
		acceleration_x = -movement;
		direction = false;
		
		sprite_index = sPlayerL;
		image_speed = 0.5;
		x -= movement;
	}
	if( keyboard_check(vk_right) && (speed_x < mMaxspeed_x) ){
		acceleration_x = movement;
		direction = false;
		
		sprite_index = sPlayerR;
		image_speed = 0.5;
		x += movement;
	}
	//delete later
	if( !keyboard_check(vk_left) && !keyboard_check(vk_right) ){
		image_index = 0;
		image_speed = 0;	
	}

}



