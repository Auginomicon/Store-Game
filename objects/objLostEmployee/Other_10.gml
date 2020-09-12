/// @description Looking for notbook dialog
message[0] = "Did you find the notebook?"
message[1] = ["No", "Yes"];
message[2] = "Go find it before one of us goes missing!";
message[3] = "Sweet!";
message[4] = "Wait a sec. No you didn't! Go find it!";
message[6] = "Go read a few pages then get to work! I can't do everything";
message[7] = "";

nextLine = [1, [2, 3], -1, 4, -1, -1, -1, -1];
scripts = [-1, [-1, [ItemCheck, "Notebook", nextLine[1][1], 6]], -1, -1, -1, -1, [ClearDialog, 1, objLostEmployee, 1], -1];
speakers = [id, objPlayer, id, id, id, id, id, id, id, id];
portraitNums = [11, 0, 18, 14, 12, 16, 11, 0];