/// @description Insert description here
// You can write your code in this editor

if( keyboard_check(vk_right) ){
	x += movement;
	sprite_index = sPlayerR;
	image_speed = 0.5;
} else if( keyboard_check(vk_left) ){
	x -= movement;
	sprite_index = sPlayerL;
	image_speed = 0.5;
} else{
	image_index = 0;
	image_speed = 0;
}