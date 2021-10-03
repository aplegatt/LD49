extends AudioStreamPlayer2D

onready var creature = get_node("../Creature")
onready var music = load("res://sfx/lemmini.wav")
onready var deadMusic = load("res://sfx/ouch.wav")
onready var safeMusic = load("res://sfx/safe.wav")

func _ready() -> void:
	creature.connect("creatureDead", self, "on_creature_dead")
	creature.connect("creatureHome", self, "on_creature_home")
	stream = music
	play()

func on_creature_dead():
	stream = deadMusic
	play()

func on_creature_home():
	stream = safeMusic
	play()
