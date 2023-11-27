function __global_object_depths() {
	// Initialise the global array that allows the lookup of the depth of a given object
	// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
	// NOTE: MacroExpansion is used to insert the array initialisation at import time
	gml_pragma( "global", "__global_object_depths()");

	// insert the generated arrays here
	global.__objectDepths[0] = 5; // obj_enemy
	global.__objectDepths[1] = 5; // obj_enemy1
	global.__objectDepths[2] = 5; // obj_enemy2
	global.__objectDepths[3] = 5; // obj_enemy3
	global.__objectDepths[4] = 5; // obj_enemy4
	global.__objectDepths[5] = 5; // obj_enemy5
	global.__objectDepths[6] = 5; // obj_enemy6
	global.__objectDepths[7] = 5; // obj_enemy7
	global.__objectDepths[8] = 5; // obj_enemy8
	global.__objectDepths[9] = 5; // obj_enemy9
	global.__objectDepths[10] = 5; // obj_enemy10
	global.__objectDepths[11] = 5; // obj_enemy11
	global.__objectDepths[12] = 5; // obj_enemy12
	global.__objectDepths[13] = 5; // obj_enemy13
	global.__objectDepths[14] = 5; // obj_enemy14
	global.__objectDepths[15] = 5; // obj_enemy15
	global.__objectDepths[16] = 5; // obj_enemy16
	global.__objectDepths[17] = 0; // obj_titlesabot
	global.__objectDepths[18] = 0; // obj_endsabot
	global.__objectDepths[19] = 0; // obj_you
	global.__objectDepths[20] = -100000; // obj_sabot
	global.__objectDepths[21] = 10; // obj_battleyou
	global.__objectDepths[22] = 0; // obj_youbox
	global.__objectDepths[23] = -100000; // obj_battlesabot
	global.__objectDepths[24] = 0; // obj_intersabot
	global.__objectDepths[25] = 0; // obj_breaksabot
	global.__objectDepths[26] = 0; // obj_breakobject
	global.__objectDepths[27] = -100; // obj_textbubble
	global.__objectDepths[28] = -100; // obj_pause
	global.__objectDepths[29] = 1000; // obj_cover
	global.__objectDepths[30] = 0; // obj_holder
	global.__objectDepths[31] = -5; // obj_shot
	global.__objectDepths[32] = -5; // obj_enemyshot
	global.__objectDepths[33] = -10; // obj_puff
	global.__objectDepths[34] = -20; // obj_explo
	global.__objectDepths[35] = -15; // obj_explopart
	global.__objectDepths[36] = -4; // obj_flask
	global.__objectDepths[37] = -25; // obj_flaskexplo
	global.__objectDepths[38] = -3; // obj_flasktrail
	global.__objectDepths[39] = 5; // obj_interstar
	global.__objectDepths[40] = 0; // obj_block
	global.__objectDepths[41] = 0; // obj_strongblock
	global.__objectDepths[42] = -1; // obj_destination
	global.__objectDepths[43] = 0; // obj_secretwall
	global.__objectDepths[44] = 0; // obj_secretblocker
	global.__objectDepths[45] = 0; // obj_npc
	global.__objectDepths[46] = 50; // obj_chest
	global.__objectDepths[47] = 50; // obj_orb
	global.__objectDepths[48] = 50; // obj_superchest
	global.__objectDepths[49] = 50; // obj_openchest
	global.__objectDepths[50] = 50; // obj_hyperchest
	global.__objectDepths[51] = 50; // obj_roadblock
	global.__objectDepths[52] = 50; // obj_door
	global.__objectDepths[53] = 5; // obj_bossenemy
	global.__objectDepths[54] = 1000000; // obj_bossdrawer
	global.__objectDepths[55] = 900000; // obj_deadboss


	global.__objectNames[0] = "obj_enemy";
	global.__objectNames[1] = "obj_enemy1";
	global.__objectNames[2] = "obj_enemy2";
	global.__objectNames[3] = "obj_enemy3";
	global.__objectNames[4] = "obj_enemy4";
	global.__objectNames[5] = "obj_enemy5";
	global.__objectNames[6] = "obj_enemy6";
	global.__objectNames[7] = "obj_enemy7";
	global.__objectNames[8] = "obj_enemy8";
	global.__objectNames[9] = "obj_enemy9";
	global.__objectNames[10] = "obj_enemy10";
	global.__objectNames[11] = "obj_enemy11";
	global.__objectNames[12] = "obj_enemy12";
	global.__objectNames[13] = "obj_enemy13";
	global.__objectNames[14] = "obj_enemy14";
	global.__objectNames[15] = "obj_enemy15";
	global.__objectNames[16] = "obj_enemy16";
	global.__objectNames[17] = "obj_titlesabot";
	global.__objectNames[18] = "obj_endsabot";
	global.__objectNames[19] = "obj_you";
	global.__objectNames[20] = "obj_sabot";
	global.__objectNames[21] = "obj_battleyou";
	global.__objectNames[22] = "obj_youbox";
	global.__objectNames[23] = "obj_battlesabot";
	global.__objectNames[24] = "obj_intersabot";
	global.__objectNames[25] = "obj_breaksabot";
	global.__objectNames[26] = "obj_breakobject";
	global.__objectNames[27] = "obj_textbubble";
	global.__objectNames[28] = "obj_pause";
	global.__objectNames[29] = "obj_cover";
	global.__objectNames[30] = "obj_holder";
	global.__objectNames[31] = "obj_shot";
	global.__objectNames[32] = "obj_enemyshot";
	global.__objectNames[33] = "obj_puff";
	global.__objectNames[34] = "obj_explo";
	global.__objectNames[35] = "obj_explopart";
	global.__objectNames[36] = "obj_flask";
	global.__objectNames[37] = "obj_flaskexplo";
	global.__objectNames[38] = "obj_flasktrail";
	global.__objectNames[39] = "obj_interstar";
	global.__objectNames[40] = "obj_block";
	global.__objectNames[41] = "obj_strongblock";
	global.__objectNames[42] = "obj_destination";
	global.__objectNames[43] = "obj_secretwall";
	global.__objectNames[44] = "obj_secretblocker";
	global.__objectNames[45] = "obj_npc";
	global.__objectNames[46] = "obj_chest";
	global.__objectNames[47] = "obj_orb";
	global.__objectNames[48] = "obj_superchest";
	global.__objectNames[49] = "obj_openchest";
	global.__objectNames[50] = "obj_hyperchest";
	global.__objectNames[51] = "obj_roadblock";
	global.__objectNames[52] = "obj_door";
	global.__objectNames[53] = "obj_bossenemy";
	global.__objectNames[54] = "obj_bossdrawer";
	global.__objectNames[55] = "obj_deadboss";


	// create another array that has the correct entries
	var len = array_length_1d(global.__objectDepths);
	global.__objectID2Depth = [];
	for( var i=0; i<len; ++i ) {
		var objID = asset_get_index( global.__objectNames[i] );
		if (objID >= 0) {
			global.__objectID2Depth[ objID ] = global.__objectDepths[i];
		} // end if
	} // end for


}
