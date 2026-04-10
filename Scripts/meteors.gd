extends Area2D

var speed 
var direction
var rotation_speed

signal collision

func _ready() -> void:
	$AudioStreamPlayer2D.stream = preload("res://Graphics/Fonts&sounds/hit (2).mp3")
	var rng := RandomNumberGenerator.new()
	var width = get_viewport().get_visible_rect().size[0]
	var random_x = rng.randi_range(0, width)
	var random_y = rng.randi_range(-200, -100)
	
	position = Vector2(random_x, random_y)
	speed = rng.randi_range(300, 580)
	direction = rng.randi_range(-1, 1)
	rotation_speed = rng.randi_range(30, 50)

func _process(delta: float) -> void:
	position += Vector2(direction, 1.0) * speed * delta
	rotation_degrees += rotation_speed * delta;
	
	if position.y > get_viewport_rect().size.y or position.x > get_viewport_rect().size.x:
		queue_free()

func _on_body_entered(_body: Node2D) -> void:
	$MeteorImage.visible = false
	collision.emit()
	$AudioStreamPlayer2D.play()
	await get_tree().create_timer(1.33).timeout
	
