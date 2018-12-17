///saveConfig(directory)
//saves the config variables. arg0 is directory

ini_open(argument0);

ini_write_real("color", "arrowTextColor", arrowTextColor);
ini_write_real("color", "mainTextColor", mainTextColor);

ini_close();
