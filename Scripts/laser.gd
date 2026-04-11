extends Area2D
@export var speed = 500


func _ready() -> void:
	var tween = create_tween()
	tween.tween_property($LaserImage, 'scale', Vector2(1, 1), 0.5).from(Vector2(0, 0))
	
func _process(delta: float) -> void:
	position.y -= speed * delta
	
func _on_area_entered(area: Area2D) -> void: 
	Global.laserCount += 1
	area.queue_free()
	queue_free()  
	Global.score += 1 
	get_tree().call_group("ui", "set_score", Global.score)
