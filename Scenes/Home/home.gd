extends Control

@onready var bird_anim := $AnimationPlayer
@onready var high_score_label := $Score

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bird_anim.play("bird_translation")
	var high_score = ScoreManager.load_score()
	if high_score > 0:
		high_score_label.show()
		high_score_label.text = "high Score\n" + str(high_score)
	else :
		high_score_label.hide()


func _on_launch_button_button_up() -> void:
	var __ = get_tree().change_scene_to_file("res://Scenes/Game/game.tscn")
