/// @description First airplane 

//global.inst_player = undefined;

if( visible ){
	x += SPEED;
}

if( x >= 3000 && global.intro ){
	global.intro = false;
	oPlayer.visible = true;
	oPlayer.x = x;
	oPlayer.y = y;
}

if( x >= room_width * 1.5 ){
	//instance_destroy(oAirplane);
	visible = false;
}

if( !global.intro ){
	y -= 1;
} else {
	y += 0.2;
}