extends Node2D


@onready var bird = $Player/Bird
@onready var pipes = $Pipes
@onready var bird_passed_sound = $BirdPassesSound
@onready var score_label = $HUD/Score

const pipe_scene = preload("res://Objects/Pipe/pipe.tscn")

var last_pipe_pos = Vector2.ZERO
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	_spawn_pipe(1200, randf_range(-200, 200))
	bird.dead.connect(_on_bird_dead)


func _spawn_pipe(dist_x: float, dist_y: float) -> void:
	var pipe = pipe_scene.instantiate()
	pipes.call_deferred("add_child", pipe)
	pipe.bird_passed.connect(_on_pipe_bird_passed)
	pipe.position.x = last_pipe_pos.x + dist_x
	pipe.position.y = dist_y
	last_pipe_pos = pipe.position


func _on_time_for_pipe_timeout() -> void:
	_spawn_pipe(randf_range(400, 800), randf_range(-200, 200))
	_spawn_pipe(randf_range(400, 800), randf_range(600, 1200))

func _on_pipe_bird_passed():
	bird_passed_sound.play()
	score += 1
	score_label.text = str(score)

func _on_bird_dead():
	ScoreManager.save_score(score)
	get_tree().change_scene_to_file("res://Scenes/Home/home.tscn")