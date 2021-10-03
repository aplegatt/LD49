extends RigidBody2D

onready var anim = $AnimationPlayer

var mouseTouching = false
var prevModulate = Color.white
var isDragged = false

func _ready() -> void:
	anim.play("idle")
	connect("mouse_entered", self, "on_mouse_entered")
	connect("mouse_exited", self, "on_mouse_exited")

func on_mouse_entered():
	mouseTouching = true
	#modulate = Color.red

func on_mouse_exited():
	mouseTouching = false
	#modulate = Color.white
	if sleeping:
		sleeping = false

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("touch"):
		#prevModulate = modulate
		if mouseTouching:
			#modulate = Color.green
			sleeping = true
			rotation_degrees = randi() % 180
			isDragged = true
	if Input.is_action_just_released("touch"):
		#modulate = prevModulate
		sleeping = false
		isDragged = false

func _physics_process(delta: float) -> void:
	if isDragged:
		anim.stop()
		anim.seek(0, true)
		global_transform.origin = get_global_mouse_position()
		linear_velocity = Vector2(0,0)
