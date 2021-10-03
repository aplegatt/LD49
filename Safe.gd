extends Control

onready var creature = get_node("../../Creature")

export var nextLevel: String

var creatureHome = false

func _ready() -> void:
	creature.connect("creatureHome", self, "on_creature_home")

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("touch"):
		if creatureHome:
			get_tree().change_scene(nextLevel)

func on_creature_home():
	visible = true
	creatureHome = true
