/// @description Insert description here
// You can write your code in this editor

#macro BG_COLOR c_white;
#macro grid 32;

global.time = 0;
global.deaths = 0;
global.gems = 0;
global.level = 0;

global.newgame = false;
global.loadgame = false;

global.musicon = true;
global.soundon = true;

global.keyUp = vk_up;
global.keyDown = vk_down;
global.keyLeft = vk_left;
global.keyRight = vk_right;
global.keyA = ord("X");

global.inst_airplane = undefined;
global.inst_airplane2 = undefined;
global.inst_player = undefined;
global.inst_maze = undefined;
global.inst_view = undefined;

global.inst_soundController = undefined;
global.inst_photoController = undefined;

global.trigger01 = undefined;
global.trigger02 = undefined;
global.trigger03 = undefined;
global.trigger04 = undefined;

global.inst_bigHeart = undefined;

global.kindness = undefined;
global.help = true;
global.intro = true;
global.showSolution = true;
global.died = false;

global.paused = false;
global.restart = false;
global.finished = false;
