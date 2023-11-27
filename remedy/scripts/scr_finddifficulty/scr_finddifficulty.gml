function scr_finddifficulty(argument0) {
	//find number of hearts in a savefile
	//argument0 is filename
	//returns difficulty

	tempfilename=argument0;
	finddifficulty=0;

	if (file_exists(tempfilename)){
	    fileid=file_text_open_read(tempfilename);
    
	    repeat(19)
	        file_text_readln(fileid);
	    finddifficulty=real(file_text_read_string(fileid));
	    file_text_close(fileid);
	    }
	return (finddifficulty);



}
