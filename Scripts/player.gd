extends CharacterBody2D

@export var speed: int = 500

signal laser(pos)

func _ready() -> void:
	position = Vector2(576, 650)


func _process(delta: float) -> void:
	var direction = Input.get_vector("KeyLeft","KeyRight","KeyUp","KeyDown")
	
	velocity = direction * speed 
 
	if Input.is_action_just_pressed("Original"):
		position = Vector2(576, 650)
		
	if Input.is_action_just_pressed("Shoot"):
		laser.emit(position)
	move_and_slide()
