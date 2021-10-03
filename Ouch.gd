extends Control

onready var creature = get_node("../../Creature")

var creatureDead = false

func _ready() -> void:
	creature.connect("creatureDead", self, "on_creature_dead")

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("restart"):
		if creatureDead:
			get_tree().reload_current_scene()

func on_creature_dead():
	visible = true
	creatureDead = true
