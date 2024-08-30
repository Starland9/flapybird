extends RigidBody2D
class_name Bird


@onready var animation = $AnimatedSprite2D
@onready var hit_sound = $HitSound

var jump_force = 500

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation.play("fly")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	apply_central_impulse(Vector2.RIGHT * 0.5)
	
	if Input.is_action_just_pressed("ui_accept"):
		apply_central_impulse(Vector2.UP * jump_force)
		

func _on_hit_area_body_entered(body: Node2D) -> void:
	if body is Pipe:
		hit_sound.play()

func _input(event: InputEvent) -> void:
	
	if event is InputEventScreenTouch:
		apply_central_impulse(Vector2.UP * jump_force / 2)
