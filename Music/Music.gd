extends AudioStreamPlayer

func _ready() -> void:
	stream = preload("res://Graphics/Fonts&sounds/GamePlay.mp3")
func _process(delta: float) -> void:
	if not playing:
		play()
