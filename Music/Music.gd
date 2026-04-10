extends AudioStreamPlayer

func _ready() -> void:
	stream = preload("res://Graphics/Fonts&sounds/GamePlay.mp3")
	play()
