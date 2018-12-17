///saveList()
//saves list in list directory

var file, tierSet;

file = file_text_open_write(listDirectory);

for (var i = 0; i < ds_list_size(tierSetList); i++)
{
    tierSet = ds_list_find_value(tierSetList, i);
    
    file_text_write_string(file, "\List " + tierSet.name);
    file_text_writeln(file);
    
    file_text_write_string(file, "\Date " + tierSet.date);
    file_text_writeln(file);
    
    
    for (var j = 0; j < ds_list_size(tierSet.tierSetList); j++)
    {
        file_text_write_string(file, ds_list_find_value(tierSet.tierSetList, j));
        file_text_writeln(file);
    }
    
    file_text_writeln(file);
}

file_text_close(file);

show_debug_message("Saved " + listDirectory);
unsaved = false;
