extends CharacterBody2D

@export var speed: int = 500
var can_shoot : bool = true

signal laser(pos)

func _ready() -> void:
	position = Vector2(576, 650)


func _process(delta: float) -> void:
	var direction = Input.get_vector("KeyLeft","KeyRight","KeyUp","KeyDown")

	velocity = direction * speed 
 
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


func _on_laser_timer_timeout() -> void:
	can_shoot = true;
