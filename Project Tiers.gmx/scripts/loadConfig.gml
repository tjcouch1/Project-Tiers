///loadConfig(directory)
//loads config and sets variables appropriately. arg0 is directory

ini_open(argument0);

arrowTextColor = ini_read_real("color", "arrowTextColor", arrowTextColor);
mainTextColor = ini_read_real("color", "mainTextColor", mainTextColor);

ini_close();