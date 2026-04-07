extends CharacterBody2D

@export var speed: int = 500
var can_shoot : bool = true
var pos

signal laser(pos)

func _ready() -> void:
	position = Vector2(576, 650)


func _process(delta: float) -> void:
	var direction = Input.get_vector("KeyLeft","KeyRight","KeyUp","KeyDown")

	velocity = direction * speed 
	if not Global.health <= 0 and Global.laserCount > 0:
		pos = position
 
	if Input.is_action_just_pressed("Original"):
		position = Vector2(576, 650)
		
	if Input.is_action_just_pressed("Shoot") and can_shoot and Global.laserCount > 0:
		Global.laserCount -= 1
		laser.emit($LaserStartPosition.global_position)
		can_shoot = false;
		$LaserTimer.start()
		$Laser_Sound.play()
		
	get_tree().call_group("ui", "set_laser_count", Global.laserCount)
	move_and_slide()
	
	if Global.laserCount == 0 or Global.health <= 0:
		position = pos
		$PlayerImage.visible = false
		$GPUParticles2D2.local_coords = true
		$GPUParticles2D.emitting = false
		$GPUParticles2D2.emitting = true
		await get_tree().create_timer(2.0).timeout
		get_tree().change_scene_to_file("res://Scenes/Game over.tscn")


func _on_laser_timer_timeout() -> void:
	can_shoot = true;
