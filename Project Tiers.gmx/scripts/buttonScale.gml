///buttonScale(button)
//sets button image_xscale and image_yscale based on text variable. arg0 is button id to set
with (argument0)
{
    if (noscale)
        break;
    var spr = showsprite;
    var scl = 1;
    if (drawframe)
    {
        //spr = spr_por_frame;
        scl = 2;
    }
    
    if (spr == -1)
    {
        if (showuni)
        {
            var chrtext = text;
            if (selection == 2.2)
                switch (chrtext)
                {
                    case 160: chrtext = "LShift"; break;
                    case 161: chrtext = "RShfit"; break;
                    case 162: chrtext = "LControl"; break;
                    case 163: chrtext = "RControl"; break;
                    case 164: chrtext = "LAlt"; break;
                    case 165: chrtext = "RAlt"; break;
                    
                    case 96: chrtext = "Num 0"; break;
                    case 97: chrtext = "Num 1"; break;
                    case 98: chrtext = "Num 2"; break;
                    case 99: chrtext = "Num 3"; break;
                    case 100: chrtext = "Num 4"; break;
                    case 101: chrtext = "Num 5"; break;
                    case 102: chrtext = "Num 6"; break;
                    case 103: chrtext = "Num 7"; break;
                    case 104: chrtext = "Num 8"; break;
                    case 105: chrtext = "Num 9"; break;
                    case 106: chrtext = "Num Multiply"; break;
                    case 107: chrtext = "Num Add"; break;
                    case 109: chrtext = "Num Subtract"; break;
                    case 110: chrtext = "Num Decimal"; break;
                    case 111: chrtext = "Num Divide"; break;
                    case 112: chrtext = "F1"; break;
                    case 113: chrtext = "F2"; break;
                    case 114: chrtext = "F3"; break;
                    case 115: chrtext = "F4"; break;
                    case 116: chrtext = "F5"; break;
                    case 117: chrtext = "F6"; break;
                    case 118: chrtext = "F7"; break;
                    case 119: chrtext = "F8"; break;
                    case 120: chrtext = "F9"; break;
                    case 121: chrtext = "F10"; break;
                    case 122: chrtext = "F11"; break;
                    case 123: chrtext = "F12"; break;
                    case 124: chrtext = "F13"; break;
                    case 125: chrtext = "F14"; break;
                    case 126: chrtext = "F15"; break;
                    case 8: chrtext = "Backspace"; break;
                    case 9: chrtext = "Tab"; break;
                    case 13: chrtext = "Enter"; break;
                    case 16: chrtext = "Shift"; break;
                    case 17: chrtext = "Control"; break;
                    case 20: chrtext = "Caps Lock"; break;
                    case 27: chrtext = "Esc"; break;
                    case 32: chrtext = "Spacebar"; break;
                    case 33: chrtext = "Page Up"; break;
                    case 34: chrtext = "Page Down"; break;
                    case 35: chrtext = "End"; break;
                    case 36: chrtext = "Home"; break;
                    case 37: chrtext = "Left"; break;
                    case 38: chrtext = "Up"; break;
                    case 39: chrtext = "Right"; break;
                    case 40: chrtext = "Down"; break;
                    case 45: chrtext = "Insert"; break;
                    case 46: chrtext = "Delete"; break;
                    case 144: chrtext = "Num Lock"; break;
                    case 145: chrtext = "ScrLk"; break;
                    case 19: chrtext = "Pause/Break"; break;
                    case 186: chrtext = ";"; break;
                    case 187: chrtext = "="; break;
                    case 189: chrtext = "-"; break;
                    case 191: chrtext = "/"; break;
                    case 192: chrtext = "`"; break;
                    case 219: chrtext = "["; break;
                    case 220: chrtext = "\"; break;
                    case 221: chrtext = "]"; break;
                    case 222: chrtext = "'"; break;
                    case 188: chrtext = ","; break;
                    case 190: chrtext = "."; break;
                    default: chrtext = chr(text); break;
                }
            if (string_lettersdigits(chrtext) == "")
                chrtext = text;
        }
        else var chrtext = text;
        
        image_xscale = string_width(string(chrtext)) / (sprite_get_width(sprite_index) - 2);
        image_yscale = string_height("r") / sprite_get_height(sprite_index);
    }
    else
    {
        image_xscale = sprite_get_width(spr) * 5 * scl / 4 / sprite_get_width(sprite_index);
        image_yscale = sprite_get_height(spr) * 5 * scl / 4 / sprite_get_height(sprite_index);
    }
    switch (type)
    {
        case 1: image_xscale += .25; image_yscale += .2; break;
        case 4: 
        case 8:
        case 5: break;
        default: image_xscale += .1; image_yscale += .1; break;
    }
    if (type == 7)
    {
        image_xscale = 16 / sprite_get_width(sprite_index);
        image_yscale = 16 / sprite_get_height(sprite_index);
    }
}
