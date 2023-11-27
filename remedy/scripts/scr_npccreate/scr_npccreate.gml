function scr_npccreate() {
	if (tag==0){
	    sprite_index=spr_npc;
	    name="Ducklord";
	    if (global.difficulty==3){
	        texts=3;
	        text[0]="Wak wak...";
	        text[1]="I once had the Retrobattle highscore...";
	        text[2]="reallyjoel's dad beat it with his left eyebrow.";
	    }
	    else{
	        texts=2;
	        text[0]="Wak wak...";
	        text[1]="Bread crumbs... stuck in mouth...";
	    }
	    aftertexts=2;
	    aftertext[0]="Wak wak!";
	    aftertext[1]="Now I can eat many loaves of bread.";
	    battle=1;
	    }
	else if (tag==1){
	    sprite_index=spr_npc;
	    name="Sam";
	    if (global.difficulty==3){
	        texts=2;
	        text[0]="I looked at reallyjoel's dad's beard.";
	        text[1]="It looked back."
	        }
	    else{
	        texts=1;
	        text[0]="I guess I'm sick.";
	        }
	    aftertexts=1;
	    aftertext[0]="Thanks! I guess I wasn't sick after all!";
	    battle=2;
	    }
	else if (tag==2){
	    sprite_index=spr_npc;
	    name="Robin";
	    if (global.difficulty==3){
	        texts=3;
	        text[0]="reallyjoel's dad walked past my video game,";
	        text[1]="and I couldn't get it to work again.";
	        text[2]="The code had been replaced by highscore digits."
	        }
	    else{
	        texts=2;
	        text[0]="Ungh... I game jammed for four days straight.";
	        text[1]="I don't think I can feel my body.";
	        }
	    aftertexts=2;
	    aftertext[0]="Hey, thanks.";
	    aftertext[1]="I'm gonna lie down for, like, a week now.";
	    battle=3;
	    }
	else if (tag==3){
	    sprite_index=spr_npc;
	    name="Dark Lord";
	    texts=1;
	    text[0]="Sigh. Some hero struck me down.";
	    aftertexts=1;
	    aftertext[0]="Wow! Now I can conquer the world.";
	    battle=40;
	    }
	else if (tag==4){
	    sprite_index=spr_npc;
	    name="Flowerman";
	    if (global.difficulty==3){
	        texts=2;
	        text[0]="I challenged rellyjoel's dad to a game of chess.";
	        text[1]="He made eight home runs in three moves.";
	        }
	    else{
	        texts=1;
	        text[0]="Pfft! Living glass shards in the grass!";
	        }
	    aftertexts=2;
	    aftertext[0]="Thank you. Now that you have slain the glass,";
	    aftertext[1]="I can prance in it safely.";
	    battle=4;
	    }
	else if (tag==5){
	    sprite_index=spr_npc;
	    name="Kentaur girl";
	    texts=1;
	    text[0]="I suffer from the stubbed toe illness.";
	    aftertexts=2;
	    aftertext[0]="My toe is all better!";
	    aftertext[1]="Now I can continue kicking rocks around.";
	    battle=11;
	    }
	else if (tag==6){
	    sprite_index=spr_npc;
	    name="Stinky";
	    texts=1;
	    text[0]="I smell a little...";
	    aftertexts=1;
	    aftertext[0]="Thank you! Now I smell more than ever.";
	    battle=7;
	    }
	else if (tag==7){
	    sprite_index=spr_npc;
	    name="Wobbly";
	    texts=1;
	    text[0]="Blr blr brl...";
	    aftertexts=1;
	    aftertext[0]="Oh, thanks! I had lost my voice.";
	    battle=8;
	    }
	else if (tag==8){
	    sprite_index=spr_npc;
	    name="Tulip X";
	    if (global.difficulty==3){
	        texts=1;
	        text[0]="I'm sad because you won't be able to heal me.";
	        }
	    else{
	        texts=1;
	        text[0]="I'm sad because of reasons.";
	        }
	    aftertexts=1;
	    aftertext[0]="Reasons to be happy? Why, thank you!";
	    battle=5;
	    }
	else if (tag==9){
	    sprite_index=spr_npc;
	    name="Kentaur boy";
	    texts=1;
	    text[0]="I believe I might be from Earth.";
	    aftertexts=2;
	    aftertext[0]="It's all so clear now!";
	    aftertext[1]="I'm mythical, so I don't exist."
	    battle=12;
	    }
	else if (tag==10){
	    sprite_index=spr_npc;
	    name="Brad";
	    texts=1;
	    text[0]="";
	    //NONE
	    aftertexts=2;
	    aftertext[0]="Press Escape to save the game and quit.";
	    aftertext[1]="Whatever that means.";
	    battle=0;
	    }
	else if (tag==11){
	    sprite_index=spr_npc;
	    name="Face";
	    texts=1;
	    text[0]="I laughed so hard, it made my face hurt.";
	    aftertexts=1;
	    aftertext[0]="I can laugh again! Thanks!";
	    battle=38;
	    }
	else if (tag==12){
	    sprite_index=spr_npc;
	    name="Ron";
	    texts=1;
	    text[0]="";
	    //NONE
	    if (global.difficulty==3){
	        aftertexts=2;
	        aftertext[0]="Hold Shift to run really fast. But it still won't be";
	        aftertext[1]="enough to beat reallyjoel's dad difficulty.";
	        }
	    else{
	        aftertexts=1;
	        aftertext[0]="Hold Shift to run really fast. Maybe too fast.";
	        }
	    battle=0;
	    }
	else if (tag==13){
	    sprite_index=spr_npc;
	    name="Romeo";
	    texts=2;
	    text[0]="Am I Romeo? Or am I Lambo?";
	    text[1]="I'm so confused! Help!";
	    aftertexts=1;
	    aftertext[0]="Aha! I am Romeo, of course.";
	    battle=9;
	    }
	else if (tag==14){
	    sprite_index=spr_npc;
	    name="Jeff";
	    texts=1;
	    text[0]="";
	    //NONE
	    aftertexts=5;
	    aftertext[0]="The Prince is on the second floor.";
	    aftertext[1]="Everyone evacuated when he got sick.";
	    aftertext[2]="You know, in case it's contagious.";
	    aftertext[3]="What's his illness? See for yourself...";
	    aftertext[4]="Better go prepare yourself first.";
	    battle=0;
	    }
	else if (tag==15){
	    sprite_index=spr_npc;
	    name="Lambo";
	    texts=2;
	    text[0]="Am I Lambo? Or am I Romeo?";
	    text[1]="I'm so confused! Help!";
	    aftertexts=1;
	    aftertext[0]="Now I understand. I am Lambo.";
	    battle=10;
	    }
	else if (tag==16){
	    sprite_index=spr_npc;
	    name="Camilla";
	    texts=1;
	    text[0]="I am a rock... I am a rock...";
	    aftertexts=1;
	    aftertext[0]="What, I'm not a rock? Bogus.";
	    battle=41;
	    }
	else if (tag==17){
	    sprite_index=spr_npc;
	    name="Shark";
	    texts=2;
	    text[0]="Aw, man. I'm only five years old.";
	    text[1]="I must be suffering from being too young.";
	    aftertexts=1;
	    aftertext[0]="Thanks! I'm six years old now.";
	    battle=47;
	    }
	else if (tag==18){
	    sprite_index=spr_npc;
	    name="Anki";
	    texts=1;
	    text[0]="";
	    //NONE
	    if (global.difficulty==3){
	        aftertexts=2;
	        aftertext[0]="reallyjoel's dad played this game once.";
	        aftertext[1]="He beat this difficulty before it existed.";
	        }
	    else{
	        aftertexts=2;
	        aftertext[0]="Hey! There's a secret passage in this house.";
	        aftertext[1]="I mean, it's a pretty obvious one, but still.";
	        }
	    battle=0;
	    }
	else if (tag==19){
	    sprite_index=spr_npc;
	    name="Flat";
	    texts=1;
	    text[0]="";
	    //NONE
	    aftertexts=1;
	    aftertext[0]="The action button throws Flasks in Healing Mode.";
	    battle=0;
	    }
	else if (tag==20){
	    sprite_index=spr_npc;
	    name="Mandark";
	    texts=1;
	    text[0]="I seem to have put on weight.";
	    aftertexts=1;
	    aftertext[0]="Thanks! I feel lighter already.";
	    battle=42;
	    }
	else if (tag==21){
	    sprite_index=spr_npc;
	    name="Lady";
	    texts=1;
	    text[0]="Oof! I bit my tongue.";
	    aftertexts=1;
	    aftertext[0]="Woo! Now I can eat again.";
	    battle=43;
	    }
	else if (tag==22){
	    sprite_index=spr_npc;
	    name="Bro";
	    texts=1;
	    text[0]="";
	    //NONE
	    aftertexts=1;
	    aftertext[0]="I heard Prince Hingst suffers from everything.";
	    battle=0;
	    }
	else if (tag==23){
	    sprite_index=spr_npc;
	    name="Mug";
	    texts=1;
	    text[0]="I lost all my money on the lottery.";
	    aftertexts=1;
	    aftertext[0]="Now I'm rich! Yay!";
	    battle=39;
	    }
	else if (tag==24){
	    sprite_index=spr_npc;
	    name="Ittle";
	    texts=2;
	    text[0]="We were out sailing when our raft crashed.";
	    text[1]="Now we suffer from a lack of raft...";
	    aftertexts=1;
	    aftertext[0]="Woohoo! An imaginary raft! Thanks!";
	    battle=30;
	    }
	else if (tag==25){
	    sprite_index=spr_npc;
	    name="Tippsie";
	    texts=2;
	    text[0]="P... p... ppppp...";
	    text[1]="P-potions... POTIOOONS!";
	    aftertexts=1;
	    aftertext[0]="Thanks for the potions. That was a close one.";
	    battle=31;
	    }
	else if (tag==26){
	    sprite_index=spr_npc;
	    name="Jenny";
	    if (global.difficulty==3){
	        texts=2;
	        text[0]="I tried to beat reallyjoel's dad's record.";
	        text[1]="What record? Mountaintop shark wrestling.";
	        }
	    else{
	        texts=1;
	        text[0]="I suffer from a severe case of death.";
	        }
	    aftertexts=1;
	    aftertext[0]="Thanks, now I'm all better.";
	    battle=6;
	    }
	else if (tag==27){
	    sprite_index=spr_npc;
	    name="Tall One";
	    texts=1;
	    text[0]="I'm so tall, everyone makes fun of me...";
	    aftertexts=2;
	    aftertext[0]="Well, at least you healed my vertigo.";
	    aftertext[1]="Thank you!";
	    battle=25;
	    }
	else if (tag==28){
	    sprite_index=spr_npc;
	    name="Rosepun";
	    texts=1;
	    text[0]="I'm sad because I was given a dumb name.";
	    aftertexts=1;
	    aftertext[0]="Hey, I could learn to live with my name! Thanks!";
	    battle=26;
	    }
	else if (tag==29){
	    sprite_index=spr_npc;
	    name="Daddy";
	    texts=1;
	    text[0]="I've got some web stuck in my teeth.";
	    aftertexts=1;
	    aftertext[0]="Now to continue eating this web!";
	    battle=21;
	    }
	else if (tag==30){
	    sprite_index=spr_npc;
	    name="Slinky";
	    texts=1;
	    text[0]="I have three legs too many.";
	    aftertexts=1;
	    aftertext[0]="Now I have ten legs too many! Hooray!";
	    battle=22;
	    }
	else if (tag==31){
	    sprite_index=spr_npc;
	    name="Kurt";
	    texts=1;
	    text[0]="I am incredibly buff and handsome.";
	    aftertexts=1;
	    aftertext[0]="Now I'm normal and average! Thank you!";
	    battle=23;
	    }
	else if (tag==32){
	    sprite_index=spr_npc;
	    name="Dude";
	    texts=1;
	    text[0]="";
	    //NONE
	    if (global.difficulty==3){
	        aftertexts=2;
	        aftertext[0]="Welcome to reallyjoel's dad difficulty.";
	        aftertext[1]="And good luck, I suppose.";
	        }
	    else{
	        aftertexts=1;
	        aftertext[0]="Welcome to Hurtland. It's terrible here.";
	        }
	    battle=0;
	    }
	else if (tag==33){
	    sprite_index=spr_npc;
	    name="Guy";
	    texts=1;
	    text[0]="";
	    //NONE
	    aftertexts=2;
	    aftertext[0]="Hey, where'd everyone go?";
	    aftertext[1]="I guess my jokes really are that bad.";
	    battle=0;
	    }
	else if (tag==34){
	    sprite_index=spr_npc;
	    name="Becker";
	    texts=1;
	    text[0]="";
	    //NONE
	    if (global.difficulty==3){
	        aftertexts=4;
	        aftertext[0]="When not facing someone, press the action button.";
	        aftertext[1]="This will let you see your stats.";
	        aftertext[2]="But if you were reallyjoel's dad, you would only";
	        aftertext[3]="see a bunch of nines all over the screen.";
	        }
	    else{
	        aftertexts=2;
	        aftertext[0]="When not facing someone, press the action button.";
	        aftertext[1]="This will let you see your stats.";
	        }
	    battle=0;
	    }
	else if (tag==35){
	    sprite_index=spr_npc;
	    name="Doc";
	    texts=1;
	    text[0]="";
	    //NONE
	    if (global.difficulty==3){
	        aftertexts=6;
	        aftertext[0]="The action button is not just one button.";
	        aftertext[1]="You could press Enter, or Control,";
	        aftertext[2]="or Spacebar, or Z, or X, or Y.";
	        aftertext[3]="You can also move with WASD.";
	        aftertext[4]="If a gamepad is plugged in, you can use that too.";
	        aftertext[5]="Not that it will help on this difficulty.";
	        }
	    else{
	        aftertexts=5;
	        aftertext[0]="The action button is not just one button.";
	        aftertext[1]="You could press Enter, or Control,";
	        aftertext[2]="or Spacebar, or Z, or X, or Y.";
	        aftertext[3]="You can also move with WASD.";
	        aftertext[4]="If a gamepad is plugged in, you can use that too.";
	        }
	    battle=0;
	    }
	else if (tag==36){
	    sprite_index=spr_npc;
	    name="Plait";
	    texts=1;
	    text[0]="";
	    //NONE
	    if (global.difficulty==3){
	        aftertexts=2;
	        aftertext[0]="Wow. You picked reallyjoel's dad difficulty?";
	        aftertext[1]="You don't like winning, do you?";
	        }
	    else{
	        aftertexts=3;
	        aftertext[0]="Hey, Remedy. I haven't seen your friend lately.";
	        aftertext[1]="Her name was Frallan, right? Healing graduate?";
	        aftertext[2]="Anyway, good luck down there!";
	        }
	    battle=0;
	    }
	else if (tag==37){
	    sprite_index=spr_npc;
	    name="Josefin";
	    texts=1;
	    text[0]="";
	    //NONE
	    aftertexts=2;
	    aftertext[0]="I've heard sighing from behind that door...";
	    aftertext[1]="and something about boxed chocolate.";
	    battle=0;
	    }
	else if (tag==38){
	    sprite_index=spr_npc;
	    name="Some girl";
	    texts=1;
	    text[0]="I wish I had friends...";
	    aftertexts=1;
	    aftertext[0]="We're friends now! Yay!";
	    battle=36;
	    }
	else if (tag==39){
	    sprite_index=spr_npc;
	    name="Queen Amelia";
	    texts=1;
	    text[0]="";
	    //NONE
	    if (global.difficulty==3){
	        aftertexts=7;
	        aftertext[0]="Oh, my dear Saturnian Princess Remedy,";
	        aftertext[1]="you have chosen the reallyjoel's dad difficulty.";
	        aftertext[2]="But you have just graduated from healing school,";
	        aftertext[3]="so you are not yet skilled enough to complete it.";
	        aftertext[4]="If you don't believe me, give it a try,";
	        aftertext[5]="but do choose an easier setting next time.";
	        aftertext[6]="Well, off you go!";
	        }
	    else{
	        aftertexts=8;
	        aftertext[0]="My dear Saturnian Princess Remedy, listen well.";
	        aftertext[1]="You may have just graduated from healing school,";
	        aftertext[2]="but you must now undertake a very difficult task.";
	        aftertext[3]="After your friend was sent to heal Prince Hingst,";
	        aftertext[4]="she disappeared and hasn't been heard from since.";
	        aftertext[5]="You must descend to Hurtland, and build your skill.";
	        aftertext[6]="Then, see Prince Hingst in the Royal Castle.";
	        aftertext[7]="Well, off you go! Take care, my precious Remedy!";
	        }
	    battle=0;
	    }
	else if (tag==40){
	    sprite_index=spr_npc;
	    name="Tage";
	    texts=1;
	    text[0]="My horns are greasy.";
	    aftertexts=1;
	    aftertext[0]="Well, back to sticking burgers on my horns.";
	    battle=13;
	    }
	else if (tag==41){
	    sprite_index=spr_npc;
	    name="Sadbloom";
	    texts=1;
	    text[0]="I don't get enough sunlight with this tree next to me.";
	    aftertexts=1;
	    aftertext[0]="Now I have the courage to tell it to move aside!";
	    battle=27;
	    }
	else if (tag==42){
	    sprite_index=spr_npc;
	    name="Snide";
	    texts=1;
	    text[0]="Ow! Ow! I've got something in my eye!";
	    aftertexts=1;
	    aftertext[0]="Oh, it was just my contact lens.";
	    battle=24;
	    }
	else if (tag==43){
	    sprite_index=spr_npc;
	    name="Chicory";
	    texts=1;
	    text[0]="I scare myself.";
	    aftertexts=1;
	    aftertext[0]="I have learnt to live with my immoral ways!";
	    battle=44;
	    }
	else if (tag==44){
	    sprite_index=spr_npc;
	    name="Mange";
	    texts=1;
	    text[0]="My halo hurts.";
	    aftertexts=3;
	    aftertext[0]="Thanks! You're from Saturn, right?";
	    aftertext[1]="May you aid the Prince as soon as possible.";
	    aftertext[2]="He's your age, by the way!";
	    battle=28;
	    }
	else if (tag==45){
	    sprite_index=spr_npc;
	    name="Sivert";
	    texts=2;
	    text[0]="Everyone in this town has such sharp tongues,";
	    text[1]="and now I'm suffering from sick burns!";
	    aftertexts=1;
	    aftertext[0]="Whew! I feel better about myself now.";
	    battle=14;
	    }
	else if (tag==46){
	    sprite_index=spr_npc;
	    name="Sture";
	    texts=1;
	    text[0]="I melted in the sun.";
	    aftertexts=1;
	    aftertext[0]="Yay! I'm solid again!";
	    battle=15;
	    }
	else if (tag==47){
	    sprite_index=spr_npc;
	    name="Sten";
	    texts=2;
	    text[0]="I played a game with hunks and spaceships.";
	    text[1]="It was so cool, my face melted.";
	    aftertexts=1;
	    aftertext[0]="I'll be more careful with video games now.";
	    battle=16;
	    }
	else if (tag==48){
	    sprite_index=spr_npc;
	    name="Wrapper";
	    texts=1;
	    text[0]="Help! My bandages are wet.";
	    aftertexts=1;
	    aftertext[0]="Thanks! Let's not speak of this again.";
	    battle=17;
	    }
	else if (tag==49){
	    sprite_index=spr_npc;
	    name="Rotten King";
	    texts=1;
	    text[0]="Err. I stepped on my own bandage...";
	    aftertexts=1;
	    aftertext[0]="Thanks! My bandages are tidy now.";
	    battle=18;
	    }
	else if (tag==50){
	    sprite_index=spr_npc;
	    name="Old Queen";
	    texts=1;
	    text[0]="Oh, dear. I'm stuck in this coffin.";
	    aftertexts=1;
	    aftertext[0]="Fresh air at last!";
	    battle=19;
	    }
	else if (tag==51){
	    sprite_index=spr_npc;
	    name="Paper boy";
	    texts=1;
	    text[0]="I... I was rolled up...";
	    aftertexts=1;
	    aftertext[0]="Thank you so much! I'll be careful next time.";
	    battle=20;
	    }
	else if (tag==52){
	    sprite_index=spr_npc;
	    name="Slick";
	    texts=1;
	    text[0]="So... BORED...";
	    aftertexts=1;
	    aftertext[0]="That's how you heal people? That was exciting!";
	    battle=45;
	    }
	else if (tag==53){
	    sprite_index=spr_npc;
	    name="Apathetic Frog";
	    texts=1;
	    text[0]="";
	    //NONE
	    aftertexts=1;
	    aftertext[0]="...";
	    battle=0;
	    }
	else if (tag==54){
	    sprite_index=spr_npc;
	    name="Hrist";
	    texts=1;
	    text[0]="I appear to have caught a cold.";
	    aftertexts=2;
	    aftertext[0]="I thank you, Saturnian healing princess!";
	    aftertext[1]="You're out healing the land, then? Very good.";
	    battle=32;
	    }
	else if (tag==55){
	    sprite_index=spr_npc;
	    name="Esi";
	    texts=1;
	    text[0]="I'm not sure if I'm sick or not.";
	    aftertexts=1;
	    aftertext[0]="Oh, I wasn't sick? Thanks!";
	    battle=33;
	    }
	else if (tag==56){
	    sprite_index=spr_npc;
	    name="Palle";
	    texts=1;
	    text[0]="The world is crazy. What do I do?";
	    aftertexts=1;
	    aftertext[0]="Ah, I see! It is I who am crazy. Great!";
	    battle=34;
	    }
	else if (tag==57){
	    sprite_index=spr_npc;
	    name="Eir";
	    texts=1;
	    text[0]="Nnnngh... so... much... snack food...";
	    aftertexts=3;
	    aftertext[0]="Thank you! So you've come to heal the Prince?";
	    aftertext[1]="He's in the Royal Castle in the Royal Valley."
	    aftertext[2]="Good luck out there!";
	    battle=35;
	    }
	else if (tag==58){
	    sprite_index=spr_npc;
	    name="Chomp";
	    texts=1;
	    text[0]="I make sense when I talk.";
	    aftertexts=1;
	    aftertext[0]="Wahey! Blast the servers, Sally!";
	    battle=46;
	    }
	else if (tag==59){
	    sprite_index=spr_npc;
	    name="Dark Servant";
	    texts=1;
	    text[0]="I am suffering from a lack of a body.";
	    aftertexts=1;
	    aftertext[0]="Hey, my body! I've missed you, pal!";
	    battle=37;
	    }
	else if (tag==60){
	    sprite_index=spr_npc;
	    name="Prince Hingst";
	    texts=7;
	    text[0]="Sigh... nobody can cure what ails me.";
	    text[1]="You see, I suffer from everything.";
	    text[2]="Fear, skull pain, slimy tears,";
	    text[3]="stubbed toe, runny nose, nightmares,";
	    text[4]="chronic hype, fear of birds, apathy,";
	    text[5]="and a voice in my head with a very large ego.";
	    text[6]="Healer... do you honestly believe you can cure me?";
	    aftertexts=10;
	    aftertext[0]="Oh, thank you so much!";
	    aftertext[1]="Your healing skills are truly exceptional!";
	    aftertext[2]="May I ask your name? Princess Remedy, is it?";
	    aftertext[3]="Princess Remedy! I hereby bestow upon you...";
	    aftertext[4]="the right to be the Queen of Hurtland!";
	    aftertext[5]="Of course, after what you have accomplished,";
	    aftertext[6]="we'll have to change the name to Healland.";
	    aftertext[7]="But indeed, you may marry anyone you want,";
	    aftertext[8]="and they'll rule the kingdom with you!";
	    aftertext[9]="Simply speak to someone who is healed.";
	    battle=50;
	    }
	else if (tag==61){
	    sprite_index=spr_npc;
	    name="Seal of quantity";
	    texts=1;
	    text[0]="I have all sorts of things wrong with me!";
	    aftertexts=1;
	    aftertext[0]="I'm perfect!";
	    battle=48;
	    }
	else if (tag==62){
	    sprite_index=spr_npc;
	    name="Moonbunny";
	    texts=1;
	    text[0]="I've dislocated my shoulder.";
	    aftertexts=3;
	    aftertext[0]="Oh, there it is.";
	    aftertext[1]="You're a Saturnian princess, aren't you?";
	    aftertext[2]="Me, I'm just a bunny.";
	    battle=29;
	    }
	else if (tag==63){
	    sprite_index=spr_npc;
	    name="Frallan";
	    texts=5;
	    text[0]="Remedy? It's me, Frallan.";
	    text[1]="I was dispatched by the Queen to heal the Prince,";
	    text[2]="but I couldn't get over you dumping me in school!";
	    text[3]="You can't heal a girl's broken heart, Remedy.";
	    text[4]="But, since it's you... you're welcome to try.";
	    aftertexts=6;
	    aftertext[0]="Huh? You brought my favorite boxed chocolate!";
	    aftertext[1]="So... it doesn't matter if we're just friends,";
	    aftertext[2]="or something more. I see that now.";
	    aftertext[3]="Thanks, Remmy. You're the best!";
	    aftertext[4]="But if you ever change your mind,";
	    aftertext[5]="I'll be here waiting...";
	    battle=49;
	    }




}
