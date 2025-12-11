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

func score() -> void:
	var score = get_parent().score_label
	var new_score = int(score.text) + 1
	score.text = "%03d" %new_score

func _process(delta: float) -> void:
	axis = Input.get_axis("move_left", "move_right")
	position.x += axis * moving_rate * delta
	position.x = clampf(position.x, left_edge, right_edge)

func _collision_paddle(area: Area2D) -> void:
	var c_sound = get_parent().sound_collision
	c_sound.position = area.position
	c_sound.play()
	score()
