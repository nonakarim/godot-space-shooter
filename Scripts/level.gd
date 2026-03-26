extends Node2D

var MeteorScene : PackedScene = load("res://Scenes/meteors.tscn")
var LaserScene : PackedScene = load("res://Scenes/laser.tscn")

var textures = [
	load("res://Graphics/PNG/Meteors/meteorBrown_big2.png"),
	load("res://Graphics/PNG/Meteors/meteorBrown_med3.png"), 
	load("res://Graphics/PNG/Meteors/meteorGrey_big4.png"),
	load("res://Graphics/PNG/Meteors/meteorGrey_med2.png")
]

func _on_meteor_timer_timeout() -> void:
	var meteor = MeteorScene.instantiate()
	
	meteor.get_node("MeteorImage").texture = textures[randi() % 4]
	
	$Meteors.add_child(meteor);


func _on_player_laser(pos) -> void:
	var laser = LaserScene.instantiate()
	laser.position = pos
	$Lasers.add_child(laser)
