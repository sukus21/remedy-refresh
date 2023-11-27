function scr_sabotstep() {
	//Global init
	if (!global.init){
	    global.init=1;
	    global.maxframes=1079999;
	    if (!global.fromsavefile){
	        global.hyperchest=0;
	        global.frames=0; //time taken
	        global.finalbossdead=0; //2 = spoken to Prince
	        global.maymarry=0; //1 = may marry now
	        global.firstintro=0; // 2 = spoken to Queen
	        for (i=0;i<6;i+=1)
	            global.item[i]=0;
	        for (i=0;i<256;i+=1){
	            global.npccured[i]=0;
	            global.npcjustcured[i]=0;
	            global.chestopened[i]=0;
	            global.roadblock[i]=0;
	            global.door[i]=0;
	            }
	        global.playerposx=obj_you.x;
	        global.playerposy=obj_you.y;
	        global.destination=0; //-1 from NPC   >0 from transition
	        //total chests:
	        // 25 hearts
	        // 4 force
	        // 4 multi
	        // 9 regen
	        // 9 flasks
	        // 6 items
	        //  = 57
	        global.hearts=5; //5-99
	        global.force=1; //1-5
	        global.multi=1; //1-5
	        global.regen=1; //1-10
	        global.flasks=1; //1-10
	        //Pre-cured NPC list
	        global.npccured[10]=1;
	        global.npccured[12]=1;
	        global.npccured[14]=1;
	        global.npccured[18]=1;
	        global.npccured[19]=1;
	        global.npccured[22]=1;
	        global.npccured[32]=1;
	        global.npccured[33]=1;
	        global.npccured[34]=1;
	        global.npccured[35]=1;
	        global.npccured[36]=1;
	        global.npccured[37]=1;
	        global.npccured[39]=2;
	        global.npccured[53]=1;
	        }
    
	    //Non save stuff
	    scr_stopjoy();
	    global.flashspeed=10;
	    global.animcyclength=12; //must be divisible by 2
	    global.marryname="";
	    global.marrytag=0;
	    scr_createtext();
	    global.pauseselected=0;
    
	    //DEBUG POWER LEVELS
	    debugworld=0;
	    //DEBUG: WORLD 1
	    if (debugworld==1){
	        global.hearts=5; //5-99
	        global.force=1; //1-5
	        global.multi=2; //1-5
	        global.regen=3; //1-10
	        global.flasks=3; //1-10
	        }
	    //DEBUG: WORLD 2
	    else if (debugworld==2){
	        global.hearts=23; //5-99
	        global.force=2; //1-5
	        global.multi=3; //1-5
	        global.regen=5; //1-10
	        global.flasks=5; //1-10
	        }
	    //DEBUG: WORLD 3
	    else if (debugworld==3){
	        global.hearts=41; //5-99
	        global.force=3; //1-5
	        global.multi=4; //1-5
	        global.regen=7; //1-10
	        global.flasks=7; //1-10
	        }
	    //DEBUG: WORLD 4
	    else if (debugworld==4){
	        global.hearts=59; //5-99
	        global.force=4; //1-5
	        global.multi=5; //1-5
	        global.regen=9; //1-10
	        global.flasks=9; //1-10
	        }
	    //DEBUG: WORLD 5
	    else if (debugworld==5){
	        global.hearts=77; //5-99
	        global.force=4; //1-5
	        global.multi=5; //1-5
	        global.regen=10; //1-10
	        global.flasks=10; //1-10
	        }
	    //DEBUG: MASTER
	    else if (debugworld==6){
	        global.hearts=80; //5-99
	        global.force=5; //1-5
	        global.multi=5; //1-5
	        global.regen=10; //1-10
	        global.flasks=10; //1-10
	        }
    
	    //Music when landing from savefile
	    //in non-music areas
	    if (global.fromsavefile){
	        if (room==rom_warproom){
	            global.world=2;
	            if (global.playmusic)
	                sound_loop(global.music[2]);
	            }
	        }
	    }

	//Init
	if (!init){
	    init=1;
	    scr_joycreate();
	    global.boxhp=10;
	    //Lowest background color
	    if (room==rom_easthurtland){
	        lowestg=50;
	        global.flashg=50;
	        }
	    else if (room==rom_westhurtland){
	        lowestr=60;
	        lowestg=60;
	        global.flashr=60;
	        global.flashg=60;
	        }
	    else if (room==rom_northhurtland){
	        lowestb=70;
	        global.flashb=70;
	        }
	    else if (room==rom_royalvalley){
	        lowestg=50;
	        global.flashg=50;
	        }
	    //Cure NPCs
	    with (obj_npc){
	        if (global.npccured[tag]){
	            cured=1;
	            img=1;
	            }
	        if (global.npcjustcured[tag]){
	            global.npcjustcured[tag]=0;
	            yay=150;
	            img=1;
	            }
	        }
	    //Open chests
	    with (obj_chest){
	        if (global.chestopened[tag] || global.difficulty==3){
	            instance_destroy();
	            instance_create(x,y,obj_openchest);
	            }
	        }
	    //Remove roadblocks
	    with (obj_roadblock){
	        if (global.roadblock[tag])
	            instance_destroy();
	        }
	    //Open doors
	    with (obj_door){
	        if (global.door[tag])
	            instance_destroy();
	        }
	    //Place player from battle or savefile
	    if (global.destination==-1){
	        obj_you.x=global.playerposx;
	        obj_you.y=global.playerposy;
	        obj_you.walkdir=global.playerdir;
	        }
	    //Place player from transition
	    else if (global.destination>0){
	        with (obj_destination){
	            if (in=global.destination){
	                obj_you.x=x+8;
	                obj_you.y=y+8;
	                if (global.overridedir){
	                    global.overridedir=0;
	                    indir=global.overridedirout;
	                    }
	                obj_you.walkdir=indir;
	                if (indir==0)
	                    obj_you.x+=16;
	                else if (indir==1)
	                    obj_you.y-=16;
	                else if (indir==2)
	                    obj_you.x-=16;
	                else if (indir==3)
	                    obj_you.y+=16;
	                }
	            }
	        }
	    //First intro chat
	    //Remember to save this
	    if (global.firstintro==0){
	        if (room==rom_saturnianpalace){
	            global.firstintro=1;
	            hidelocmessage=1;
	            }
	        else
	            global.firstintro=2;
	        }
	    if (global.finalbossdead==1)
	        hidelocmessage=1;
        
	    //Location names
	    if (room==rom_saturnianpalace)
	        loctext="Saturnian Palace";
	    else if (room==rom_saturnianpalaceplatform)
	        loctext="Palace Platform";
	    else if (room==rom_warproom)
	        loctext="Warp Room";
	    else if (room==rom_easthurtland)
	        loctext="East Hurtland";
	    else if (room==rom_mildtown)
	        loctext="Mild Town";
	    else if (room==rom_mildtowninside)
	        loctext="House";
	    else if (room==rom_secretgrove)
	        loctext="Secret Grove";
	    else if (room==rom_falltown)
	        loctext="Fall Town";
	    else if (room==rom_falltowninside)
	        loctext="House";
	    else if (room==rom_mysteriouscave)
	        loctext="Mysterious Cave";
	    else if (room==rom_westhurtland)
	        loctext="West Hurtland";
	    else if (room==rom_burntown)
	        loctext="Burn Town";
	    else if (room==rom_burntowninside)
	        loctext="House";
	    else if (room==rom_pyramid1f)
	        loctext="Pyramid 1F";
	    else if (room==rom_pyramid2f)
	        loctext="Pyramid 2F";
	    else if (room==rom_spidercave)
	        loctext="Spider Cave";
	    else if (room==rom_blackhole)
	        loctext="Black Hole";
	    else if (room==rom_moongarden)
	        loctext="Moon Garden";
	    else if (room==rom_moongardeninside)
	        loctext="House";
	    else if (room==rom_asteroid)
	        loctext="Asteroid";
	    else if (room==rom_crystalpalace1f)
	        loctext="Crystal Palace 1F";
	    else if (room==rom_crystalpalace2f)
	        loctext="Crystal Palace 2F";
	    else if (room==rom_lonelyhouse)
	        loctext="Lonely House";
	    else if (room==rom_dimensionofnothingness)
	        loctext="Nothing Dimension";
	    else if (room==rom_northhurtland)
	        loctext="North Hurtland";
	    else if (room==rom_blackfortress1f)
	        loctext="Black Fortress 1F";
	    else if (room==rom_blackfortress2f)
	        loctext="Black Fortress 2F";
	    else if (room==rom_thelivingend)
	        loctext="The Living End";
	    else if (room==rom_thelivingendinside)
	        loctext="House";
	    else if (room==rom_omenshore)
	        loctext="Omen Shore";
	    else if (room==rom_royalvalley)
	        loctext="Royal Valley";
	    else if (room==rom_royalcastle1f)
	        loctext="Royal Castle 1F";
	    else if (room==rom_royalcastle2f)
	        loctext="Royal Castle 2F";
	    else if (room==rom_saturniansecret)
	        loctext="Saturnian Secret";
	    else if (room==rom_moongardensecret)
	        loctext="Moon Garden Secret";
	    else if (room==rom_deeper)
	        loctext="Deeper";
	    else if (room==rom_nowhere)
	        loctext="Nowhere";
    
	    //restart music after battle 50
	    if (global.exitedbattle==1 && room==rom_royalcastle2f){
	        scr_stopmusic();
	        if (global.finalbossdead>0){
	            if (global.playmusic)
	                sound_loop(global.music[4]);
	            }
	        else{
	            if (global.playmusic)
	                sound_loop(global.music[9]);
	            }
	        }
	    if (global.exitedbattle)
	        hidelocmessage=1;
	    global.exitedbattle=0;
    
	    //play world music
	    if (room==rom_saturnianpalace || room==rom_saturnianpalaceplatform || room==rom_saturniansecret || room==rom_nowhere)
	        global.world=1;
	    else if (room==rom_easthurtland || room==rom_mildtown || room==rom_mildtowninside || room==rom_secretgrove || room==rom_falltown || room==rom_falltowninside || room==rom_mysteriouscave)
	        global.world=2;
	    else if (room==rom_westhurtland || room==rom_burntown || room==rom_burntowninside || room==rom_pyramid1f || room==rom_pyramid2f || room==rom_spidercave)
	        global.world=3;
	    else if (room==rom_blackhole || room==rom_moongarden || room==rom_moongardeninside || room==rom_asteroid || room==rom_crystalpalace1f || room==rom_crystalpalace2f || room==rom_lonelyhouse || room==rom_moongardensecret)
	        global.world=4;
	    else if (room==rom_northhurtland || room==rom_blackfortress1f || room==rom_blackfortress2f || room==rom_thelivingend || room==rom_thelivingendinside || room==rom_omenshore)
	        global.world=5;
	    else if (room==rom_royalvalley || room==rom_royalcastle1f || room==rom_royalcastle2f)
	        global.world=6;
	    else if (room==rom_dimensionofnothingness)
	        global.world=7;
	    if (global.world!=global.lastworld){
	        scr_stopmusic();
	        if (global.world==1){
	            if (global.playmusic)
	                sound_loop(global.music[4]);
	            }
	        else if (global.world==2){
	            if (global.playmusic)
	                sound_loop(global.music[2]);
	            }
	        else if (global.world==3){
	            if (global.playmusic)
	                sound_loop(global.music[5]);
	            }
	        else if (global.world==4){
	            if (global.playmusic)
	                sound_loop(global.music[0]);
	            }
	        else if (global.world==5){
	            if (global.playmusic)
	                sound_loop(global.music[3]);
	            }
	        else if (global.world==6){
	            if (global.finalbossdead>0){
	                if (global.playmusic)
	                    sound_loop(global.music[4]);
	                }
	            else{
	                if (global.playmusic)
	                    sound_loop(global.music[9]);
	                }
	            }
	        else if (global.world==7){
	            if (global.playmusic)
	                sound_loop(global.music[9]);
	            }
	        }
	    global.lastworld=global.world;
	    }
	global.fromsavefile=0;

	if (instance_exists(obj_pause)){
	    }
	else{
	    scr_joy();
	    scr_input();
	    }

	//Global animation cycler
	global.animcyc+=1;
	if (global.animcyc==global.animcyclength)
	    global.animcyc=0;

	//Time taken
	if (obj_you.quit==0 && obj_you.quitignore==0 && instance_number(obj_pause)==0){
	    if (global.frames<global.maxframes)
	        global.frames+=1;
	    }

	//Camera
	viewx=obj_you.x-scr_wview()/2;
	viewy=obj_you.y-scr_hview()/2;
	if (viewx<0)
	    viewx=0;
	if (viewy<0)
	    viewy=0;
	if (viewx>room_width-scr_wview())
	    viewx=room_width-scr_wview();
	if (viewy>room_height-scr_hview())
	    viewy=room_height-scr_hview();
	scr_setxview(viewx);
	scr_setyview(viewy);

	//GM5 background color
	if (global.gmv==5){
	    global.flashr=lowestr;
	    global.flashg=lowestg;
	    global.flashb=lowestb;
	    }
	//Background color
	if (global.flashr>0){
	    global.flashr-=global.flashspeed;
	    if (global.flashr<=0)
	        global.flashr=0;
	    if (global.flashr<=lowestr)
	        global.flashr=lowestr;
	    }
	if (global.flashg>0){
	    global.flashg-=global.flashspeed;
	    if (global.flashg<=0)
	        global.flashg=0;
	    if (global.flashg<=lowestg)
	        global.flashg=lowestg;
	    }
	if (global.flashb>0){
	    global.flashb-=global.flashspeed;
	    if (global.flashb<=0)
	        global.flashb=0;
	    if (global.flashb<=lowestb)
	        global.flashb=lowestb;
	    }
	if (global.flashr>=250)
	    global.flashr=250;
	if (global.flashg>=250)
	    global.flashg=250;
	if (global.flashb>=250)
	    global.flashb=250;
	global.bgcolor=make_color_rgb(global.flashr,global.flashg,global.flashb);

	__background_set_colour( global.bgcolor );



}
