///findProjects()
//finds all the projects available

//clear all previous directories
ds_list_clear(projectList);

//delete previous buttons
for (var i = 0; i < ds_list_size(projectButtonList); i++)
    if (instance_exists(ds_list_find_value(projectButtonList, i)))
        with (ds_list_find_value(projectButtonList, i))
            instance_destroy();
ds_list_clear(projectButtonList);

//find directories
var directory = working_directory + "projects\";
if (directory_exists(directory))
{
    //find all folders and assign them to the projectList
    var currFile = file_find_first(directory + "*", fa_directory);
    while (currFile != "")
    {
        if (directory_exists(directory + currFile))
            ds_list_add(projectList, directory + currFile + "\");
        currFile = file_find_next();
    }
    file_find_close();
}

//create a button for each project
var button;
for (var i = 0; i < ds_list_size(projectList); i++)
{
    button = instance_create(view_wview[0] / 2, (sprite_get_width(spr_button) / 2 + 2) * (i + 1), obj_button);
    button.text = string_copy(ds_list_find_value(projectList, i), string_length(directory) + 1, string_length(ds_list_find_value(projectList, i)) - string_length(directory) - string_length("\"));
    button.selection = 0;
    buttonScale(button);
    ds_list_add(projectButtonList, button);
}
