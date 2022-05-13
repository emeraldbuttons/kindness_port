/// @description Insert description here
// You can write your code in this editor

#macro X_DISTANCE_TO_HELP 100
#macro Y_DISTANCE_TO_HELP 10

event_inherited();

//sprite frame control
image_index = 8 * irandom(1);
image_speed = 0;

strange_x = x;
strange_y = y;

showTalkBubble = false;


function checkHelp(){
	if( instance_exists(oPlayer) ) {
		if( abs(y - oPlayer.y) <= Y_DISTANCE_TO_HELP ){
			if( abs(x - oPlayer.x) <= X_DISTANCE_TO_HELP ){
				showTalkBubble = true;
			} else{
				showTalkBubble = false;
			}
		} else{
			showTalkBubble = false;
		}
	}
	
}

