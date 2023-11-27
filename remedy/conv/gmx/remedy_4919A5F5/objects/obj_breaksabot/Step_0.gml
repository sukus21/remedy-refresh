scr_joy();
scr_input();

if ((pressescape && !pressescapeprev) || (pressinteract && !pressinteractprev)){
    global.destination=2;
    global.overridedir=1;
    global.overridedirout=3;
    room_goto(rom_nowhere);
    }
