// Checking keyboard inputs
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);

// Calculate horizontal movement
var move = key_right - key_left;
hsp = move * walksp;

if (jumpCount < 1) && (key_jump)
{
	vsp = -jumpHeight;
	jumpCount += 1;
	instance_create_layer(x, y - (sprite_height/2), "PlayerInstances", oJumpDust);
}
// Reset jump count if you touch the ground
if (place_meeting(x, y+1, oWall)) {
	jumpCount = 0;
}
vsp += grav;

//Horizontal Collision
if (place_meeting(x + hsp, y, oWall)) 
{
	while (!place_meeting(x + sign(hsp), y, oWall))
	{
		x += sign(hsp);
	}
	hsp = 0;
}
x += hsp;


// Vertical Collision
if (place_meeting(x, y + vsp, oWall)) 
{
	while (!place_meeting(x, y + sign(vsp), oWall))
	{
		y += sign(vsp);
	}
	vsp = 0;
}
y += vsp;