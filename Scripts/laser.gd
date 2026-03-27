extends Area2D
@export var speed = 500

func _ready() -> void:
	$LaserImage.scale = Vector2(0, 0)
	var tween = create_tween()
	tween.tween_property($LaserImage, 'scale', Vector2(1, 1), 0.5)
	
func _process(delta: float) -> void:
	position.y -= speed * delta
