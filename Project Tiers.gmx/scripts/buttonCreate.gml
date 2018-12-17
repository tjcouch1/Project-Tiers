///buttonCreate()
//creates all the buttons at the start

bBack = instance_create(0, 0, obj_button);
bBack.sprite_index = spr_backButton;
bBack.selection = -1;
bBack.dontchangexy = true;
bBack.noscale = true;
bBack.x += bBack.sprite_width / 2;
bBack.y += bBack.sprite_height / 2;

//selection 0--choose project menu

bExit = instance_create(0, 0, obj_button);
bExit.sprite_index = spr_exitButton;
bExit.selection = 0;
bExit.dontchangexy = true;
bExit.noscale = true;
bExit.x += bExit.sprite_width / 2;
bExit.y += bExit.sprite_height / 2;

//selection 1--choose list menu

bCreateList = instance_create(0, sprite_get_height(spr_button) / 2 + bBack.sprite_height, obj_button);
bCreateList.text = "Create";
bCreateList.selection = 1;
bCreateList.dontchangexy = true;
buttonScale(bCreateList);
bCreateList.x += bCreateList.sprite_width / 2;

bDupeList = instance_create(0, sprite_get_height(spr_button) * 3 / 2 + bBack.sprite_height, obj_button);
bDupeList.text = "Duplicate";
bDupeList.selection = 1;
bDupeList.dontchangexy = true;
buttonScale(bDupeList);
bDupeList.x += bDupeList.sprite_width / 2;

bDeleteList = instance_create(0, sprite_get_height(spr_button) * 5 / 2 + bBack.sprite_height, obj_button);
bDeleteList.text = "Delete";
bDeleteList.selection = 1;
bDeleteList.dontchangexy = true;
buttonScale(bDeleteList);
bDeleteList.x += bDeleteList.sprite_width / 2;

bCancel = instance_create(0, sprite_get_height(spr_button) * 7 / 2 + bBack.sprite_height, obj_button);
bCancel.text = "Cancel";
bCancel.selection = -235352;
bCancel.dontchangexy = true;
buttonScale(bCancel);
bCancel.x += bCancel.sprite_width / 2;

//selection 2--edit list menu

bEdit = instance_create(bBack.sprite_width, 0, obj_button);
bEdit.sprite_index = spr_editButton;
bEdit.selection = 2;
bEdit.dontchangexy = true;
bEdit.noscale = true;
bEdit.x += bBack.sprite_width / 2;
bEdit.y += bBack.sprite_height / 2;

//selection 3--view list menu

bSave = instance_create(bBack.sprite_width, 0, obj_button);
bSave.sprite_index = spr_saveButton;
bSave.selection = 3;
bSave.dontchangexy = true;
bSave.noscale = true;
bSave.x += bBack.sprite_width / 2;
bSave.y += bBack.sprite_height / 2;

bCreateTierSet = instance_create(bBack.sprite_width * 2, 0, obj_button);
bCreateTierSet.sprite_index = spr_addButton;
bCreateTierSet.selection = 3;
bCreateTierSet.dontchangexy = true;
bCreateTierSet.noscale = true;
bCreateTierSet.x += bCreateTierSet.sprite_width / 2;
bCreateTierSet.y += bCreateTierSet.sprite_height / 2;

/*bConfig = instance_create(0, bBack.sprite_height, obj_button);
bConfig.text = "Config";
bConfig.selection = 1;
bConfig.dontchangexy = true;
buttonScale(bConfig);
bConfig.x += bConfig.sprite_width / 2;
bConfig.y += bConfig.sprite_height;

bArrowTextColor = instance_create(view_wview[0] / 2, sprite_get_height(spr_button) * 3 / 2, obj_button);
bArrowTextColor.selection = 1.1;
bArrowTextColor.type = 1;
bArrowTextColor.message = "Arrow Text Color";
bArrowTextColor.text = arrowTextColor;
buttonScale(bArrowTextColor);

bMainTextColor = instance_create(view_wview[0] / 2, sprite_get_height(spr_button) * 5 / 2, obj_button);
bMainTextColor.selection = 1.1;
bMainTextColor.type = 1;
bMainTextColor.message = "Main Text Color";
bMainTextColor.text = arrowTextColor;
buttonScale(bMainTextColor);
