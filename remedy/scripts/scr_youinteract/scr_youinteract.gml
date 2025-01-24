function scr_youinteract(argument0, argument1) {
	//argument0 is x
	//argument1 is y

	foundsomething=0;
	obj_sabot.hidelocmessage=1;

	//Find NPC
	tempid=-1;
	tempid=instance_place(argument0,argument1,obj_npc);
	if (tempid>-1 && !foundsomething){
	    foundsomething=1;
	    ignoreall=1;
	    sfx_play(snd_explo);
	    bubble=instance_create_depth(get_xview(),get_yview(),-100,obj_textbubble);
	    bubble.talktonpc=1;
	    bubble.battle=tempid.battle;
	    bubble.cured=tempid.cured;
	    bubble.tag=tempid.tag;
	    bubble.battletag=tempid.battletag;
	    bubble.texts=tempid.texts;
	    bubble.aftertexts=tempid.aftertexts;
	    bubble.marry=0;
	    for (i=0;i<bubble.texts;i+=1)
	        bubble.text[i]=tempid.text[i];
	    for (i=0;i<bubble.aftertexts;i+=1)
	        bubble.aftertext[i]=tempid.aftertext[i];
	    bubble.name=tempid.name;
	    //Correct y
	    if (obj_you.y<get_yview()+(get_hview()/2)-16)
	        bubble.y=get_yview()+get_hview()-40;
	    //grab first text
	    with (bubble){
	        if (cured==0)
	            finaltext=name+":#"+text[0];
	        else{
	            if (global.maymarry==1){
	                if (global.npccured[tag]==1){
	                    global.npccured[tag]=2;
	                    finaltext=name+":#"+aftertext[0];
	                    }
	                else{
	                    marry=1;
	                    finaltext="Marry#"+name+"?##$$$$$No$$$Yes";
	                    global.marryname=name;
	                    global.marrytag=tag;
	                    }
	                }
	            else{
	                global.npccured[tag]=2;
	                finaltext=name+":#"+aftertext[0];
	                }
	            }
	        finaltext=scr_linebreak(finaltext,148);
	        }
	    }

	//Find chest
	tempid=-1;
	tempid=instance_place(argument0,argument1,obj_chest);
	if (tempid>-1 && !foundsomething){
	    foundsomething=1;
	    ignoreall=1;
	    sfx_play(snd_openchest);
	    //give item
	    if (tempid.contents==0){
	        global.hearts+=1;
	        bubbletext="$$$You got a >!##$Hearts increased.";
	        global.flashr=200;
	        global.flashg=100;
	        global.flashb=100;
	        if (global.hearts>99)
	            global.hearts=99;
	        }
	    else if (tempid.contents==1){
	        global.force+=1;
	        if (global.force==2)
	            bubbletext="$You got < Pill!##$$$$Shot power#$$$$increased.";
	        else if (global.force==3)
	            bubbletext="$You got < Shot!##$$$$Shot power#$$$$increased.";
	        else if (global.force==4)
	            bubbletext="$You got < Magic!##$$$$Shot power#$$$$increased.";
	        else if (global.force==5)
	            bubbletext="$You got < Tiara!##$$$$Shot power#$$$$increased.";
	        else
	            bubbletext="$You got ? Frog!##$$$$Shot power#$$$$increased.";
	        global.flashr=200;
	        global.flashg=200;
	        global.flashb=100;
	        if (global.force>99)
	            global.force=99;
	        }
	    else if (tempid.contents==2){
	        global.multi+=1;
	        bubbletext="$$$You got a @!##$Shots multiplied.";
	        global.flashr=100;
	        global.flashg=200;
	        global.flashb=200;
	        if (global.multi>99)
	            global.multi=99;
	        }
	    else if (tempid.contents==3){
	        global.regen+=1;
	        bubbletext="$$$You got a \\!##Regeneration power#$$$$increased.";
	        global.flashr=100;
	        global.flashg=200;
	        global.flashb=100;
	        if (global.regen>99)
	            global.regen=99;
	        }
	    else if (tempid.contents==4){
	        global.flasks+=1;
	        bubbletext="$$$You got a &!##$$Flask capacity#$$$$increased.";
	        global.flashr=200;
	        global.flashg=100;
	        global.flashb=200;
	        if (global.flasks>99)
	            global.flasks=99;
	        }
	    else if (tempid.contents==5){
	        global.item[0]+=1;
	        bubbletext="#$$$You got the#$$* Eastern Key!";
	        global.flashr=200;
	        global.flashg=200;
	        global.flashb=200;
	        }
	    else if (tempid.contents==6){
	        global.item[1]+=1;
	        bubbletext="#$$$You got the#$$; Western Key!";
	        global.flashr=200;
	        global.flashg=200;
	        global.flashb=100;
	        }
	    else if (tempid.contents==7){
	        global.item[2]+=1;
	        bubbletext="#$$$You got the#$[ Black Hole Key!";
	        global.flashr=200;
	        global.flashg=100;
	        global.flashb=100;
	        }
	    else if (tempid.contents==8){
	        global.item[3]+=1;
	        bubbletext="#$$$You got the#$$] Nothern Key!";
	        global.flashr=100;
	        global.flashg=200;
	        global.flashb=200;
	        }
	    else if (tempid.contents==9){
	        global.item[4]+=1;
	        bubbletext="#$$$You got the#$$$^ Royal Key!";
	        global.flashr=200;
	        global.flashg=100;
	        global.flashb=200;
	        }
	    else if (tempid.contents==10){
	        global.item[5]+=1;
	        bubbletext="#$$$You found a#$| Chocolate Box!";
	        global.flashr=200;
	        global.flashg=200;
	        global.flashb=200;
	        }
	    //throw up textbubble
	    scr_singlebubble(bubbletext,"",0,0);
	    //open chest
	    global.chestopened[tempid.tag]=1;
	    with (tempid){
	        instance_destroy();
	        instance_create_depth(x,y,50,obj_openchest);
	        }
	    }

	//Find open chest
	tempid=-1;
	tempid=instance_place(argument0,argument1,obj_openchest);
	if (tempid>-1 && !foundsomething){
	    if (global.maymarry==1){
	        foundsomething=1;
	        ignoreall=1;
	        sfx_play(snd_explo);
	        bubble=instance_create_depth(get_xview(),get_yview(),-100,obj_textbubble);
	        bubble.texts=tempid.texts;
	        bubble.aftertexts=tempid.aftertexts;
	        bubble.marry=1;
	        bubble.text[0]="";
	        bubble.aftertext[0]="";
	        bubble.name="an empty chest";
	        //Correct y
	        if (obj_you.y<get_yview()+(get_hview()/2)-16)
	            bubble.y=get_yview()+get_hview()-40;
	        //grab first text
	        with (bubble){
	            marry=1;
	            finaltext="Marry#"+name+"?##$$$$$No$$$Yes";
	            global.marryname="Remedy";
	            global.marrytag=999;
	            finaltext=scr_linebreak(finaltext,148);
	            }
	        }
	    else{
	        foundsomething=1;
	        scr_singlebubble("#$$$It's empty.","",0,0);
	        sfx_play(snd_explo);
	        }
	    }

	//Find orb
	tempid=-1;
	tempid=instance_place(argument0,argument1,obj_orb);
	if (tempid>-1 && !foundsomething){
	    foundsomething=1;
	    if (tempid.type==0)
	        scr_singlebubble("#64 NPCs,66 endings#6000 lines of code#Endboss HP: 2688","Secret orb",1,0);
	    else if (tempid.type==1)
	        scr_singlebubble("#Hold Right on the difficulty select screen for 5 sec.","Forgotten orb",1,0);
	    sfx_play(snd_explo);
	    }
	//Find superchest
	tempid=-1;
	tempid=instance_place(argument0,argument1,obj_superchest);
	if (tempid>-1 && !foundsomething){
	    if (global.maymarry==1){
	        foundsomething=1;
	        ignoreall=1;
	        sfx_play(snd_explo);
	        bubble=instance_create_depth(get_xview(),get_yview(),-100,obj_textbubble);
	        bubble.texts=tempid.texts;
	        bubble.aftertexts=tempid.aftertexts;
	        bubble.marry=1;
	        bubble.text[0]="";
	        bubble.aftertext[0]="";
	        bubble.name="Jealous chest";
	        //Correct y
	        if (obj_you.y<get_yview()+(get_hview()/2)-16)
	            bubble.y=get_yview()+get_hview()-40;
	        //grab first text
	        with (bubble){
	            marry=1;
	            finaltext="Marry#"+name+"?##$$$$$No$$$Yes";
	            global.marryname="Jealous chest";
	            global.marrytag=998;
	            finaltext=scr_linebreak(finaltext,148);
	            }
	        }
	    else{
	        foundsomething=1;
	        nochests=1;
	        for (i=0;i<256;i+=1){
	            if (global.chestopened[i]==1)
	                nochests=0;
	            }
	        if (nochests){
	            ignoreall=1;
	            sfx_play(snd_openchest);
	            global.force+=1;
	            if (global.force==2)
	                bubbletext="$You got < Pill!##$$$$Shot power#$$$$increased.";
	            else if (global.force==3)
	                bubbletext="$You got < Shot!##$$$$Shot power#$$$$increased.";
	            else if (global.force==4)
	                bubbletext="$You got < Magic!##$$$$Shot power#$$$$increased.";
	            else if (global.force==5)
	                bubbletext="$You got < Tiara!##$$$$Shot power#$$$$increased.";
	            else
	                bubbletext="$You got ? Frog!##$$$$Shot power#$$$$increased.";
	            global.flashr=200;
	            global.flashg=200;
	            global.flashb=100;
	            if (global.force>99)
	                global.force=99;
	            //throw up textbubble
	            scr_singlebubble(bubbletext,"",0,0);
	            //open chest
	            with (tempid){
	                instance_destroy();
	                instance_create_depth(x,y,50,obj_openchest);
	                }
	            global.hyperchest=1;
	            }
	        else{
	            scr_singlebubble("#You have opened others before me.","Jealous chest",1,0);
	            sfx_play(snd_explo);
	            }
	        }
	    }

	//Nothing found, pause
	if (!foundsomething){
	    foundsomething=1;
	    ignoreall=1;
	    sfx_play(snd_openchest);
	    instance_create_depth(get_xview(),get_yview(),-100,obj_pause);
	    }





}
