extends Control

func _ready() -> void:
	$Score.text += str(Global.score)
	Global.laserCount = 10
	Global.health = 3
	Music.playing = false
	$AudioStreamPlayer2D.play()

func _process(delta: float) -> void:
	Music.playing = false
		
	if Input.is_action_just_pressed("Replay"):
		Music.play()
		get_tree().change_scene_to_file("res://Scenes/level.tscn")
	elif Input.is_action_just_pressed("exit"):
		get_tree().quit()
		
