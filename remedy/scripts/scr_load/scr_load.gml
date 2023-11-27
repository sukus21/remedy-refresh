function scr_load() {
	if (file_exists(global.savefilename)){
	    fileid=file_text_open_read(global.savefilename);
    
	    global.fromsavefile=1;
	    global.destination=-1;
    
	    global.finalbossdead=real(file_text_read_string(fileid));
	    if (global.finalbossdead<0)
	        global.finalbossdead=0;
	    if (global.finalbossdead>2)
	        global.finalbossdead=2;
	    file_text_readln(fileid);
	    global.maymarry=real(file_text_read_string(fileid));
	    if (global.maymarry<0)
	        global.maymarry=0;
	    if (global.maymarry>1)
	        global.maymarry=1;
	    file_text_readln(fileid);
	    global.firstintro=real(file_text_read_string(fileid));
	    if (global.firstintro<0)
	        global.firstintro=0;
	    if (global.firstintro>2)
	        global.firstintro=2;
	    file_text_readln(fileid);
	    global.playerposx=real(file_text_read_string(fileid));
	    file_text_readln(fileid);
	    global.playerposy=real(file_text_read_string(fileid));
	    file_text_readln(fileid);
	    global.playerdir=real(file_text_read_string(fileid));
	    if (global.playerdir>3)
	        global.playerdir=3;
	    file_text_readln(fileid);

	    str=file_text_read_string(fileid);
	    for (i=0;i<string_length(str);i+=1)
	        global.item[i]=real(string_char_at(str,i+1));
	    file_text_readln(fileid);
    
	    str=file_text_read_string(fileid);
	    for (i=0;i<string_length(str);i+=1)
	        global.npccured[i]=real(string_char_at(str,i+1));
	    file_text_readln(fileid);

	    str=file_text_read_string(fileid);
	    for (i=0;i<string_length(str);i+=1)
	        global.chestopened[i]=real(string_char_at(str,i+1));
	    file_text_readln(fileid);

	    str=file_text_read_string(fileid);
	    for (i=0;i<string_length(str);i+=1)
	        global.roadblock[i]=real(string_char_at(str,i+1));
	    file_text_readln(fileid);

	    str=file_text_read_string(fileid);
	    for (i=0;i<string_length(str);i+=1)
	        global.door[i]=real(string_char_at(str,i+1));
	    file_text_readln(fileid);

	    global.hearts=real(file_text_read_string(fileid));
	    file_text_readln(fileid);
	    if (global.hearts<5)
	        global.hearts=5;
	    if (global.hearts>99)
	        global.hearts=99;
	    global.force=real(file_text_read_string(fileid));
	    if (global.force<1)
	        global.force=1;
	    if (global.force>99)
	        global.force=99;
	    file_text_readln(fileid);
	    global.multi=real(file_text_read_string(fileid));
	    if (global.multi<1)
	        global.multi=1;
	    if (global.multi>99)
	        global.multi=99;
	    file_text_readln(fileid);
	    global.regen=real(file_text_read_string(fileid));
	    if (global.regen<1)
	        global.regen=1;
	    if (global.regen>99)
	        global.regen=99;
	    file_text_readln(fileid);
	    global.flasks=real(file_text_read_string(fileid));
	    if (global.flasks<1)
	        global.flasks=1;
	    if (global.flasks>99)
	        global.flasks=99;
	    file_text_readln(fileid);

	    locstr=file_text_read_string(fileid);
	    file_text_readln(fileid);
	    global.frames=real(file_text_read_string(fileid));
	    file_text_readln(fileid);
	    global.hyperchest=real(file_text_read_string(fileid));
	    file_text_readln(fileid);
	    global.difficulty=real(file_text_read_string(fileid));
	    file_text_readln(fileid);

	    if (locstr=="1") room_goto(rom_saturnianpalace)
	    else if (locstr=="2") room_goto(rom_saturnianpalaceplatform)
	    else if (locstr=="3") room_goto(rom_warproom)
	    else if (locstr=="4") room_goto(rom_easthurtland)
	    else if (locstr=="5") room_goto(rom_mildtown)
	    else if (locstr=="6") room_goto(rom_mildtowninside)
	    else if (locstr=="7") room_goto(rom_secretgrove)
	    else if (locstr=="8") room_goto(rom_falltown)
	    else if (locstr=="9") room_goto(rom_falltowninside)
	    else if (locstr=="10") room_goto(rom_mysteriouscave)
	    else if (locstr=="11") room_goto(rom_westhurtland)
	    else if (locstr=="12") room_goto(rom_burntown)
	    else if (locstr=="13") room_goto(rom_burntowninside)
	    else if (locstr=="14") room_goto(rom_pyramid1f)
	    else if (locstr=="15") room_goto(rom_pyramid2f)
	    else if (locstr=="16") room_goto(rom_spidercave)
	    else if (locstr=="17") room_goto(rom_blackhole)
	    else if (locstr=="18") room_goto(rom_moongarden)
	    else if (locstr=="19") room_goto(rom_moongardeninside)
	    else if (locstr=="20") room_goto(rom_asteroid)
	    else if (locstr=="21") room_goto(rom_crystalpalace1f)
	    else if (locstr=="22") room_goto(rom_crystalpalace2f)
	    else if (locstr=="23") room_goto(rom_lonelyhouse)
	    else if (locstr=="24") room_goto(rom_dimensionofnothingness)
	    else if (locstr=="25") room_goto(rom_northhurtland)
	    else if (locstr=="26") room_goto(rom_blackfortress1f)
	    else if (locstr=="27") room_goto(rom_blackfortress2f)
	    else if (locstr=="28") room_goto(rom_thelivingend)
	    else if (locstr=="29") room_goto(rom_thelivingendinside)
	    else if (locstr=="30") room_goto(rom_omenshore)
	    else if (locstr=="31") room_goto(rom_royalvalley)
	    else if (locstr=="32") room_goto(rom_royalcastle1f)
	    else if (locstr=="33") room_goto(rom_royalcastle2f)
	    else if (locstr=="34") room_goto(rom_saturniansecret)
	    else if (locstr=="35") room_goto(rom_moongardensecret)
	    else if (locstr=="36") room_goto(rom_deeper)
	    else room_goto(rom_nowhere);

	    file_text_close(fileid);
	    }



}
