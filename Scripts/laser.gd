extends Area2D
@export var speed = 500
var hit : bool = false

func _ready() -> void:
	var tween = create_tween()
	tween.tween_property($LaserImage, 'scale', Vector2(1, 1), 0.5).from(Vector2(0, 0))
	
func _process(delta: float) -> void:
	if not hit:
		position.y -= speed * delta
	
func _on_area_entered(area: Area2D) -> void: 
	if hit:
		return

	hit = true
	Global.laserCount += 1
	area.queue_free()

	$LaserImage.visible = false
	$CollisionShape2D.set_deferred("disabled", true)
	set_deferred("monitoring", false)

	Global.score += 1
	get_tree().call_group("ui", "set_score", Global.score)

	$GPUParticles2D.global_position = global_position
	$GPUParticles2D.emitting = true

	await get_tree().create_timer(0.5).timeout
	queue_free()
