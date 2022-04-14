/// @description Insert description here
// You can write your code in this editor

speed_x = 0;
speed_y = 0;
acceleration_x = 0;
acceleration_y = 0;
mGravity = 0.2;
solid_var = "Solid";
mFriction_x = 0.5;
mFriction_y = 0.5;
slopeHeight = 1;
mMaxspeed_x = 3;
mMaxspeed_y = 8;

function gravity_fun(){
	speed_y += mGravity;
}

function friction_fun(){
	if( speed_x > 0 ){
		speed_x -= mFriction_x;
		if( speed_x < 0 ){
			speed_x = 0;
		}
	}
	if( speed_x < 0 ){
		speed_x += mFriction_x;
		if( speed_x > 0 ){
			speed_x = 0;
		}
	}
}
