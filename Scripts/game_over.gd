extends Control

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Replay"):
		get_tree().change_scene_to_file("res://Scenes/level.tscn")
