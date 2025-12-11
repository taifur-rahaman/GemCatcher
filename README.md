
# Gem Catcher Game

A simple arcade-style game built with Godot Engine where players control a paddle to catch falling gems. Miss a gem and it's game over! Score points by catching as many gems as possible.

## Features

1.  **Dynamic Gem Spawning**
    
    -   Gems spawn at random horizontal positions above the screen.
    -   Each gem falls at a random speed between 40-200 pixels per second.
    -   Continuous spawning controlled by a timer for increasing difficulty.
2.  **Paddle Control**
    
    -   Smooth left/right movement using keyboard input.
    -   Movement is clamped to screen boundaries to prevent going off-screen.
    -   Responsive controls with consistent movement speed (300 pixels/second).
3.  **Scoring System**
    
    -   Score increases by 1 for each gem caught.
    -   Score displayed in 3-digit format (e.g., 000, 001, 025).
    -   Real-time score updates during gameplay.
4.  **Audio Feedback**
    
    -   Background music plays during gameplay.
    -   Collision sound effect when paddle catches a gem.
    -   Sound positioned at gem location for spatial audio effect.
5.  **Game Over System**
    
    -   Game ends when a gem reaches the bottom of the screen.
    -   All game elements stop (music, spawning, movement).
    -   Game over label displays to indicate end of game.

## DevLog
### DevLog 0.0.6
-   Added Score Counting System
-   Added Game Over Label

### DevLog 0.0.5

-   Added Stop Game functionality when a gem falls off the screen
    -   All elements, including falling gems and the paddle, stop moving
-   Added Background sound
    -   Made it so that It automatically plays when Game starts
-   Added Collision sound
    -   Made it so that It only sounds when the Gem Falls onto the Paddle
    -   When Game Over the Background Music stops and one final Explosion sound happen

### DevLog 0.0.4

-   Preloaded the Gem class in the Game Scene
-   Added a 2-second timer for each gem to fall
-   Spawned gem objects at runtime
-   Added functionality to spawn gems at different x-axis positions
-   Made gems fall from outside the screen
-   Added variable falling speed functionality

### DevLog 0.0.3

-   Limited paddle movement to within the screen
-   Removed the upper body of the gem when it falls
-   Removed gem objects completely to free up RAM using `queue_free()`
-   Removed gems when they collide with the paddle

### DevLog 0.0.2

-   Added movement functionality to the paddle
-   Added falling functionality to gems
-   Added collision functionality to the paddle
-   Added collision functionality to gems

### DevLog 0.0.1

-   Added a game background
-   Created a paddle
-   Created a gem

## How It Works

### Game Structure

The game consists of three main scripts:

**Game.gd** (Main Game Controller)
-   Manages gem spawning with timer-based intervals
-   Handles screen boundaries and spawn positions
-   Controls game over state and stops all processes
-   Manages audio (background music and collision sounds)

**Gems.gd** (Falling Gem Logic)
-   Each gem is an Area2D node with random falling speed
-   Checks for bottom-of-screen collision (triggers game over)
-   Handles collision with paddle (increments score)
-   Self-destructs when caught or missed

**Paddle.gd** (Player Control)
-   Reads left/right input axis for smooth movement
-   Uses `clampf()` to keep paddle within screen bounds
-   Detects gem collisions and triggers score updates
-   Plays collision sound at gem position

## Project Structure
```
res://
├── README.md
├── Assets/
├── Scenes/
│   └── Game							# Game control
|			└── Game.gd
|			└── Game.tscn
│   ├── Gems							# Gems control
|			└── Gems.gd
|			└── Gems.tscn          
│   └── Paddle							# Paddle control
|			└── Paddle.gd
|			└── Paddle.tscn             
```

## Controls

-   **Left Arrow / A** - Move paddle left
-   **Right Arrow / D** - Move paddle right

## Setup Instructions
1.  **Open the project in Godot Engine** (version 4.x recommended)
2.  **Configure Input Map** (Project → Project Settings → Input Map):
    
    -   `move_left` - Bind to Left Arrow and A key
    -   `move_right` - Bind to Right Arrow and D key
3.  **Scene Setup Requirements**:
    -   Main scene must contain:
        -   Timer node (for gem spawning)
        -   Paddle (Area2D)
        -   AudioStreamPlayer for background music
        -   AudioStreamPlayer2D for collision sounds
        -   Label for score display
        -   Label for game over message
4.  **Gem Scene** (Gems.tscn):
    
    -   Must be an Area2D node
    -   Should have visual sprite/shape
    -   Connect `area_entered` signal to `_collision_gem` function
5.  **Paddle Scene**:
    
    -   Area2D node with collision shape
    -   Connect `area_entered` signal to `_collision_paddle` function
6.  **Run the game** from the main scene (Game.tscn)
    

## Game Flow

1.  Game starts with background music playing
2.  Timer begins spawning gems at regular intervals
3.  Player moves paddle left/right to catch gems
4.  Each caught gem:
    -   Plays collision sound
    -   Increments score by 1
    -   Destroys the gem
5.  If a gem reaches the bottom:
    -   Game over label appears
    -   All movement stops
    -   Background music stops
    -   Collision sound plays

## Technical Details

### Constants

-   `moving_rate`: 300.0 pixels/second (paddle speed)
-   `edge_margin`: 50 pixels (spawn area padding)
-   `spawn_height`: -50.0 pixels (above screen)
-   `falling_rate`: 40-200 pixels/second (random per gem)

### Node References

```gdscript
@onready var timer: Timer = $Timer
@onready var paddle: Area2D = $Paddle
@onready var sound_bg: AudioStreamPlayer = $Sound_BG
@onready var sound_collision: AudioStreamPlayer2D = $Sound_Collision
@onready var score_label: Label = $ScoreLabel
@onready var game_over_label: Label = $GameOverLabel
```

## Notes

-   Built for Godot Engine 4.5.x (uses new syntax like `@onready` and typed variables)
-   The explode sound asset is referenced but currently commented out
-   Game over is triggered only by missed gems, not by time limit
-   Paddle cannot go off-screen due to `clampf()` boundary clamping
-   Each gem has independent falling speed for varied gameplay
-   Commented-out alternative paddle movement code available (discrete key press method)

## Future Enhancement Ideas

-   Add difficulty progression (faster spawn rate over time)
-   Implement lives system (3 strikes instead of instant game over)
-   Add power-ups (slow motion, double points, wider paddle)
-   Create high score tracking and persistence
-   Add particle effects for gem catches
-   Implement combo system for consecutive catches
-   Add different gem types with varying point values
-   Include pause functionality
-   Add restart button after game over
-   Create main menu and level selection
