extends Area2D

var speed 
var direction
var rotation_speed

signal collision

func _ready() -> void:
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

func _on_body_entered(_body: Node2D) -> void:
	queue_free()
	collision.emit()
	
