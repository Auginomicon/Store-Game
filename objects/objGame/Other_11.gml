/// @description First event
eventTrigger1 = true;
var inst = instance_create_layer(1295, 2910, "Instances", objGownGal);
inst.currentLocation = 5;
inst.freeRoam = false;
inst.sprite_index = sprGownGalIdle1;
inst.image_index = 5;
inst.firstEvent = true;

// Spawn the notebook
var notebook = instance_create_layer(1504, 2976, "Instances", objItem);
notebook.name = "Notebook";
notebook.sprite_index = sprNotebook;
notebook.currentLocation = 4;
notebook.sound = sndNotebookPickup;