extends Node2D

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("touch"):
		get_tree().change_scene("res://Level1.tscn")
