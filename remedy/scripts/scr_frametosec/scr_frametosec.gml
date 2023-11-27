function scr_frametosec(argument0) {
	//converts frames to time string
	//argument0 is frames
	//returns string H:MM:SS
	myframes=argument0;

	answer="";
	secs=floor(myframes/30);
	mins=0;
	hours=0;

	while (secs>=3600){
	    secs-=3600;
	    hours+=1;
	    }
	while (secs>=60){
	    secs-=60;
	    mins+=1;
	    }
	answer=string(hours)+":";
	if (mins<10)
	    answer+="0";
	answer+=string(mins)+":";
	if (secs<10)
	    answer+="0";
	answer+=string(secs);

	return (answer);



}
