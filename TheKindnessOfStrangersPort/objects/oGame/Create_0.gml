/// @description Insert description here
// You can write your code in this editor

#macro SCALE 2

instance_create_layer(0,0, "Instances", oGlobal);
global.intro = true;

//import json to ds map
json_par = undefined;
if( file_exists(working_directory + "main_level_05.json") ){
	var json_str = "";
	var json_file = file_text_open_read(working_directory + "main_level_05.json");
	while( file_text_eof(json_file) == false ){
		json_str += file_text_readln(json_file);
	}
	file_text_close(json_file);
	json_par = json_parse(json_str);
}

//maze load
//inst_maze = undefined;
var x_maze = real( json_par[$"level"][$"maze"][$"maze"][$"_x"] ) * SCALE;
var y_maze = real( json_par[$"level"][$"maze"][$"maze"][$"_y"] ) * SCALE;
global.inst_maze = instance_create_layer(x_maze, y_maze, "Instances", oMaze);

x_maze = real( json_par[$"level"][$"maze"][$"maze"][$"_x"] ) * SCALE;
y_maze = real( json_par[$"level"][$"maze"][$"maze"][$"_y"] ) * SCALE +2494;
global.inst_maze = instance_create_layer(x_maze, y_maze, "Instances", oMaze2);

//intro dependant load
global.inst_airplane = instance_create_layer(0, 0, "Instances", oAirplane);
camera_set_view_target(view_camera[0], oAirplane);
//global.inst_airplane2 = instance_create_layer(room_width + 100, room_height - 150, "Instances", oAirplane2);
var x_play = real( json_par[$"level"][$"actors"][$"player"][$"_x"] ) * SCALE - 10;
var y_play = real( json_par[$"level"][$"actors"][$"player"][$"_y"] ) * SCALE - 4;
global.inst_player = instance_create_layer(100, 100, "Instances", oPlayer);

//strangers load
inst_strange = undefined;
inst_strange_aux = undefined;
var x_pos = 0;
var y_pos= 0;
for(var i = 0; i < 45; i += 1){
	x_pos = real( json_par[$"level"][$"actors"][$"person_left"][i][$"_x"] ) * SCALE -10;
	y_pos = real( json_par[$"level"][$"actors"][$"person_left"][i][$"_y"] ) * SCALE -4;
	inst_strange = instance_create_layer(x_pos, y_pos, "Instances", oStranger);
	inst_strange_aux = instance_create_layer(x_pos, y_pos, "Instances", oStrangerLeft);
	
}
for(var i = 0; i < 47; i += 1){
	x_pos = real( json_par[$"level"][$"actors"][$"person_right"][i][$"_x"] ) * SCALE -10;
	y_pos = real( json_par[$"level"][$"actors"][$"person_right"][i][$"_y"] ) * SCALE -4;
	inst_strange = instance_create_layer(x_pos, y_pos, "Instances", oStranger);
	inst_strange_aux = instance_create_layer(x_pos, y_pos, "Instances", oStrangerRight);
	
}
for(var i = 0; i < 33; i += 1){
	x_pos = real( json_par[$"level"][$"actors"][$"person_up"][i][$"_x"] ) * SCALE -10;
	y_pos = real( json_par[$"level"][$"actors"][$"person_up"][i][$"_y"] ) * SCALE -4;
	inst_strange = instance_create_layer(x_pos, y_pos, "Instances", oStranger);
	inst_strange_aux = instance_create_layer(x_pos, y_pos, "Instances", oStrangerUp);
	
}
for(var i = 0; i < 42; i += 1){
	x_pos = real( json_par[$"level"][$"actors"][$"person_down"][i][$"_x"] ) * SCALE -10;
	y_pos = real( json_par[$"level"][$"actors"][$"person_down"][i][$"_y"] ) * SCALE -4;
	inst_strange = instance_create_layer(x_pos, y_pos, "Instances", oStranger);
	inst_strange_aux = instance_create_layer(x_pos, y_pos, "Instances", oStrangerDown);
	
}

//heart
var x_heart = real( json_par[$"level"][$"triggers"][$"heart"][$"_x"] ) * SCALE;
var y_heart = real( json_par[$"level"][$"triggers"][$"heart"][$"_y"] ) * SCALE;
var inst_heart = instance_create_layer(x_heart,y_heart, "Instances", oBigHeart);



