extends Node2D

const GEM = preload("res://Scenes/Gem/Gems.tscn")
# const EXPLODE = preload("res://Assets/explode.wav")

@onready var timer: Timer = $Timer
@onready var paddle: Area2D = $Paddle
@onready var sound_bg: AudioStreamPlayer = $Sound_BG
@onready var sound_collision: AudioStreamPlayer2D = $Sound_Collision

var left_edge : float
var right_edge : float
var spawn_height : float = -50.0 # spawn height is above screen
var edge_margin : float = 50

func _ready() -> void:
	# -50 & +50 because don't want the gem to spawn on the screen edges
	left_edge = get_viewport_rect().position.x + edge_margin
	right_edge = get_viewport_rect().end.x - edge_margin

func spawn_gem() -> void:
	var new_gem = GEM.instantiate()
	var random_x = randf_range(left_edge, right_edge)
	new_gem.position = Vector2(random_x, spawn_height)
	add_child(new_gem)

func stop_all() -> void:
	sound_bg.stop()
	sound_collision.play()
	timer.stop()
	paddle.set_process(false)
	for child in get_children():
		if child is GEM:
			child.set_process(false)

func _on_timer_timeout() -> void:
	spawn_gem()
