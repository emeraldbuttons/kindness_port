/// @description Insert description here
// You can write your code in this editor

#macro SCALE 2

var x_pos = 0;
var y_pos = 0;

var x_maze = 0;
var y_maze = 0;

//import json to ds map
json_par = undefined;
if( file_exists(working_directory + "main_level_01.json") ){
	var json_str = "";
	var json_file = file_text_open_read(working_directory + "main_level_01.json");
	while( file_text_eof(json_file) == false ){
		json_str += file_text_readln(json_file);
	}
	file_text_close(json_file);
	json_par = json_parse(json_str);
}

x_pos = real( json_par[$"level"][$"actors"][$"person_left"][0][$"_x"] );
y_pos = real( json_par[$"level"][$"actors"][$"person_left"][0][$"_y"] );
x_pos = (x_pos * SCALE) - 10;
y_pos = (y_pos * SCALE) - 4;
var inst_strange = instance_create_layer(x_pos, y_pos, "Instances", oStranger);
var inst_strange_aux = instance_create_layer(x_pos, y_pos, "Instances", oStrangerLeft);

//create maze
x_maze = real( json_par[$"level"][$"maze"][$"maze"][$"_x"] );
y_maze = real( json_par[$"level"][$"maze"][$"maze"][$"_y"] );
x_maze = x_maze * SCALE;
y_maze = y_maze * SCALE;
var inst_maze = instance_create_layer(x_maze, y_maze, "Instances", oMaze);
