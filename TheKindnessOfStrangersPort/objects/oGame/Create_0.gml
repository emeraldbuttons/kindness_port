/// @description Insert description here
// You can write your code in this editor

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

