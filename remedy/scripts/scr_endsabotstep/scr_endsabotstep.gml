function scr_endsabotstep() {
	scr_joy(0);
	scr_input();

	if (pressescape && !pressescapeprev){
	    scr_stopmusic();
	    scr_saveoptions();
	    room_goto(rom_title);
	    }

	endingtalk=1;
	if (endingtalk){
	    if (endingtalkcyc<10000)
	        endingtalkcyc+=1;
	    if (endingtalkcyc==1){
	        endingline[0]="##And so, Remedy#became Queen#of Healland.";
	        if (global.marrytag==3){
	            endingline[1]="##She and#"+global.marryname+"#ruled evilly,";
	            endingline[2]="##and they#lived happily#ever after.";
	            }
	        else if (global.marrytag==53){
	            endingline[1]="##She ruled justly#and lived       #happily,";
	            endingline[2]="##not that the    #Apathetic Frog  #cared.";
	            }
	        else if (global.marrytag==63){
	            endingline[1]="##She and#"+global.marryname+"#ruled justly,";
	            endingline[2]="##and their hearts#remained forever#whole.";
	            }
	        else if (global.marrytag==999){
	            endingline[1]="##She and#an empty chest#ruled justly,";
	            endingline[2]="##and they#lived happily#ever after.";
	            }
	        else{
	            endingline[1]="##She and#"+global.marryname+"#ruled justly,";
	            endingline[2]="##and they#lived happily#ever after.";
	            }
        
	        if (global.marrytag==53)
	            endingline[3]="##"+global.marryname+":#";
	        else
	            endingline[3]="#"+global.marryname+":#";
	              if (global.marrytag==0) endingline[3]+="Wak wak! I'm the#king, baby!     #Bread crumbs for#everyone!       ";
	         else if (global.marrytag==1) endingline[3]+="I was just a    #commoner, but   #love has no     #boundaries!     ";
	         else if (global.marrytag==2) endingline[3]+="I hereby decree #that everyone   #should game jam!#                ";
	         else if (global.marrytag==3) endingline[3]+="Now to take over#the world! With #your permission,#my Queen...     ";
	         else if (global.marrytag==4) endingline[3]+="I am the flower #who is king! My #friends should  #see me now!     ";
	         else if (global.marrytag==5) endingline[3]+="I vow to        #eradicate the   #stubbed toe     #disease!        ";
	         else if (global.marrytag==6) endingline[3]+="Oh, Remedy! You #love me         #eventhough I'm a#slime!          ";
	         else if (global.marrytag==7) endingline[3]+="Slimes and      #people now live #in harmony! All #right!          ";
	         else if (global.marrytag==8) endingline[3]+="I'm so happy, I #could dance!    #Party on,       #citizens!       ";
	         else if (global.marrytag==9) endingline[3]+="I get lots of   #flowers from my #fans now that I #am king!        ";
	        else if (global.marrytag==10) endingline[3]+="The classic     #marriage of the #princess and the#tutorial guy!   ";
	        else if (global.marrytag==11) endingline[3]+="I'm the happiest#crocoface in the#kingdom!        #                ";
	        else if (global.marrytag==12) endingline[3]+="Queen Remedy    #obviously chose #me for my unique#looks!          ";
	        else if (global.marrytag==13) endingline[3]+="I am King Romeo!#Of this, I am   #most certain!   #                ";
	        else if (global.marrytag==14) endingline[3]+="No more cleaning#the chamberpot  #for Prince      #Hingst!         ";
	        else if (global.marrytag==15) endingline[3]+="I am King Lambo!#Of this, I am   #most certain!   #                ";
	        else if (global.marrytag==16) endingline[3]+="Forget being a  #rock! Now I'm   #Remedy's queen! #                ";
	        else if (global.marrytag==17) endingline[3]+="Don't worry     #people, I was   #magically       #turned 18!      ";
	        else if (global.marrytag==18) endingline[3]+="Let's add some  #secret passages #to the castle,  #Queen Remedy!   ";
	        else if (global.marrytag==19) endingline[3]+="I'm the king!   #But some people #say I look like #a queen.        ";
	        else if (global.marrytag==20) endingline[3]+="I decree that   #every day is    #skeleton dance  #day!            ";
	        else if (global.marrytag==21) endingline[3]+="I couldn't think#of a pun about  #skeletons to say#here!           ";
	        else if (global.marrytag==22) endingline[3]+="I must say Queen#Remedy has      #excellent taste #in bros!        ";
	        else if (global.marrytag==23) endingline[3]+="Who cares about #money? I have   #the love of my  #life!           ";
	        else if (global.marrytag==24) endingline[3]+="Me, Tippsie and #Queen Remedy are#an adventuring  #trio now!       ";
	        else if (global.marrytag==25) endingline[3]+="An infinite     #supply of royal #potions. This is#the life!       ";
	        else if (global.marrytag==26) endingline[3]+="I never thought #I'd marry a girl#from Saturn!    #                ";
	        else if (global.marrytag==27) endingline[3]+="Now that I am a #queen, people   #respect my      #tallness!       ";
	        else if (global.marrytag==28) endingline[3]+="I'm the punniest#king in all the #world!          #                ";
	        else if (global.marrytag==29) endingline[3]+="It is hereby    #illegal to step #on spiders!     #                ";
	        else if (global.marrytag==30) endingline[3]+="This throne is  #kind of hard to #sit in with this#many legs.      ";
	        else if (global.marrytag==31) endingline[3]+="I can't set up  #my web in here, #or I might catch#my own servants!";
	        else if (global.marrytag==32) endingline[3]+="I'm so generic, #even as a king I#wear my casual  #clothes!        ";
	        else if (global.marrytag==33) endingline[3]+="No more hanging #in bars for me! #My life has     #turned around!  ";
	        else if (global.marrytag==34) endingline[3]+="This was most   #unexpected. How #in the world did#this happen?    ";
	        else if (global.marrytag==35) endingline[3]+="I am enamored   #with Remedy's   #ability to find #secret rooms!   ";
	        else if (global.marrytag==36) endingline[3]+="Wow, Remedy! How#long did you    #hold this secret#crush on me?    ";
	        else if (global.marrytag==37) endingline[3]+="The princess of #Saturn proposed #to me in a black#hole! Wait, huh?";
	        else if (global.marrytag==38) endingline[3]+="I have so many  #friends now! I  #love you, Queen #Remedy!         ";
	        else if (global.marrytag==39) endingline[3]+="My daughter, I  #think we need to#have a talk     #about this...   ";
	        else if (global.marrytag==40) endingline[3]+="I can buy all   #the burgers I   #want now!       #                ";
	        else if (global.marrytag==41) endingline[3]+="I finally get   #all the sunlight#I need now!     #                ";
	        else if (global.marrytag==42) endingline[3]+="We still visit  #the Spider Cave #from time to    #time!           ";
	        else if (global.marrytag==43) endingline[3]+="I finally found #someone who     #isn't scared of #ghosts!         ";
	        else if (global.marrytag==44) endingline[3]+="Don't worry, the#Moon bunny takes#care of the Moon#Garden now!     ";
	        else if (global.marrytag==45) endingline[3]+="I'm the king of #sick burns now! #Wha-pow!        #                ";
	        else if (global.marrytag==46) endingline[3]+="Remedy unmelted #me with her     #coolness. Love  #at first sight! ";
	        else if (global.marrytag==47) endingline[3]+="Remedy, I hope  #it's okay that  #my face melts   #sometimes.      ";
	        else if (global.marrytag==48) endingline[3]+="I don't wet my  #bandages        #anymore!        #                ";
	        else if (global.marrytag==49) endingline[3]+="People are      #careful not to  #step on my      #bandages now.   ";
	        else if (global.marrytag==50) endingline[3]+="I am a queen    #once more. How  #magnificent!    #                ";
	        else if (global.marrytag==51) endingline[3]+="No really, my   #bandages are not#made of ordinary#paper!          ";
	        else if (global.marrytag==52) endingline[3]+="Hey Queen, let's#invent cars so  #we can drive    #really fast!    ";
	        else if (global.marrytag==53) endingline[3]+="...             #                #                #                ";
	        else if (global.marrytag==54) endingline[3]+="A Saturnian and #a Valkyrie! It's#a marriage out  #of a story book!";
	        else if (global.marrytag==55) endingline[3]+="Only Queen      #Remedy knows    #what I look like#under my hood!  ";
	        else if (global.marrytag==56) endingline[3]+="Now that I'm    #king, I try not #to be too crazy.#                ";
	        else if (global.marrytag==57) endingline[3]+="I may be a      #Valkyrie, but   #now my job is to#rule this land! ";
	        else if (global.marrytag==58) endingline[3]+="Tak proste jak! #Liten duva      #dansar ofta till#jazz!           ";
	        else if (global.marrytag==59) endingline[3]+="I am a servant  #no more! Hooray #for Queen       #Remedy!         ";
	        else if (global.marrytag==60) endingline[3]+="Is now a good   #time to tell you#that I laugh    #like a horse?   ";
	        else if (global.marrytag==61) endingline[3]+="I'm the king! I #decree          #everything!     #                ";
	        else if (global.marrytag==62) endingline[3]+="We're both from #outer space, but#we care greatly #for this land!  ";
	        else if (global.marrytag==63) endingline[3]+="Oh, Remmy! I'm  #the happiest    #queen in the    #world!          ";
	       else if (global.marrytag==998) endingline[3]+="Of all the      #chests in the   #land, Remedy    #chose me!       ";
	       else if (global.marrytag==999) endingline[3]+="Chests - perfect#for climbing    #inside after a  #hard day's work!";
        
	        nextstr="";
	        if (global.hearts<10)
	            nextstr+=" ";
	        nextstr+=string(global.hearts)+"/80 >Hearts#";
	        if (global.force<10)
	            nextstr+=" ";
	        nextstr+="$"+string(global.force)+"/5 <Power#";
	        if (global.multi<10)
	            nextstr+=" ";
	        nextstr+="$"+string(global.multi)+"/5 @Multi#";
	        if (global.regen<10)
	            nextstr+=" ";
	        nextstr+=""+string(global.regen)+"/10 \\Regen#";
	        if (global.flasks<10)
	            nextstr+=" ";
	        nextstr+=""+string(global.flasks)+"/10 &Flasks";
        
	        comprate=(global.hearts-6)+(global.force-1)+(global.multi-1)+(global.regen-1)+(global.flasks-1);
	        nextstr+="#Time: "+timestring+"#Completion: "+string(comprate)+"%";
	        endingline[4]=nextstr;
        
	        endingline[5]="#Game by#Daniel Remar#Anton Nilsson#Mattias Hakulinen#Stefan Hurtig";
	        if (global.difficulty==2)
	            endingline[6]="#WOW! YOU ARE A#GAME MASTER!!!##$$Push button#$$$to replay";
	        else
	            endingline[6]="##$$$$The End##$$Push button#$$$to replay";
	        }
    
	    if (endingtalkcyc==30){
	        endinglength=string_length(endingline[0]);
	        endinglengthcyc=0;
	        realendingstring=endingline[0];
	        endingstep=0;
	        }
	    if (endingtalkcyc>=45 && endingtalkcyc<118){
	        if (pressinteract && !pressinteractprev)
	            endingtalkcyc=119;
	        }
	    if (endingtalkcyc==120){
	        endinglength=string_length(endingline[1]);
	        endinglengthcyc=0;
	        realendingstring=endingline[1];
	        endingstep=0;
	        }
	    if (endingtalkcyc>=135 && endingtalkcyc<208){
	        if (pressinteract && !pressinteractprev)
	            endingtalkcyc=209;
	        }
	    if (endingtalkcyc==210){
	        endinglength=string_length(endingline[2]);
	        endinglengthcyc=0;
	        realendingstring=endingline[2];
	        endingstep=0;
	        }
	    if (endingtalkcyc>=225 && endingtalkcyc<298){
	        if (pressinteract && !pressinteractprev)
	            endingtalkcyc=299;
	        }
	    if (endingtalkcyc==300){
	        endinglength=string_length(endingline[3]);
	        endinglengthcyc=0;
	        realendingstring=endingline[3];
	        endingstep=0;
	        }
	    if (endingtalkcyc>=315 && endingtalkcyc<418){
	        if (pressinteract && !pressinteractprev)
	            endingtalkcyc=419;
	        }
	    if (endingtalkcyc==420){
	        endinglength=string_length(endingline[4]);
	        endinglengthcyc=0;
	        realendingstring=endingline[4];
	        endingstep=0;
	        }
	    if (endingtalkcyc>=435 && endingtalkcyc<628){
	        if (pressinteract && !pressinteractprev)
	            endingtalkcyc=629;
	        }
	    if (endingtalkcyc==630){
	        endinglength=string_length(endingline[5]);
	        endinglengthcyc=0;
	        realendingstring=endingline[5];
	        endingstep=0;
	        }
	    if (endingtalkcyc>=645 && endingtalkcyc<748){
	        if (pressinteract && !pressinteractprev)
	            endingtalkcyc=749;
	        }
	    if (endingtalkcyc==750){
	        endinglength=string_length(endingline[6]);
	        endinglengthcyc=0;
	        realendingstring=endingline[6];
	        endingstep=0;
	        }
	    if (endingtalkcyc>=800 && transition==0){
	        if (pressinteract && !pressinteractprev){
	            transition=2;
	            with (obj_explopart)
	                instance_destroy();
	            }
	        }
	    /*
	    else if (endingtalkcyc==570){
	        endingtalk=0;
	        endinglength=0;
	        endinglengthcyc=0;
	        realendingstring="";
	        endingstep=0;
	        }
	    */
	    }

	//Fireworks
	if (endingtalkcyc>=750 && transition==0 && global.difficulty==2){
	    fireworkcyc+=1;
	    if (fireworkcyc>=10){
	        fireworkcyc=0;
	        temprandx=8+floor(random(144));
	        temprandy=8+floor(random(32));
	        fireworkcolor=floor(random(5));
	        for (i=0;i<16;i+=1){
	            tempid=instance_create(temprandx,temprandy,obj_explopart);
	            tempid.slow=1;
	            tempid.speed=3+(i mod 2)*3;
	            tempid.direction=i*22.5;
	            tempid.depth=900000;
	            if (fireworkcolor==4)
	                tempid.imgshift=floor(random(4));
	            else
	                tempid.imgshift=fireworkcolor;
	            }
	        }
	    }



}
