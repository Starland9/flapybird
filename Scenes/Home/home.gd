extends Control

@onready var bird_anim := $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bird_anim.play("bird_translation")




func _on_launch_button_button_up() -> void:
	var __ = get_tree().change_scene_to_file("res://Scenes/Game/game.tscn")
