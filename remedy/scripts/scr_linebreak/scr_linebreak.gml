function scr_linebreak(argument0, argument1) {
	//Linebreak a string of proportional text and returns new text
	//pfx (pixel width of text) will also be retained

	pftext=argument0; //text
	pfhor=argument1; //horizontal maximum

	textrows=0; //rows of actual text
	pfx=0; //cursor x
	pfchar=0; //current character 0-94
	pfnewtext=pftext; //modified text
	pflen=string_length(pfnewtext); //string length

	//insert #s
	if (pflen>0){
	    for (pfi=0;pfi<pflen;pfi+=1){
	        pfchar=ord(string_char_at(pfnewtext,pfi+1))-32;
	        pfx+=global.pf[pfchar];
	        if (pfchar==3){
	            textrows+=1;
	            pfx=0;
	            }
	        if (pfx>=pfhor){
	            textrows+=1;
	            pfx=0;
	            while (pfi>0 && pfchar!=0 && !sdone){
	                pfi-=1;
	                pfchar=ord(string_char_at(pfnewtext,pfi+1))-32;
	                if (pfi==0)
	                    return "X";
	                }
	            if (pfchar==0){
	                pfnewtext=string_insert("#",pfnewtext,pfi+1);
	                pfnewtext=string_delete(pfnewtext,pfi+2,1);
	                }
	            }
	        }
	    }

	return (pfnewtext);



}
