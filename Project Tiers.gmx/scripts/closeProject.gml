///closeProject
//closes a project, releasing memory

//delete background
if (sprite_exists(projectBackground))
    sprite_delete(projectBackground);
projectBackground = -1;
if (instance_exists(projectBackgroundObject) && projectBackgroundObject.object_index == obj_background)
    with (projectBackgroundObject)
        instance_destroy();
    
//delete unknownSprite
if (projectUnknownSprite != spr_unknownSprite)
    if (sprite_exists(projectUnknownSprite))
        sprite_delete(projectUnknownSprite);
projectUnknownSprite = spr_unknownSprite;
    
//delete arrowSprite
if (projectArrowSprite != spr_arrowSprite)
    if (sprite_exists(projectArrowSprite))
        sprite_delete(projectArrowSprite);
projectArrowSprite = spr_arrowSprite;

//save config
if (file_exists(projectDirectory + "config.cnf"))
    saveConfig(projectDirectory + "config.cnf");

//delete music
if (audio_exists(projectAudio))
{
    if (audio_is_playing(projectAudio))
        audio_stop_sound(projectAudio);
    audio_free_buffer_sound(projectAudio);
    buffer_delete(projectAudioBuffer);
}

//delete all the portrait sprites
var currentSprite;
for (var i = 0; i < ds_list_size(portraitSpriteList); i++)
{
    currentSprite = ds_list_find_value(portraitSpriteList, i);
    if (sprite_exists(currentSprite))
        sprite_delete(currentSprite);
}

//deletes list directories and buttons
ds_list_clear(listList);

//delete previous buttons
for (var i = 0; i < ds_list_size(listButtonList); i++)
    if (instance_exists(ds_list_find_value(listButtonList, i)))
        with (ds_list_find_value(listButtonList, i))
            instance_destroy();
ds_list_clear(listButtonList);

//reset project vars to defaults
projectDirectory = "";
listsDirectory = "";
portraitsDirectory = "";
ds_list_clear(portraitNameList);
ds_list_clear(portraitSpriteList);
