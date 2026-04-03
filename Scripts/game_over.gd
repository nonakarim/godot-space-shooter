extends Control

func _ready() -> void:
	$Score.text += str(Global.score)
	Global.laserCount = 10

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Replay"):
		get_tree().change_scene_to_file("res://Scenes/level.tscn")
		
