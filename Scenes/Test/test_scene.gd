extends Node2D

@onready var moving_sprite: Sprite2D = $moving_sprite # x direction move
@onready var rotating_sprite: Sprite2D = $rotating_sprite # rotating on its spot

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	moving_sprite.position.x += 50 * delta
	rotating_sprite.rotation += 0.785398 * delta
