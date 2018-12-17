///loadProject()
//opens a project based on the current value of projectDirectory

//gets the project background
if (file_exists(projectDirectory + "background.png"))
{
    projectBackground = sprite_add(projectDirectory + "background.png", 1, false, false, 0, 0);
    projectBackgroundObject = instance_create(0, 0, obj_background);
    projectBackgroundObject.sprite_index = projectBackground;
    refreshWindow = true;
}

//gets the project unknownSprite
if (file_exists(projectDirectory + "unknownSprite.png"))
{
    projectUnknownSprite = sprite_add(projectDirectory + "unknownSprite.png", 1, false, false, 0, 0);
    sprite_set_offset(projectUnknownSprite, floor(sprite_get_width(projectUnknownSprite) / 2), floor(sprite_get_height(projectUnknownSprite) / 2));
}

//gets the project arrowSprite
if (file_exists(projectDirectory + "arrowSprite.png"))
{
    projectArrowSprite = sprite_add(projectDirectory + "arrowSprite.png", 1, false, false, 0, 0);
    sprite_set_offset(projectArrowSprite, floor(sprite_get_width(projectArrowSprite) / 2), floor(sprite_get_height(projectArrowSprite) / 2));
}

//loads project config
if (file_exists(projectDirectory + "config.cnf"))
    loadConfig(projectDirectory + "config.cnf");

//gets the project music
if (file_exists(projectDirectory + "music.wav"))
{
    projectAudioBuffer = buffer_load(projectDirectory + "music.wav");
    projectAudio = audio_create_buffer_sound(projectAudioBuffer, buffer_s16, 44100, 0, buffer_get_size(projectAudioBuffer), audio_stereo);
    audio_play_sound(projectAudio, 0, true);
}
    
//makes a button for each list
findLists();
    
//makes lists of the sprites in the portraits directory
var portraitDirectoryList = ds_list_create();

portraitsDirectory = projectDirectory + "portraits\";

if (directory_exists(portraitsDirectory))
    findFiles(portraitDirectoryList, portraitsDirectory, "*.png");
    
var newSprite;
var spriteDirectory;
for (var i = 0; i < ds_list_size(portraitDirectoryList); i++)
{
    spriteDirectory = ds_list_find_value(portraitDirectoryList, i);
    newSprite = sprite_add(spriteDirectory, 1, false, false, 0, 0);
    sprite_set_offset(newSprite, floor(sprite_get_width(newSprite) / 2), floor(sprite_get_height(newSprite) / 2));
    //show_debug_message(string_copy(spriteDirectory, string_length(portraitsDirectory) + 1, string_length(spriteDirectory) - string_length(portraitsDirectory) - string_length("*.png") + 1));
    ds_list_add(portraitNameList, "@" + string_copy(spriteDirectory, string_length(portraitsDirectory) + 1, string_length(spriteDirectory) - string_length(portraitsDirectory) - string_length(".png")) + "@");
    ds_list_add(portraitSpriteList, newSprite);
    //ds_map_add(portraitMap, string_copy(spriteDirectory, string_length(portraitsDirectory) + 1, string_length(spriteDirectory) - string_length(portraitsDirectory) - string_length("*.png") + 1), newSprite);
}

ds_list_destroy(portraitDirectoryList);
