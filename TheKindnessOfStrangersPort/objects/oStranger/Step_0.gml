/// @description Insert description here
// You can write your code in this editor

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
