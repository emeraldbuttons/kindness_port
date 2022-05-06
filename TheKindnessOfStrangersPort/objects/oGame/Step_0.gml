/// @description Insert description here
// You can write your code in this editor

var y_max = real( json_par[$"level"][$"maze"][$"maze"][$"_y"] ) * SCALE +2494 + 2494 + 20;

if( !global.intro && oPlayer.y < y_max ){
	oPlayer.visible = true;
	camera_set_view_target(view_camera[0], oPlayer);
}

//airplane 2
if( oBigHeart.visible = false && oPlayer.y > y_max && !instance_exists(oAirplane2) ){
	var inst_plane = instance_create_layer(oPlayer.x, oPlayer.y, "Instances", oAirplane2);
	oPlayer.visible = false;
	camera_set_view_target(view_camera[0], oAirplane2);	
}

if( instance_exists(oAirplane2) ){
	oAirplane2.x -= SPEED;
	oAirplane2.y += 0.7;
}

if( instance_exists(oAirplane2) ){
	if( oAirplane2.x <= 0 ){
		//instance_destroy(oAirplane2);
		oAirplane2.visible = false;		
	}
}
