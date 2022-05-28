/// @description Insert description here
// You can write your code in this editor

player(x,y);

acceleration_x = 0;

//walking
if( !stunned ){
	if( keyboard_check(vk_left) && (speed_x > -mMaxspeed_x) ){
		acceleration_x = -movement;
		direction = false;
		
		sprite_index = sPlayerL;
		image_speed = 0.5;
		speed_x += -movement;
	}
	if( keyboard_check(vk_right) && (speed_x < mMaxspeed_x) ){
		acceleration_x = movement;
		direction = false;
		
		sprite_index = sPlayerR;
		image_speed = 0.5;
		speed_x += movement;
	}
	if( !keyboard_check(vk_left) && !keyboard_check(vk_right) ){
		image_index = 0;
		image_speed = 0;	
	}

}

//friction
if ( (!keyboard_check(vk_left) && !keyboard_check(vk_right)) || abs(speed_x) > mMaxspeed_x ) {
	friction_fun();
}

//jumping
if( !stunned && keyboard_check_pressed(ord("X")) ){
	jumped = false;
	
	//normal jump
	speed_y = -jump;
	jumped = true;
	
}

//gravity
gravity_fun();

//basic collision
//vertical
if( place_meeting(x, y+speed_y, oMaze) ){
	while( !place_meeting(x, y+sign(speed_y), oMaze) ){
		y += sign(speed_y);
	}
	speed_y = 0;
}
if( place_meeting(x, y+speed_y, oMaze2) ){
	while( !place_meeting(x, y+sign(speed_y), oMaze2) ){
		y += sign(speed_y);
	}
	speed_y = 0;
}
//horizontal
if( place_meeting(x+speed_x, y, oMaze) ){
	while( !place_meeting(x+sign(speed_x), y, oMaze) ){
		x += sign(speed_x);
	}
	speed_x = 0;
}
if( place_meeting(x+speed_x, y, oMaze2) ){
	while( !place_meeting(x+sign(speed_x), y, oMaze2) ){
		x += sign(speed_x);
	}
	speed_x = 0;
}

//heart
if( place_meeting(x, y+speed_y, oBigHeart) ){
	while( !place_meeting(x, y+sign(speed_y), oBigHeart) ){
		y += sign(speed_y);
	}
	oBigHeart.visible = false;
}

x += speed_x;
y += speed_y;


