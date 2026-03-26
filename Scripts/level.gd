extends Node2D

var MeteorScene : PackedScene = load("res://Scenes/meteors.tscn")
var LaserScene : PackedScene = load("res://Scenes/laser.tscn")

var textures = [
	load("res://Graphics/PNG/Meteors/meteorBrown_big2.png"),
	load("res://Graphics/PNG/Meteors/meteorBrown_med3.png"), 
	load("res://Graphics/PNG/Meteors/meteorGrey_big4.png"),
	load("res://Graphics/PNG/Meteors/meteorGrey_med2.png")
]

func _ready() -> void:
	var size = get_viewport().get_visible_rect().size
	var rng = RandomNumberGenerator.new()
	
	for star in $Stars.get_children():
		var rand_x = rng.randi_range(0, size.x)
		var rand_y = rng.randi_range(0, size.y)
		
		star.position = Vector2(rand_x, rand_y)

func _on_meteor_timer_timeout() -> void:
	var meteor = MeteorScene.instantiate()
	
	meteor.get_node("MeteorImage").texture = textures[randi() % 4]
	
	$Meteors.add_child(meteor);


func _on_player_laser(pos) -> void:
	var laser = LaserScene.instantiate()
	laser.position = pos
	$Lasers.add_child(laser)
