extends KinematicBody2D

onready var anim = $AnimationPlayer
onready var deathParticles = preload("res://DeathParticles.tscn")

enum STATE { ALIVE, DEAD }
enum DIRECTION { LEFT = -1, RIGHT = 1}

const gravity = 400

export var speed = 40
export var direction = DIRECTION.RIGHT

var velocity = Vector2.ZERO
var state = STATE.ALIVE

signal creatureDead
signal creatureHome

func _physics_process(delta: float) -> void:
	anim.play("run")
	velocity.x = speed * direction
	velocity.y += delta * gravity
	move_and_slide(velocity, Vector2(0, 0), true, 4, 0.785398, false)
	if direction == DIRECTION.LEFT:
		$Sprite.flip_h = true
	elif direction == DIRECTION.RIGHT:
		$Sprite.flip_h = false
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		var collider = collision.collider
		if collider.is_in_group("frame"):
			velocity.x *= -1
		if collider.is_in_group("lava"):
			state = STATE.DEAD
			var death = deathParticles.instance()
			get_parent().add_child(death)
			death.global_position = global_position
			queue_free()
			emit_signal("creatureDead")
		if collider.is_in_group("world") || collider.is_in_group("trees"):
			velocity.y = 0
		if collider.is_in_group("home"):
			emit_signal("creatureHome")
