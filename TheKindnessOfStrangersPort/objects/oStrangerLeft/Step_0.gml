/// @description Insert description here
// You can write your code in this editor

checkHelp();

if( showTalkBubble ){
	visible = true;
} else {
	visible = false;
}

//gravity
gravity_fun();

//basic collision
//vertical
if( place_meeting(x, y+20+speed_y, oMaze) ){
	while( !place_meeting(x, y+20+sign(speed_y), oMaze) ){
		y += sign(20+speed_y);
	}
	speed_y = 0;
}
if( place_meeting(x, y+20+speed_y, oMaze2) ){
	while( !place_meeting(x, y+20+sign(speed_y), oMaze2) ){
		y += sign(20+speed_y);
	}
	speed_y = 0;
}
