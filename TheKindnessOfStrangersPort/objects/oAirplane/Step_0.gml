/// @description First airplane 

global.inst_player = undefined;

if( visible ){
	x += SPEED;
}

if( x >= 1000 && !playerDropped ){
	playerDropped = true;
	global.inst_player = instance_create_layer(x,y,"Instances", oPlayer);
	camera_set_view_target(view_camera[0], oPlayer);
}

if( x >= 5000){
	//instance_destroy(oAirplane);
	visible = false;
}

if( playerDropped ){
	y -= 1;
} else {
	y += 0.2;
}