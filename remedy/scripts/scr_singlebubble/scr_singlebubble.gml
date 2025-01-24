function scr_singlebubble(argument0, argument1, argument2, argument3) {
	//throws up a single created text bubble
	//argument0 is text
	//argument1 is name
	//argument2 1 = use name
	//argument3 1 = longer delay for pressing away bubble
	ignoreall=1;
	bubble=instance_create_depth(scr_xview(),scr_yview(),-100,obj_textbubble);
	bubble.talktonpc=0;
	bubble.texts=1;
	bubble.text[0]=argument0;
	finaltext=scr_linebreak(argument0,148);
	bubble.finaltext=finaltext;
	bubble.name=argument1;
	bubble.extraname=argument2;
	if (argument3==1)
	    bubble.longdelay=1;



}
