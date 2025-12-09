extends Area2D

const moving_rate : float = 300.0

var left_edge : float
var right_edge : float
var axis : float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	left_edge = get_viewport_rect().position.x
	right_edge = get_viewport_rect().end.x
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#if Input.is_action_pressed("move_left"):
		#position.x -= moving_rate * delta
		#if position.x < left_edge:
			#position.x = get_viewport_rect().position.x
	#elif Input.is_action_pressed("move_right"):
		#position.x += moving_rate * delta
		#if position.x > right_edge:
			#position.x = get_viewport_rect().end.x
			
func _process(delta: float) -> void:
	axis = Input.get_axis("move_left", "move_right")
	position.x += axis * moving_rate * delta
	position.x = clampf(position.x, left_edge, right_edge)


func _collision_paddle(area: Area2D) -> void:
	print("+1 Point")
