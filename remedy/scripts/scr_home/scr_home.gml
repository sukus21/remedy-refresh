function scr_home(argument0, argument1) {
	//Argument0 is intensity
	//Argument1 is type
	// 0=do not use
	// 1=partial
	// 2=full
	var curdir;
	curdir=direction;
	direction=point_direction(x,y,obj_battleyou.x,obj_battleyou.y);

	if ((direction-curdir)<-180)
	    curdir-=360;
	else if ((direction-curdir)>180)
	    curdir+=360;

	if (argument1==2 || (argument1==1 && abs(curdir-direction)<60)){
	    if ((direction-curdir)>argument0)
	        direction=curdir+argument0;
	    else if ((direction-curdir)<-argument0)
	        direction=curdir-argument0;
	    }
	else
	    direction=curdir;



}
