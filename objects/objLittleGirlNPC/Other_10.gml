/// @description Exetend the second alarm time
if (!waiting) {
	alarm[2] += (15 * room_speed);
	waiting = true;
	show_debug_message("Added 15 seconds")
}