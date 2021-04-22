//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/	 	/*Update Interval*/	/*Update Signal*/

	{"  ", "/home/resetim/dwmblocks-distrotube/scripts/upt",		        60,		            2},

	{" 📦 ", "/home/resetim/dwmblocks-distrotube/scripts/pacupdate",		360,		        9},
	
	{" 💻 ", "/home/resetim/dwmblocks-distrotube/scripts/memory",	        6,		            1},

	{" 🔊 ", "/home/resetim/dwmblocks-distrotube/scripts/volume",			2,		            10},

	{" 🕑 ", "/home/resetim/dwmblocks-distrotube/scripts/clock",			5,		            0},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim = '|';
