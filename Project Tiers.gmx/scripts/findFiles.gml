///findFiles(list, directory, filename)
//finds files, not directories, of the given mask, then assigns their directory to the given list. arg0 is list, arg1 is directory, arg2 is file type

//sets arguments to readable variable names
list = argument0;
directory = argument1;
mask = directory + argument2;

//find all files and assign them to the list
var currFile = file_find_first(mask, 0);
while (currFile != "")
{
    ds_list_add(list, directory + currFile);
    currFile = file_find_next();
}
file_find_close();