extends AudioStreamPlayer2D

onready var creature = get_node("../Creature")
onready var fireSound = load("res://sfx/fire.wav")

func _ready() -> void:
	creature.connect("creatureDead", self, "on_creature_dead")

func on_creature_dead():
	stream = fireSound
	play()
