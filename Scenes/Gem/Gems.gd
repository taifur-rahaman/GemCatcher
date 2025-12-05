extends Area2D

const falling_rate : float = 100.0
var screen_width : float
var screen_height : float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var screen_size = get_viewport_rect().size
	screen_height = screen_size.y
	screen_width = screen_size.x

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y += falling_rate * delta

	if position.y > screen_height:
		print("Gem Off of the screen")
		set_process(false)
		queue_free() 
