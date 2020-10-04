/// @description
randomize();
audio_play_sound(sndMainMenuMusic, 1, true);
showControls = false;
showCredits = false;
surface_resize(application_surface, 1500, 840);

character = choose(sprManager, sprLittleGirl, sprLostEmployeeNormieIdle, sprGownGalIdle2, sprShadowFigure1, sprShadowFigure2, sprShadowFigure3, sprShadowFigure4);

viewWidth =	camera_get_view_width(view_camera[0]);
viewHeight = camera_get_view_height(view_camera[0]);
display_set_gui_size(viewWidth, viewHeight);