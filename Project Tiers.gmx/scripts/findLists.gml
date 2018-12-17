///findLists()
//finds all lists in projectDirectory

//delete previous list directories
ds_list_clear(listList);

//delete previous buttons
for (var i = 0; i < ds_list_size(listButtonList); i++)
    if (instance_exists(ds_list_find_value(listButtonList, i)))
        with (ds_list_find_value(listButtonList, i))
            instance_destroy();
ds_list_clear(listButtonList);
    
//makes a list of the files in lists directory
listsDirectory = projectDirectory + "lists\";

if (directory_exists(listsDirectory))
    findFiles(listList, listsDirectory, "*.list");

//makes list buttons
var button;
for (var i = 0; i < ds_list_size(listList); i++)
{
    button = instance_create(view_wview[0] / 2, (sprite_get_height(spr_button) * 3 / 2) * (i + 1), obj_button);
    button.text = string_copy(ds_list_find_value(listList, i), string_length(listsDirectory) + 1, string_length(ds_list_find_value(listList, i)) - string_length(listsDirectory) - string_length(".list"));
    button.selection = 1;
    buttonScale(button);
    ds_list_add(listButtonList, button);
}
