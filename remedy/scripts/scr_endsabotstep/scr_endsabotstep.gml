function scr_endsabotstep() {
	scr_joy(0);
	scr_input();

	if (pressescape && !pressescapeprev){
	    scr_stopmusic();
	    scr_saveoptions();
	    room_goto(rom_title);
	    }

	endingtalk = 1;
	if (endingtalk) {
	    if (endingtalkcyc < 10000)
	        endingtalkcyc += 1;
	    if (endingtalkcyc == 1) {
	        endingline[0] = "##And so, Remedy#became Queen#of Healland.";
	        if (global.marrytag == 3) {
	            endingline[1] = "##She and#" + global.marryname + "#ruled evilly,";
	            endingline[2] = "##and they#lived happily#ever after.";
	        }
	        else if (global.marrytag == 53) {
	            endingline[1] = "##She ruled justly#and lived       #happily,";
	            endingline[2] = "##not that the    #Apathetic Frog  #cared.";
	        }
	        else if (global.marrytag == 63) {
	            endingline[1] = "##She and#" + global.marryname + "#ruled justly,";
	            endingline[2] = "##and their hearts#remained forever#whole.";
	        }
	        else if (global.marrytag == 999) {
	            endingline[1] = "##She and#an empty chest#ruled justly,";
	            endingline[2] = "##and they#lived happily#ever after.";
	        }
	        else {
	            endingline[1] = "##She and#"+global.marryname+"#ruled justly,";
	            endingline[2] = "##and they#lived happily#ever after.";
	        }
        
	        if (global.marrytag == 53)
	            endingline[3] = "##"+global.marryname+":#";
	        else
	            endingline[3] = "#"+global.marryname+":#";
			
			// Initialize all the marriage quotes
			static ending_lines = [
				"Wak wak! I'm the#king, baby!     #Bread crumbs for#everyone!       ",
				"I was just a    #commoner, but   #love has no     #boundaries!     ",
				"I hereby decree #that everyone   #should game jam!#                ",
				"Now to take over#the world! With #your permission,#my Queen...     ",
				"I am the flower #who is king! My #friends should  #see me now!     ",
				"I vow to        #eradicate the   #stubbed toe     #disease!        ",
				"Oh, Remedy! You #love me         #eventhough I'm a#slime!          ",
				"Slimes and      #people now live #in harmony! All #right!          ",
				"I'm so happy, I #could dance!    #Party on,       #citizens!       ",
				"I get lots of   #flowers from my #fans now that I #am king!        ",
				"The classic     #marriage of the #princess and the#tutorial guy!   ",
				"I'm the happiest#crocoface in the#kingdom!        #                ",
				"Queen Remedy    #obviously chose #me for my unique#looks!          ",
				"I am King Romeo!#Of this, I am   #most certain!   #                ",
				"No more cleaning#the chamberpot  #for Prince      #Hingst!         ",
				"I am King Lambo!#Of this, I am   #most certain!   #                ",
				"Forget being a  #rock! Now I'm   #Remedy's queen! #                ",
				"Don't worry     #people, I was   #magically       #turned 18!      ",
				"Let's add some  #secret passages #to the castle,  #Queen Remedy!   ",
				"I'm the king!   #But some people #say I look like #a queen.        ",
				"I decree that   #every day is    #skeleton dance  #day!            ",
				"I couldn't think#of a pun about  #skeletons to say#here!           ",
				"I must say Queen#Remedy has      #excellent taste #in bros!        ",
				"Who cares about #money? I have   #the love of my  #life!           ",
				"Me, Tippsie and #Queen Remedy are#an adventuring  #trio now!       ",
				"An infinite     #supply of royal #potions. This is#the life!       ",
				"I never thought #I'd marry a girl#from Saturn!    #                ",
				"Now that I am a #queen, people   #respect my      #tallness!       ",
				"I'm the punniest#king in all the #world!          #                ",
				"It is hereby    #illegal to step #on spiders!     #                ",
				"This throne is  #kind of hard to #sit in with this#many legs.      ",
				"I can't set up  #my web in here, #or I might catch#my own servants!",
				"I'm so generic, #even as a king I#wear my casual  #clothes!        ",
				"No more hanging #in bars for me! #My life has     #turned around!  ",
				"This was most   #unexpected. How #in the world did#this happen?    ",
				"I am enamored   #with Remedy's   #ability to find #secret rooms!   ",
				"Wow, Remedy! How#long did you    #hold this secret#crush on me?    ",
				"The princess of #Saturn proposed #to me in a black#hole! Wait, huh?",
				"I have so many  #friends now! I  #love you, Queen #Remedy!         ",
				"My daughter, I  #think we need to#have a talk     #about this...   ",
				"I can buy all   #the burgers I   #want now!       #                ",
				"I finally get   #all the sunlight#I need now!     #                ",
				"We still visit  #the Spider Cave #from time to    #time!           ",
				"I finally found #someone who     #isn't scared of #ghosts!         ",
				"Don't worry, the#Moon bunny takes#care of the Moon#Garden now!     ",
				"I'm the king of #sick burns now! #Wha-pow!        #                ",
				"Remedy unmelted #me with her     #coolness. Love  #at first sight! ",
				"Remedy, I hope  #it's okay that  #my face melts   #sometimes.      ",
				"I don't wet my  #bandages        #anymore!        #                ",
				"People are      #careful not to  #step on my      #bandages now.   ",
				"I am a queen    #once more. How  #magnificent!    #                ",
				"No really, my   #bandages are not#made of ordinary#paper!          ",
				"Hey Queen, let's#invent cars so  #we can drive    #really fast!    ",
				"...             #                #                #                ",
				"A Saturnian and #a Valkyrie! It's#a marriage out  #of a story book!",
				"Only Queen      #Remedy knows    #what I look like#under my hood!  ",
				"Now that I'm    #king, I try not #to be too crazy.#                ",
				"I may be a      #Valkyrie, but   #now my job is to#rule this land! ",
				"Tak proste jak! #Liten duva      #dansar ofta till#jazz!           ",
				"I am a servant  #no more! Hooray #for Queen       #Remedy!         ",
				"Is now a good   #time to tell you#that I laugh    #like a horse?   ",
				"I'm the king! I #decree          #everything!     #                ",
				"We're both from #outer space, but#we care greatly #for this land!  ",
				"Oh, Remmy! I'm  #the happiest    #queen in the    #world!          ",
			];
			ending_lines[998] = "Of all the      #chests in the   #land, Remedy    #chose me!       ";
			ending_lines[999] = "Chests - perfect#for climbing    #inside after a  #hard day's work!";
			endingline[3] += ending_lines[global.marrytag];
        
			// Show stats
			nextstr = "";
	        if (global.hearts < 10) nextstr += " ";
	        nextstr += string(global.hearts) + "/80 >Hearts#";
	        if (global.force < 10) nextstr += " ";
	        nextstr += "$" + string(global.force) + "/5 <Power#";
	        if (global.multi < 10) nextstr += " ";
	        nextstr += "$" + string(global.multi) + "/5 @Multi#";
	        if (global.regen < 10) nextstr += " ";
	        nextstr += string(global.regen) + "/10 \\Regen#";
	        if (global.flasks < 10) nextstr += " ";
	        nextstr += string(global.flasks) + "/10 &Flasks";
        
	        comprate = (global.hearts-6) + (global.force-1) + (global.multi-1) + (global.regen-1) + (global.flasks-1);
	        nextstr += "#Time: " + timestring + "#Completion: " + string(comprate) + "%";
	        endingline[4] = nextstr;
        
			// Show credits
	        endingline[5] = "#Game by#Daniel Remar#Anton Nilsson#Mattias Hakulinen#Stefan Hurtig";
			
			// Port credits
			endingline[6] = "#Port by#sukus";
			
			// Show final thing
	        if (global.difficulty==2)
	            endingline[7] = "#WOW! YOU ARE A#GAME MASTER!!!##$$Push button#$$$to replay";
	        else
	            endingline[7] = "##$$$$The End##$$Push button#$$$to replay";
	    }
    
		// "and so..."
	    if (endingtalkcyc == 30) {
	        endinglength = string_length(endingline[0]);
	        endinglengthcyc = 0;
	        realendingstring = endingline[0];
	        endingstep = 0;
	    }
	    if (endingtalkcyc >= 45 && endingtalkcyc < 118) {
	        if (pressinteract && !pressinteractprev)
	            endingtalkcyc = 119;
	    }
		
		// "ruled justly"
	    if (endingtalkcyc == 120) {
	        endinglength = string_length(endingline[1]);
	        endinglengthcyc = 0;
	        realendingstring = endingline[1];
	        endingstep = 0;
	    }
	    if (endingtalkcyc >= 135 && endingtalkcyc < 208) {
	        if (pressinteract && !pressinteractprev)
	            endingtalkcyc = 209;
	    }
		
		// "lived happily ever after"
	    if (endingtalkcyc == 210) {
	        endinglength = string_length(endingline[2]);
	        endinglengthcyc = 0;
	        realendingstring = endingline[2];
	        endingstep = 0;
	    }
	    if (endingtalkcyc >= 225 && endingtalkcyc < 298) {
	        if (pressinteract && !pressinteractprev)
	            endingtalkcyc = 299;
	    }
		
		// Partner quote
	    if (endingtalkcyc == 300) {
	        endinglength = string_length(endingline[3]);
	        endinglengthcyc = 0;
	        realendingstring = endingline[3];
	        endingstep = 0;
	    }
	    if (endingtalkcyc >= 315 && endingtalkcyc < 418) {
	        if (pressinteract && !pressinteractprev)
	            endingtalkcyc = 419;
	    }
		
		// Completion stats
	    if (endingtalkcyc == 420) {
	        endinglength = string_length(endingline[4]);
	        endinglengthcyc = 0;
	        realendingstring = endingline[4];
	        endingstep = 0;
	    }
	    if (endingtalkcyc >= 435 && endingtalkcyc < 628) {
	        if (pressinteract && !pressinteractprev)
	            endingtalkcyc = 629;
	    }
		
		// Original credits
	    if (endingtalkcyc == 630) {
	        endinglength = string_length(endingline[5]);
	        endinglengthcyc = 0;
	        realendingstring = endingline[5];
	        endingstep = 0;
	    }
	    if (endingtalkcyc >= 645 && endingtalkcyc < 748) {
	        if (pressinteract && !pressinteractprev)
	            endingtalkcyc = 749;
	    }
		
		// Port credits
	    if (endingtalkcyc == 750) {
	        endinglength = string_length(endingline[6]);
	        endinglengthcyc = 0;
	        realendingstring = endingline[6];
	        endingstep = 0;
	    }
	    if (endingtalkcyc >= 765 && endingtalkcyc < 798) {
	        if (pressinteract && !pressinteractprev)
	            endingtalkcyc = 749;
	    }
		
		// "play again" text
		if (endingtalkcyc == 800) {
	        endinglength = string_length(endingline[7]);
	        endinglengthcyc = 0;
	        realendingstring = endingline[7];
	        endingstep = 0;
	    }
	    if (endingtalkcyc >= 850 && transition == 0) {
	        if (pressinteract && !pressinteractprev) {
	            transition = 2;
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

	// Fireworks
	if (endingtalkcyc >= 750 && transition == 0 && global.difficulty == 2) {
	    fireworkcyc += 1;
	    if (fireworkcyc >= 10){
	        fireworkcyc = 0;
	        temprandx = 8+floor(random(144));
	        temprandy = 8+floor(random(32));
	        fireworkcolor = floor(random(5));
	        for (i=0; i < 16; i += 1) {
	            tempid = instance_create_depth(temprandx,temprandy,-15,obj_explopart);
	            tempid.slow = 1;
	            tempid.speed = 3+(i mod 2)*3;
	            tempid.direction = i*22.5;
	            tempid.depth = 900000;
	            if (fireworkcolor == 4)
	                tempid.imgshift = floor(random(4));
	            else
	                tempid.imgshift = fireworkcolor;
	            }
	        }
	    }
}
