# Gem Catcher

A Game using Godot 4.5.1 Engine. A simple 2D arcade Game where the player moves a paddle horizontally to catch falling gems.

## DevLog

***DevLog 0.0.5***
- Added Stop Game functionality when a gem falls off the screen
	- All elements, including falling gems and the paddle, stop moving
- Added Background sound
	- Made it so that It automatically plays when Game starts
- Added Collision sound
	- Made it so that It only sounds when the Gem Falls onto the Paddle

***DevLog 0.0.4***
- Preloaded the Gem class on Game Scene
- Added a 2 seconds timer for each Gem to fall
- Spawning Gem objects on runtime
- Added functionality of spawning Gem on different x-axis
- Making the Gem fall from outside the Screen
- Added a variable falling speed functionality

***DevLog 0.0.3***
- Limited Paddle movement inside the screen
- Removing the upper body of the Gem when fall
- Removing the Gem object completely to freeing up RAM using `queue_free()`
- Removing the Gem when Collided with Paddle

***DevLog 0.0.2***
- Added movement functionalities to Paddle
- Added falling functionalities to Gem
- Added collision functionality to Paddle
- Added collision functionality to Gem

***DevLog 0.0.1***
- Added a Game Background
- Created a Paddle
- Created a Gem
