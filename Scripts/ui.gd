extends CanvasLayer

static var image = load("res://Graphics/PNG/playerShip2_orange.png")


func set_health(amount):
	#Remove all children
	for child in $MarginContainer2/HBoxContainer.get_children():
		child.queue_free()
	
	#Add new children set by health	
	for i in amount:
		var texRect = TextureRect.new()
		texRect.texture = image
		texRect.custom_minimum_size = Vector2(50, 50)
		
		texRect.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
		texRect.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		
		texRect.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		
		texRect.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		
		$MarginContainer2/HBoxContainer.add_child(texRect)
		
func set_score(score): 
	$MarginContainer/Label.text = "Score: " + str(score)
	
func set_laser_count(laser):
	$MarginContainer3/Label.text = "Lasers: " + str(laser)
