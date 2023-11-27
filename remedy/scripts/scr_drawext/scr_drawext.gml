function scr_drawext(argument0, argument1, argument2, argument3, argument4) {
	//draws extended black behind sprites in 5/7
	//turned off in gm5 and blended in gm7
	//argmument0 is sprite index
	//argmument1 is image single (GM5)
	//argmument2 is image single (GM7)
	//argmument3 is x
	//argmument4 is y

	//GM5
	//draw_sprite(argument0,argument1,argument3,argument4);
	//GM7
	draw_sprite_ext(argument0,argument2,argument3,argument4,1,1,0,global.bgcolor,1);



}
