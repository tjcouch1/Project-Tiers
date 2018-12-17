///closeList()
//closes the list of tier sets

var tierSet, portrait;
for (var i = 0; i < ds_list_size(tierSetList); i++)
{
    tierSet = ds_list_find_value(tierSetList, i);
    if (instance_exists(tierSet) && tierSet.object_index == obj_tierSet)
    {
        for (var j = 0; j < ds_list_size(tierSet.portraitList); j++)
        {
            portrait = ds_list_find_value(tierSet.portraitList, j);
            if (instance_exists(portrait) && portrait.object_index == obj_portrait)
                with (portrait)
                    instance_destroy();
        }
        with (tierSet)
            instance_destroy();
    }
}
ds_list_clear(tierSetList);