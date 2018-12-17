///recalculateTierSets(index)
//redoes all the tier set locations and portrait positions. this should be run in obj_menu. arg0 is index of set to recalculate (-1 for all)

var index = argument0;
var low, cap;
if (index < 0)
{
    low = 0;
    cap = ds_list_size(tierSetList);
}
else
{
    low = index;
    cap = index + 1;
}

var currTierSet, currPortrait, prevTierSet, char;
for (var i = low; i < cap; i++)
{
    currTierSet = ds_list_find_value(tierSetList, i);
    currTierSet.xDest = tierSetXOrigin + i * tierSetWidth;
    //viewYDest = viewYList - sprite_get_height(spr_exitButton) * 2;
    //moveCamera = false;
    
    //redo rank change
    for (var k = 0; k < ds_list_size(currTierSet.portraitList); k++)
    {
        currPortrait = ds_list_find_value(currTierSet.portraitList, k);
        currPortrait.rank = ds_list_find_value(currTierSet.rankList, k);
        char = ds_list_find_value(currTierSet.characterList, k);
        if (i > 0)
        {
            prevTierSet = ds_list_find_value(tierSetList, i - 1);
            for (var j = 0; j < ds_list_size(prevTierSet.characterList); j++)
                if (char == ds_list_find_value(prevTierSet.characterList, j))
                {
                    currPortrait.rankChange = ds_list_find_value(prevTierSet.rankList, j) - ds_list_find_value(currTierSet.rankList, k);
                    break;
                }
                else currPortrait.rankChange = -3.14159;
        }
        else currPortrait.rankChange = -3.14159;
                    
        //assign portrait to its location
        var setLine, cutLine, place, charNum;
        for (var j = 0; j < ds_list_size(currTierSet.tierSetList); j++)
        {
            setLine = ds_list_find_value(currTierSet.tierSetList, j);
            if (string_char_at(setLine, 1) != "\")
                if (string_pos(char, setLine) > 0)
                {
                    cutLine = string_copy(setLine, 1, string_pos(char, setLine) - 1);
                    place = string_count(",", cutLine) + 1 / 2;
                    charNum = string_count(",", setLine) + 1;
                    currPortrait.xOwnerOffset = (place - (charNum / 2)) * sprite_get_width(currPortrait.sprite_index) * 2;
                    currPortrait.yOwnerOffset = (j + 1.5) * (sprite_get_height(currPortrait.sprite_index) + 2);
                    break;
                }
        }
    }
    
    //reposition tier buttons
    var button;
    var count = 0;
    for (var j = 0; j < ds_list_size(currTierSet.tierSetList); j++)
    {
        if (string_pos("\Tier", ds_list_find_value(currTierSet.tierSetList, j)) == 1)
        {
            button = ds_list_find_value(currTierSet.tierUpList, count);
            button.yoff = (j + 1.5) * (sprite_get_height(projectUnknownSprite) + 2) - button.sprite_height / 2;
            
            button = ds_list_find_value(currTierSet.tierDownList, count);
            button.yoff = (j + 1.5) * (sprite_get_height(projectUnknownSprite) + 2) + button.sprite_height / 2;
            
            button = ds_list_find_value(currTierSet.tierDeleteList, count);
            button.yoff = (j + 1.5) * (sprite_get_height(projectUnknownSprite) + 2) - button.sprite_height / 2;
            
            button = ds_list_find_value(currTierSet.tierRenameList, count);
            button.yoff = (j + 1.5) * (sprite_get_height(projectUnknownSprite) + 2) + button.sprite_height / 2;
            
            count++;
        }
    }
}
unsaved = true;