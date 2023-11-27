function scr_save() {
	fileid=file_text_open_write(global.savefilename);
	file_text_write_string(fileid,string(global.finalbossdead));
	file_text_writeln(fileid);
	file_text_write_string(fileid,string(global.maymarry));
	file_text_writeln(fileid);
	file_text_write_string(fileid,string(global.firstintro));
	file_text_writeln(fileid);
	file_text_write_string(fileid,string(obj_you.x));
	file_text_writeln(fileid);
	file_text_write_string(fileid,string(obj_you.y));
	file_text_writeln(fileid);
	file_text_write_string(fileid,string(obj_you.walkdir));
	file_text_writeln(fileid);

	str="";
	for (i=0;i<6;i+=1)
	    str+=string(global.item[i]);
	file_text_write_string(fileid,str);
	file_text_writeln(fileid);

	str="";
	for (i=0;i<64;i+=1)
	    str+=string(global.npccured[i]);
	file_text_write_string(fileid,str);
	file_text_writeln(fileid);

	str="";
	for (i=0;i<64;i+=1)
	    str+=string(global.chestopened[i]);
	file_text_write_string(fileid,str);
	file_text_writeln(fileid);

	str="";
	for (i=0;i<64;i+=1)
	    str+=string(global.roadblock[i]);
	file_text_write_string(fileid,str);
	file_text_writeln(fileid);

	str="";
	for (i=0;i<64;i+=1)
	    str+=string(global.door[i]);
	file_text_write_string(fileid,str);
	file_text_writeln(fileid);

	file_text_write_string(fileid,string(global.hearts));
	file_text_writeln(fileid);
	file_text_write_string(fileid,string(global.force));
	file_text_writeln(fileid);
	file_text_write_string(fileid,string(global.multi));
	file_text_writeln(fileid);
	file_text_write_string(fileid,string(global.regen));
	file_text_writeln(fileid);
	file_text_write_string(fileid,string(global.flasks));
	file_text_writeln(fileid);

	str="Lost in nowhere...";
	if (room==rom_saturnianpalace) str="1";
	else if (room==rom_saturnianpalaceplatform) str="2";
	else if (room==rom_warproom) str="3";
	else if (room==rom_easthurtland) str="4";
	else if (room==rom_mildtown) str="5";
	else if (room==rom_mildtowninside) str="6";
	else if (room==rom_secretgrove) str="7";
	else if (room==rom_falltown) str="8";
	else if (room==rom_falltowninside) str="9";
	else if (room==rom_mysteriouscave) str="10";
	else if (room==rom_westhurtland) str="11";
	else if (room==rom_burntown) str="12";
	else if (room==rom_burntowninside) str="13";
	else if (room==rom_pyramid1f) str="14";
	else if (room==rom_pyramid2f) str="15";
	else if (room==rom_spidercave) str="16";
	else if (room==rom_blackhole) str="17";
	else if (room==rom_moongarden) str="18";
	else if (room==rom_moongardeninside) str="19";
	else if (room==rom_asteroid) str="20";
	else if (room==rom_crystalpalace1f) str="21";
	else if (room==rom_crystalpalace2f) str="22";
	else if (room==rom_lonelyhouse) str="23";
	else if (room==rom_dimensionofnothingness) str="24";
	else if (room==rom_northhurtland) str="25";
	else if (room==rom_blackfortress1f) str="26";
	else if (room==rom_blackfortress2f) str="27";
	else if (room==rom_thelivingend) str="28";
	else if (room==rom_thelivingendinside) str="29";
	else if (room==rom_omenshore) str="30";
	else if (room==rom_royalvalley) str="31";
	else if (room==rom_royalcastle1f) str="32";
	else if (room==rom_royalcastle2f) str="33";
	else if (room==rom_saturniansecret) str="34";
	else if (room==rom_moongardensecret) str="35";
	else if (room==rom_deeper) str="36";
	file_text_write_string(fileid,str);
	file_text_writeln(fileid);
	file_text_write_string(fileid,string(global.frames));
	file_text_writeln(fileid);
	file_text_write_string(fileid,string(global.hyperchest));
	file_text_writeln(fileid);
	file_text_write_string(fileid,string(global.difficulty));
	file_text_writeln(fileid);
	file_text_write_string(fileid,string(0));
	file_text_writeln(fileid);
	file_text_write_string(fileid,string(0));
	file_text_writeln(fileid);
	file_text_write_string(fileid,string(0));
	file_text_writeln(fileid);
	file_text_write_string(fileid,string(0));
	file_text_writeln(fileid);
	file_text_write_string(fileid,string(0));
	file_text_writeln(fileid);
	file_text_write_string(fileid,string(0));
	file_text_writeln(fileid);
	file_text_write_string(fileid,string(0));
	file_text_writeln(fileid);
	file_text_write_string(fileid,string(0));
	file_text_writeln(fileid);
	//identifier
	file_text_write_string(fileid,"Princess Remedy savefile 1.1 (6 Dec 2014)");
	file_text_writeln(fileid);

	file_text_close(fileid);



}
