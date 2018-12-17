///loadList()
//loads the tier sets from a tier list

var file, line, tierSet, button;
var tierSetPrev = -1;
var drawX = view_xview[0] + view_wview[0] / 2;// + sprite_get_width(projectUnknownSprite) * 5;

viewXList = view_xview[0];
viewYList = view_yview[0];

tierSetXOrigin = drawX;
tierSetYOrigin = view_yview[0] + 20;
tierSetWidth = sprite_get_width(projectUnknownSprite) * 10;

if (file_exists(listDirectory))
{
    file = file_text_open_read(listDirectory);
    
    //reads file until end of file
    while (!file_text_eof(file))
    {
        line = file_text_read_string(file);
        file_text_readln(file);
        if (string_char_at(line, 1) == "\")
        {
            if (string_copy(line, 1, 5) == "\List")
            {
                tierSet = instance_create(drawX, view_yview[0] + 20, obj_tierSet);
                tierSet.xDest = tierSet.x;
                tierSet.yDest = tierSet.y;
                tierSet.name = string_copy(line, 7, string_length(line) - 6);
                ds_list_add(tierSetList, tierSet);
            }
            else if (string_copy(line, 1, 5) == "\Date")
                tierSet.date = string_copy(line, 7, string_length(line) - 6);
            else if (string_copy(line, 1, 5) == "\Tier")
                ds_list_add(tierSet.tierSetList, line);
        }
        else if (line != "")
            ds_list_add(tierSet.tierSetList, line);
        if (line == "" || file_text_eof(file))
        {
            //instantiate tier set
            with (tierSet)
            {
                //set up list of characters, ranks, and tier buttons
                var setLine, cutLine;
                var currentRank = 1;
                for (var i = 0; i < ds_list_size(tierSetList); i++)
                {
                    setLine = ds_list_find_value(tierSetList, i);
                    if (string_char_at(setLine, 1) != "\")
                    {
                        cutLine = "";
                        for (var j = 1; j <= string_length(setLine) + 1; j++)
                        {
                            if (j <= string_length(setLine))
                            {
                                if (string_char_at(setLine, j) != ",")
                                    cutLine += string_char_at(setLine, j);
                                else
                                {
                                    ds_list_add(characterList, cutLine);
                                    ds_list_add(rankList, currentRank);
                                    cutLine = "";
                                    j += 1;
                                }
                            }
                            else
                            {
                                ds_list_add(characterList, cutLine);
                                ds_list_add(rankList, currentRank);
                                cutLine = "";
                                j += 1;
                                currentRank += string_count(",", setLine) + 1;
                            }
                        }
                    }
                    else if (string_pos("\Tier", setLine) == 1)//tier buttons
                    {
                        button = instance_create(x, y, obj_button);
                        button.message = "Up";
                        button.sprite_index = spr_arrowButton;
                        button.selection = 3;
                        button.dontchangexy = true;
                        button.noscale = true;
                        button.drawDraw = true;
                        button.image_xscale = 3 / 4;
                        button.image_yscale = 3 / 4;
                        button.image_angle = 90;
                        button.xoff = - button.sprite_width * 7 / 2;
                        button.yoff = 0;
                        ds_list_add(tierUpList, button);
                        
                        button = instance_create(x, y, obj_button);
                        button.message = "Down";
                        button.sprite_index = spr_arrowButton;
                        button.selection = 3;
                        button.dontchangexy = true;
                        button.noscale = true;
                        button.drawDraw = true;
                        button.image_xscale = 3 / 4;
                        button.image_yscale = 3 / 4;
                        button.image_angle = 270;
                        button.xoff = - button.sprite_width * 7 / 2;
                        button.yoff = 0;
                        ds_list_add(tierDownList, button);
                        
                        button = instance_create(x, y, obj_button);
                        button.message = "Delete";
                        button.sprite_index = spr_deleteButton;
                        button.selection = 3;
                        button.dontchangexy = true;
                        button.noscale = true;
                        button.drawDraw = true;
                        button.image_xscale = 3 / 4;
                        button.image_yscale = 3 / 4;
                        button.xoff = button.sprite_width * 7 / 2;
                        button.yoff = 0;
                        ds_list_add(tierDeleteList, button);
                        
                        button = instance_create(x, y, obj_button);
                        button.message = "Rename";
                        button.sprite_index = spr_renameButton;
                        button.selection = 3;
                        button.dontchangexy = true;
                        button.noscale = true;
                        button.drawDraw = true;
                        button.image_xscale = 3 / 4;
                        button.image_yscale = 3 / 4;
                        button.xoff = button.sprite_width * 7 / 2;
                        button.yoff = 0;
                        ds_list_add(tierRenameList, button);
                    }
                }
                
                //make list of portraits
                var char, newPortrait;
                for (var i = 0; i < ds_list_size(characterList); i++)
                {
                    char = ds_list_find_value(characterList, i);
                    newPortrait = instance_create(x, y, obj_portrait);
                    newPortrait.owner = tierSet;
                    newPortrait.sprite_index = other.projectUnknownSprite;
                    newPortrait.character = char;
                    newPortrait.rank = ds_list_find_value(rankList, i);
                    ds_list_add(portraitList, newPortrait);
                    
                    //assign rankChange
                    if (tierSetPrev != -1)
                    {
                        for (var j = 0; j < ds_list_size(tierSetPrev.characterList); j++)
                            if (char == ds_list_find_value(tierSetPrev.characterList, j))
                            {
                                newPortrait.rankChange = ds_list_find_value(tierSetPrev.rankList, j) - ds_list_find_value(rankList, i);
                                break;
                            }
                            else newPortrait.rankChange = -3.14159;
                    }
                    else newPortrait.rankChange = -3.14159;
                    
                    //find portrait sprite
                    for (var j = 0; j < ds_list_size(other.portraitNameList); j++)
                        if (ds_list_find_value(other.portraitNameList, j) == char)
                            newPortrait.sprite_index = ds_list_find_value(other.portraitSpriteList, j);
                    
                    //assign portrait to its location
                    var setLine, cutLine, place, charNum;
                    for (var j = 0; j < ds_list_size(tierSetList); j++)
                    {
                        setLine = ds_list_find_value(tierSetList, j);
                        if (string_char_at(setLine, 1) != "\")
                            if (string_pos(char, setLine) > 0)
                            {
                                cutLine = string_copy(setLine, 1, string_pos(char, setLine) - 1);
                                place = string_count(",", cutLine) + 1 / 2;
                                charNum = string_count(",", setLine) + 1;
                                newPortrait.xOwnerOffset = (place - (charNum / 2)) * sprite_get_width(newPortrait.sprite_index) * 2;
                                newPortrait.yOwnerOffset = (j + 1.5) * (sprite_get_height(newPortrait.sprite_index) + 2);
                                break;
                            }
                    }
                }
            }
            drawX += tierSetWidth;
            tierSetPrev = tierSet;
        }
    }
    
    file_text_close(file);
    
    recalculateTierSets(-1);
    unsaved = false;
}
