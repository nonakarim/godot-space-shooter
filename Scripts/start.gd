extends Area2D

func _ready() -> void:
	$Sprite2D.position.y = $startButton.position.y

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			if shape_idx == 5:
				get_tree().change_scene_to_file("res://Scenes/level.tscn")
			elif shape_idx == 1:
				get_tree().quit()
				
				
func _process(delta: float) -> void:
	if $Sprite2D.position.y == $startButton.position.y:
		$startButton.texture = load("res://Graphics/PNG/start-red.png")
		$Exit.texture= load("res://Graphics/PNG/Exit-gray.png")
	if $Sprite2D.position.y == $Exit.position.y:
		$Exit.texture = load("res://Graphics/PNG/Exit-red.png")
		$startButton.texture= load("res://Graphics/PNG/start-gray.png")
		
	if Input.is_action_pressed("KeyDown"):
		$Sprite2D.position.y = $Exit.position.y
	elif Input.is_action_pressed("KeyUp"):
		$Sprite2D.position.y = $startButton.position.y
	elif Input.is_action_pressed("Enter"):
		if $Sprite2D.position.y == $startButton.position.y:
			get_tree().change_scene_to_file("res://Scenes/level.tscn")
		elif $Sprite2D.position.y == $Exit.position.y:
			get_tree().quit()
