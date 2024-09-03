extends StaticBody2D
class_name Pipe

signal bird_passed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.




func _on_bird_good_zone_body_entered(body: Node2D) -> void:
	if body is Bird:
		bird_passed.emit()
