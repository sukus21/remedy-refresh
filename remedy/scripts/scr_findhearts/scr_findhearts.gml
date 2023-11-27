function scr_findhearts(argument0) {
	//find number of hearts in a savefile
	//argument0 is filename
	//returns number of hearts

	tempfilename=argument0;
	findhearts=0;

	if (file_exists(tempfilename)){
	    fileid=file_text_open_read(tempfilename);
    
	    repeat(11)
	        file_text_readln(fileid);
	    findhearts=real(file_text_read_string(fileid));
	    file_text_close(fileid);
	    }
	return (findhearts);



}
