extends RigidBody2D
class_name Bird

signal hit

@onready var animation = $AnimatedSprite2D
@onready var hit_sound = $HitSound

@export var for_presentation := false

var jump_force := 500.0
var can_fly := true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation.play("fly")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if position.y > 2000:
		_die()
		
func _die():
	get_tree().change_scene_to_file("res://Scenes/Home/home.tscn")

func _integrate_forces(_state: PhysicsDirectBodyState2D) -> void:
	if not for_presentation:
		apply_central_impulse(Vector2.RIGHT * 0.5)
	
	if Input.is_action_just_pressed("ui_accept") and can_fly:
		apply_central_impulse(Vector2.UP * jump_force)

func _on_hit_area_body_entered(body: Node2D) -> void:
	if body is Pipe:
		hit_sound.play()
		can_fly = false
		hit.emit()

func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch and can_fly:
		apply_central_impulse(Vector2.UP * jump_force / 2)
