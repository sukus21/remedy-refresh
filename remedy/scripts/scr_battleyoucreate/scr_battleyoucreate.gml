function scr_battleyoucreate() {
	scr_joycreate();
	x-=8;
	y-=8;
	walkdir=0;
	img=0;
	ignoreall=1;
	hp=global.hearts;
	flasks=global.flasks;
	maxspd=2;
	accel=1;
	brake=0.4;
	attackcyc=0;
	attackcycmax=8;
	mybox=instance_create_depth(x,y,0,obj_youbox);
	regencycmax=75-6*global.regen;



}
