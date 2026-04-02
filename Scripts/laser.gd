extends Area2D
@export var speed = 500

static var score:int = 0

func _ready() -> void:
	var tween = create_tween()
	tween.tween_property($LaserImage, 'scale', Vector2(1, 1), 0.5).from(Vector2(0, 0))
	
func _process(delta: float) -> void:
	position.y -= speed * delta
	
func _on_area_entered(area: Area2D) -> void: 
	score += 1 
	Global.score = score
	get_tree().call_group("ui", "set_score", score)
