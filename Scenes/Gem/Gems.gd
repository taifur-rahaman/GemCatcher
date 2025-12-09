extends Area2D

class_name GEM

var falling_rate : float = randf_range(40, 200)
var x_axis : float
var y_axis : float


func dead() -> void:
	set_process(false)
	queue_free()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var screen_size = get_viewport_rect().size
	y_axis = screen_size.y
	x_axis = screen_size.x
	
	print("My parent is ", get_parent().name)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y += falling_rate * delta

	if position.y > y_axis:
		print("Game Over")
		get_parent().stop_all()
		dead()

func _collision_gem(area: Area2D) -> void:
	dead()
