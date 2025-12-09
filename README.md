
# Gem Catcher

A Game using Godot 4.5.1 Engine. A simple 2D arcade Game where the player moves a paddle horizontally to catch falling gems.

## Features

1. Gem Spawning
   - Gems are instantiated at a fixed height above the viewable screen.
   - The X position is randomized within the screen margins to ensure gems stay visible.

2. Dynamic Falling Mechanics
   - Each gem is assigned a random falling speed (`falling_rate`) between 40 and 200 upon creation.
   - Gems are destroyed automatically if they leave the bottom of the screen.

3. Player Movement
   - The paddle is controlled via keyboard input.
   - Movement is clamped to the screen edges so the paddle cannot leave the viewport.

4. Scoring and Game Over
   - Catching a gem triggers a console message: "+1 Point".
   - Letting a gem fall past the screen triggers a console message: "Game Over".

## DevLog

***DevLog 0.0.5***
- Added Stop Game functionality when Gem Falls off the Screen.
	- Everything including Falling Gems and Paddle stop moving

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

## Notes

 This project relies on Godot's Scene system. The scripts must be attached to their respective nodes (`Node2D` for Game, `Area2D` for Paddle/Gems).
- To play, ensure your Project Settings > Input Map has actions defined for `move_left` and `move_right`.
- Scoring and Game Over states currently print to the Output console (Debug).
