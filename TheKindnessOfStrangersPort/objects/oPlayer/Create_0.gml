/// @description Insert description here
// You can write your code in this editor

//inherit Physics functionality
event_inherited();

//sprite frame control
image_index = 0;
image_speed = 0;

//rate of accelleration
movement = 1;
jump = 8;
//true : right, false : left
direction_var = true;
//is player on ground
onground = false;
//0 : no, 1 : left, 2 : right
walljumping = 0;
//can we doublejump
doublejump = false;
dead = false;
stunned = false;
start_x = 0;
start_y = 0;

visible = false;

function player(x_par, y_par){
	x = x_par;
	y = y_par;
	start_x = x_par;
	start_y = y_par;
	
	mGravity = 0.4;
	mMaxspeed_x = 4;
	mMaxspeed_y = 8;
	mFriction_x = 0.5;
	mFriction_y = 0.5;
}

