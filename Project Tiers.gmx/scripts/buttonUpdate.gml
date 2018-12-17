///buttonUpdate()
//updates the buttons, checking for input

//selection -1--All but selection 0

if (!unsaved)
    bBack.sprite_index = spr_backButton;
else bBack.sprite_index = spr_exitButton;

if (bBack.clicked || bExit.clicked || (keyboard_check_pressed(vk_escape) && (room == room_menu || selection != 0)))
{
    var selectionprev = selection;
    switch (selection)
    {
        case 0: 
            if (room == room_menu)
                game_end();
            else selection = -2;
            break;
        case 1: closeProject(); findProjects(); selection = 0; questionID = -1; questionDir = ""; dupeList = false; deleteList = false; questionObjInd = -1; break;
        //case 1.1: saveConfig(projectDirectory + "config.cfg"); selection = 1; break;
        case 2: closeList(); selection = 1; findLists(); break;
        case 3: 
            if (unsaved)
            {
                if (questionID < 0)
                {
                    questionID = unsavedID;
                    show_question_async("Are you sure you want to stop editing without saving?");
                }
            }
            else
            {
                questionID = -1;
                questionObjInd = -1;
                closeList();
                loadList();
                selection = 2;
            }
            break;
        case -10: break;
        default: selection = 0; break;
    }
    if (selectionprev > 1.1 && selectionprev < 1.2)
        selection = 1.1;
}

//selection 0--Select Project Menu
var button;
for (var i = 0; i < ds_list_size(projectButtonList); i++)
{
    button = ds_list_find_value(projectButtonList, i);
    if (button.clicked)
    {
        closeProject();
        projectDirectory = ds_list_find_value(projectList, i);
        loadProject();
        selection = 1;
    }
}

//selection 1--Select List Menu

if (dupeList || deleteList)
    bCancel.selection = 1;
else bCancel.selection = -13535;

if (bCreateList.clicked && questionID < 0 && !deleteList && !dupeList)
{
    questionID = newListID;
    get_string_async("Enter the name of the list to create.#WARNING: This list will save in %appdata%\Project_Tiers\projects", "New List");
}

if (bDupeList.clicked && questionID < 0 && !deleteList)
    dupeList = true;

if (bDeleteList.clicked && questionID < 0 && !dupeList)
    deleteList = true;

var button;
for (var i = 0; i < ds_list_size(listButtonList); i++)
{
    button = ds_list_find_value(listButtonList, i);
    if (button.clicked)
    {
        if (dupeList && questionID < 0)
        {
            questionID = dupeListID;
            get_string_async("Enter the new name for your duplicated list.#WARNING: This list will save in %appdata%\Project_Tiers\projects", button.text + " - Copy");
            questionDir = ds_list_find_value(listList, i);
        }
        else if (deleteList && questionID < 0)
        {
            questionID = deleteListID;
            show_question_async("Are you sure you want to delete " + button.text + "?");
            questionDir = ds_list_find_value(listList, i);
        }
        if (!deleteList && !dupeList)
        {
            closeList();
            listDirectory = ds_list_find_value(listList, i);
            loadList();
            selection = 2;
            
            questionID = -1;
            questionDir = "";
            dupeList = false;
            deleteList = false;
            questionObjInd = -1;
        }
    }
}

if (bCancel.clicked)
{
    questionID = -1;
    questionDir = "";
    dupeList = false;
    deleteList = false;
    questionObjInd = -1;
}

//selection 2--List View Menu
if (bEdit.clicked)
    selection = 3;

//selection 3--List Edit Menu
if (bSave.clicked)
    saveList();
    
if (bCreateTierSet.clicked && questionID < 0)
{
    questionID = newTierSetID;
    get_string_async("Enter a name for the new Tier Set.", "New Tier Set");
    unsaved = true;
}
