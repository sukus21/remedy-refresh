function scr_drawtext(argument0, argument1, argument2, argument3, argument4) {
	//Draw proportional font
	pfx=floor(argument0); //x origin
	pfy=floor(argument1); //y origin
	pftext=argument2; //text
	pfsize=argument3; //vertical spacing
	pffont=argument4; //font sprite

	pflen=string_length(pftext); //string length
	pfx2=pfx; //cursor x
	pfy2=pfy; //cursor y
	pfchar=0; //current character 0-94

	//draw
	if (pflen>0){
	    for (pfi=0;pfi<pflen;pfi+=1){
	        pfchar=ord(string_char_at(pftext,pfi+1))-32;
	        if (pfchar==3){
	            pfx2=pfx;
	            pfy2+=argument3;
	            }
	        else{
	            draw_sprite(pffont,pfchar,pfx2,pfy2)
	            pfx2+=argument3;
	            }
	        }
	    }



}
