function scr_findlength(argument0) {
	//Returns the pixel width of a string of text without linebreaks
	pffltext=argument0; //text
	pffllen=string_length(pffltext); //string length
	pfflx=0;

	for (pfi=0;pfi<pffllen;pfi+=1){
	    pfchar=ord(string_char_at(pffltext,pfi+1))-32;
	    pfflx+=global.pf[pfchar];
	    }

	return (floor(pfflx));



}
